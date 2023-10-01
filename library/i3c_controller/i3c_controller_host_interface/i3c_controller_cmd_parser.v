// ***************************************************************************
// ***************************************************************************
// Copyright 2023 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************
/**
 * Parse commands.
 * When the first command indicates a pair command (e.g. CCC), await next
 * command to complete request (e.g. add CCC ID to parsed CCC command).
 * If it is a simple command (e.g. private transfer), a "blank" command
 * is not required.
 * cmdr (Command receipts) are transfered at the end of a transer, with
 * updated lenght field indicating the number of bytes actually transfered,
 * since the peripheral shall cancel the transfer.
 */

`timescale 1ns/100ps
`default_nettype wire

module i3c_controller_cmd_parser (
  input  clk,
  input  reset_n,

  // Command FIFO

  output cmd_ready,
  input  cmd_valid,
  input  [31:0] cmd,

  input  cmdr_ready,
  output cmdr_valid,
  output [31:0] cmdr,

  // Command parsed

  output        cmdp_valid,
  input         cmdp_ready,
  output        cmdp_ccc,
  output        cmdp_ccc_bcast,
  output [6:0]  cmdp_ccc_id,
  output        cmdp_bcast_header,
  output [1:0]  cmdp_xmit,
  output        cmdp_sr,
  output [11:0] cmdp_buffer_len,
  output [6:0]  cmdp_da,
  output        cmdp_rnw,
  input         cmdp_cancelled,

  input  rd_bytes_ready,
  output rd_bytes_valid,
  input  wr_bytes_ready,
  output wr_bytes_valid,
  input  [11:0] wr_bytes_lvl
);
  wire [11:0] cmdr1_len;
  wire buffer_len_valid;
  reg  [31:0] cmdr1;
  reg  [7:0]  cmdr2;
  reg  cmdp_cancelled_reg;

  reg [3:0] cmdr_error;
  reg [7:0] cmdr_sync;

  localparam [3:0]
    NO_ERROR  = 4'd0,
    CE0_ERROR = 4'd1,
    CE2_ERROR = 4'd3,
    NACK_RESP = 4'd9;

  localparam [6:0]
    CCC_ENTDAA = 'h07;

  reg [2:0] sm;
  localparam [2:0]
    receive          = 0,
    buffer_setup     = 1,
    xfer_await       = 2,
    xfer_await_ready = 3,
    ccc_await        = 4,
    receipt          = 5;

  always @(posedge clk) begin
    if (!reset_n) begin
      sm  <= receive;
      cmdr_error <= NO_ERROR;
      cmdr_sync  <= 8'd0;
    end else begin
      case (sm)
        receive: begin
          cmdr_error <= NO_ERROR;
          cmdr1 <= cmd;
          cmdr2 <= 8'd0;
          if (cmd_valid) begin
            sm <= buffer_setup;
          end else begin
            sm <= receive;
          end
          cmdp_cancelled_reg <= 1'b0;
        end
        buffer_setup: begin
          if ((rd_bytes_ready & !cmdp_rnw) | (wr_bytes_ready & cmdp_rnw)) begin
            sm <= cmdp_ccc ? ccc_await : xfer_await;
          end else begin
            sm <= sm;
          end
        end
        xfer_await: begin
          sm <= cmdp_ready ? xfer_await_ready : sm;
        end
        xfer_await_ready: begin
          if (cmdp_ready) begin
            sm <= cmdp_ccc_id == CCC_ENTDAA ? receive : receipt; // DAA does not throw cmdr
            // TODO: implement NACK_RESP error, for that, need to differentiate bcast
            // address from da address ack (or drop it and handle any NACK as
            // CE2).
            if (cmdp_cancelled_reg) begin
              cmdr_error <= CE0_ERROR;
            end else if (cmdp_ccc & |wr_bytes_lvl) begin
              cmdr_error <= CE2_ERROR;
            end
          end
          if (cmdp_cancelled) begin
            cmdp_cancelled_reg <= cmdp_cancelled;
          end
        end
        ccc_await: begin
          cmdr2 <= cmd[7:0];
          if (cmd_valid) begin
            sm <= xfer_await;
          end
        end
        receipt: begin
          if (cmdr_ready) begin
            sm <= receive;
            cmdr_sync <= cmdr_sync + 1;
          end
        end
        default: begin
          sm <= receive;
        end
      endcase
    end
  end

  assign cmd_ready    = (sm == receive || sm == ccc_await) & reset_n;
  assign cmdp_valid   = sm == xfer_await & reset_n;

  assign cmdp_ccc              = cmdr1[30];
  assign cmdp_ccc_bcast        = cmdr2[7];
  assign cmdp_ccc_id           = cmdr2[6:0];
  assign cmdp_bcast_header     = cmdr1[29];
  assign cmdp_xmit             = cmdr1[28:27];
  assign cmdp_buffer_len       = cmdr1[23:12];
  assign cmdp_sr               = cmdr1[25];
  assign cmdp_da               = cmdr1[07:01];
  assign cmdp_rnw              = cmdr1[00];

  assign cmdr = {4'd0, cmdr_error, 4'd0, cmdr1_len, cmdr_sync};
  assign cmdr_valid = sm == receipt;

  assign buffer_len_valid = sm == buffer_setup;
  assign rd_bytes_valid = buffer_len_valid & ~cmdp_rnw;
  assign wr_bytes_valid = buffer_len_valid &  cmdp_rnw;
  // For read bytes (write to peripheral), it is either all transfered or none,
  // since the peripheral can only reject during the address ACK.
  // For write bytes (read from peripheral), the peripheral shall cancel
  // before finishing the transfer.
  assign cmdr1_len = cmdp_rnw ? cmdp_buffer_len - wr_bytes_lvl : (cmdp_cancelled_reg ? 12'd0 : cmdp_buffer_len);
endmodule
