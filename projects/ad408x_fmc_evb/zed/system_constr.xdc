set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports dco_p]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports dco_n]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports da_p]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports da_n]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS25} [get_ports gpio0_fmc]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS25} [get_ports sclk_src]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS25} [get_ports gp0_dir]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS25} [get_ports gp3_dir]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS25} [get_ports en_psu]
set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS25} [get_ports pwrgd]
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS25} [get_ports pd_v33b]

set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports fpgaclk_p]
set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports fpgaclk_n]

#set_property  -dict {PACKAGE_PIN M19  IOSTANDARD LVDS_25                } [get_ports fpga_cnvp   ] ; #   LA00_CC_P   G6   IO_L13P_T2_MRCC_34
#set_property  -dict {PACKAGE_PIN M20  IOSTANDARD LVDS_25                } [get_ports fpga_cnvn   ] ; #   LA00_CC_N   G7   IO_L13N_T2_MRCC_34

set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports db_p]
set_property -dict {PACKAGE_PIN P22 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports db_n]
set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS25} [get_ports cs_n_src]
set_property -dict {PACKAGE_PIN J22 IOSTANDARD LVCMOS25} [get_ports sdio_src]
set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS25} [get_ports gp2_dir]
set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS25} [get_ports osc_en]
set_property -dict {PACKAGE_PIN J20 IOSTANDARD LVCMOS25} [get_ports doc_fmc]
set_property -dict {PACKAGE_PIN K21 IOSTANDARD LVCMOS25} [get_ports dod_fmc]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS25} [get_ports pbio[0]] ; #   LA19_N      H23  IO_L4N_T0_35
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS25} [get_ports pbio[3]] ; #   LA21_P      H25  IO_L21P_T3_DQS_AD14P_35
set_property -dict {PACKAGE_PIN E20 IOSTANDARD LVCMOS25} [get_ports pbio[4]] ; #   LA21_N      H26  IO_L21N_T3_DQS_AD14N_35
set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS25} [get_ports pbio[1]] ; #   LA20_P      G21  IO_L22P_T3_AD7P_35
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS25} [get_ports pbio[2]] ; #   LA20_N      G22  IO_L22N_T3_AD7N_35
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS25} [get_ports pbio[5]] ; #   LA22_P      G24  IO_L20P_T3_AD6P_35
set_property -dict {PACKAGE_PIN F19 IOSTANDARD LVCMOS25} [get_ports pbio[6]] ; #   LA22_N      G25  IO_L20N_T3_AD6N_35
set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS25} [get_ports pbio[7]] ; #   LA23_P      D23  IO_L3P_T0_DQS_AD1P_35
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS25} [get_ports pbio[8]] ; #   LA23_N      D24  IO_L3N_T0_DQS_AD1N_35

set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports clk_p]
set_property -dict {PACKAGE_PIN N20 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports clk_n]

set_property -dict {PACKAGE_PIN R20 IOSTANDARD LVCMOS25} [get_ports gpio2_fmc]
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS25} [get_ports gpio3_fmc]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS25} [get_ports sdo_1]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS25} [get_ports sclk1]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS25} [get_ports doa_fmc]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS25} [get_ports dob_fmc]
set_property -dict {PACKAGE_PIN L21 IOSTANDARD LVCMOS25} [get_ports ad9508_sync]
set_property -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS25} [get_ports gpio1_fmc]
set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS25} [get_ports gp1_dir]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS25} [get_ports sdin1]
set_property -dict {PACKAGE_PIN K20 IOSTANDARD LVCMOS25} [get_ports cs1_0]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS25} [get_ports cs1_1]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS25} [get_ports adf435x_lock]

# clocks

create_clock -period 2.500 -name dco_clk [get_ports dco_p]

#set input_clock         dco_clk;           # Name of input clock
#set input_clock_period  2.5;               # Period of input clock (full-period)
#set skew_bre            0.000;             # Data invalid before the rising clock edge
#set skew_are            0.000;             # Data invalid after the rising clock edge
#set skew_bfe            0.000;             # Data invalid before the falling clock edge
#set skew_afe            0.000;             # Data invalid after the falling clock edge
#set input_ports         {da_* db_*};       # List of input ports
#
## Input Delay Constraint
#set_input_delay -clock $input_clock -max [expr $input_clock_period/2 + $skew_afe] [get_ports $input_ports];
#set_input_delay -clock $input_clock -min [expr $input_clock_period/2 - $skew_bfe] [get_ports $input_ports];
#set_input_delay -clock $input_clock -max [expr $input_clock_period/2 + $skew_are] [get_ports $input_ports] -clock_fall -add_delay;
#set_input_delay -clock $input_clock -min [expr $input_clock_period/2 - $skew_bre] [get_ports $input_ports] -clock_fall -add_delay;
