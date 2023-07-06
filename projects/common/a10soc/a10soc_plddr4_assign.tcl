###############################################################################
## Copyright (C) 2017-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# pl-ddr4 settings

set_location_assignment PIN_AG5   -to sys_ddr_ref_clk
set_location_assignment PIN_AG6   -to "sys_ddr_ref_clk(n)"

set_instance_assignment -name IO_STANDARD LVDS -to sys_ddr_ref_clk
set_instance_assignment -name INPUT_TERMINATION DIFFERENTIAL -to sys_ddr_ref_clk -disable

set_location_assignment PIN_AK1   -to sys_ddr_clk_p
set_location_assignment PIN_AK2   -to sys_ddr_clk_n
set_location_assignment PIN_AN3   -to sys_ddr_a[0]
set_location_assignment PIN_AM4   -to sys_ddr_a[1]
set_location_assignment PIN_AL3   -to sys_ddr_a[2]
set_location_assignment PIN_AL4   -to sys_ddr_a[3]
set_location_assignment PIN_AL5   -to sys_ddr_a[4]
set_location_assignment PIN_AK5   -to sys_ddr_a[5]
set_location_assignment PIN_AK6   -to sys_ddr_a[6]
set_location_assignment PIN_AJ6   -to sys_ddr_a[7]
set_location_assignment PIN_AK3   -to sys_ddr_a[8]
set_location_assignment PIN_AJ4   -to sys_ddr_a[9]
set_location_assignment PIN_AJ5   -to sys_ddr_a[10]
set_location_assignment PIN_AH6   -to sys_ddr_a[11]
set_location_assignment PIN_AG7   -to sys_ddr_a[12]
set_location_assignment PIN_AJ3   -to sys_ddr_a[13]
set_location_assignment PIN_AH3   -to sys_ddr_a[14]
set_location_assignment PIN_AF7   -to sys_ddr_a[15]
set_location_assignment PIN_AE7   -to sys_ddr_a[16]
set_location_assignment PIN_AF5   -to sys_ddr_ba[0]
set_location_assignment PIN_AH4   -to sys_ddr_ba[1]
set_location_assignment PIN_AG4   -to sys_ddr_bg
set_location_assignment PIN_AM1   -to sys_ddr_cke
set_location_assignment PIN_AM2   -to sys_ddr_cs_n
set_location_assignment PIN_AR1   -to sys_ddr_odt
set_location_assignment PIN_AN2   -to sys_ddr_reset_n
set_location_assignment PIN_AL2   -to sys_ddr_act_n
set_location_assignment PIN_AH2   -to sys_ddr_par
set_location_assignment PIN_AF9   -to sys_ddr_alert_n
set_location_assignment PIN_AG9   -to sys_ddr_dqs_p[0]
set_location_assignment PIN_AG10  -to sys_ddr_dqs_n[0]
set_location_assignment PIN_AN7   -to sys_ddr_dqs_p[1]
set_location_assignment PIN_AM7   -to sys_ddr_dqs_n[1]
set_location_assignment PIN_AR5   -to sys_ddr_dqs_p[2]
set_location_assignment PIN_AP6   -to sys_ddr_dqs_n[2]
set_location_assignment PIN_AW6   -to sys_ddr_dqs_p[3]
set_location_assignment PIN_AV6   -to sys_ddr_dqs_n[3]
set_location_assignment PIN_AA7   -to sys_ddr_dqs_p[4]
set_location_assignment PIN_AA8   -to sys_ddr_dqs_n[4]
set_location_assignment PIN_AE5   -to sys_ddr_dqs_p[5]
set_location_assignment PIN_AE6   -to sys_ddr_dqs_n[5]
set_location_assignment PIN_AA2   -to sys_ddr_dqs_p[6]
set_location_assignment PIN_AA3   -to sys_ddr_dqs_n[6]
set_location_assignment PIN_AH1   -to sys_ddr_dqs_p[7]
set_location_assignment PIN_AG1   -to sys_ddr_dqs_n[7]
set_location_assignment PIN_AG12  -to sys_ddr_dq[0]
set_location_assignment PIN_AJ9   -to sys_ddr_dq[1]
set_location_assignment PIN_AH9   -to sys_ddr_dq[2]
set_location_assignment PIN_AF12  -to sys_ddr_dq[3]
set_location_assignment PIN_AH11  -to sys_ddr_dq[4]
set_location_assignment PIN_AG11  -to sys_ddr_dq[5]
set_location_assignment PIN_AJ8   -to sys_ddr_dq[6]
set_location_assignment PIN_AJ11  -to sys_ddr_dq[7]
set_location_assignment PIN_AK8   -to sys_ddr_dq[8]
set_location_assignment PIN_AL8   -to sys_ddr_dq[9]
set_location_assignment PIN_AK10  -to sys_ddr_dq[10]
set_location_assignment PIN_AL9   -to sys_ddr_dq[11]
set_location_assignment PIN_AN6   -to sys_ddr_dq[12]
set_location_assignment PIN_AK7   -to sys_ddr_dq[13]
set_location_assignment PIN_AM9   -to sys_ddr_dq[14]
set_location_assignment PIN_AL7   -to sys_ddr_dq[15]
set_location_assignment PIN_AR3   -to sys_ddr_dq[16]
set_location_assignment PIN_AU2   -to sys_ddr_dq[17]
set_location_assignment PIN_AP4   -to sys_ddr_dq[18]
set_location_assignment PIN_AP3   -to sys_ddr_dq[19]
set_location_assignment PIN_AN4   -to sys_ddr_dq[20]
set_location_assignment PIN_AU1   -to sys_ddr_dq[21]
set_location_assignment PIN_AP5   -to sys_ddr_dq[22]
set_location_assignment PIN_AT3   -to sys_ddr_dq[23]
set_location_assignment PIN_AU4   -to sys_ddr_dq[24]
set_location_assignment PIN_AW5   -to sys_ddr_dq[25]
set_location_assignment PIN_AU5   -to sys_ddr_dq[26]
set_location_assignment PIN_AV4   -to sys_ddr_dq[27]
set_location_assignment PIN_AW4   -to sys_ddr_dq[28]
set_location_assignment PIN_AR6   -to sys_ddr_dq[29]
set_location_assignment PIN_AR7   -to sys_ddr_dq[30]
set_location_assignment PIN_AT5   -to sys_ddr_dq[31]
set_location_assignment PIN_Y8    -to sys_ddr_dq[32]
set_location_assignment PIN_AB11  -to sys_ddr_dq[33]
set_location_assignment PIN_AB10  -to sys_ddr_dq[34]
set_location_assignment PIN_AB9   -to sys_ddr_dq[35]
set_location_assignment PIN_W8    -to sys_ddr_dq[36]
set_location_assignment PIN_Y10   -to sys_ddr_dq[37]
set_location_assignment PIN_AA9   -to sys_ddr_dq[38]
set_location_assignment PIN_AB7   -to sys_ddr_dq[39]
set_location_assignment PIN_Y6    -to sys_ddr_dq[40]
set_location_assignment PIN_Y7    -to sys_ddr_dq[41]
set_location_assignment PIN_AA5   -to sys_ddr_dq[42]
set_location_assignment PIN_Y5    -to sys_ddr_dq[43]
set_location_assignment PIN_AD4   -to sys_ddr_dq[44]
set_location_assignment PIN_AC6   -to sys_ddr_dq[45]
set_location_assignment PIN_AD5   -to sys_ddr_dq[46]
set_location_assignment PIN_AB6   -to sys_ddr_dq[47]
set_location_assignment PIN_AB4   -to sys_ddr_dq[48]
set_location_assignment PIN_W1    -to sys_ddr_dq[49]
set_location_assignment PIN_Y1    -to sys_ddr_dq[50]
set_location_assignment PIN_AA4   -to sys_ddr_dq[51]
set_location_assignment PIN_Y3    -to sys_ddr_dq[52]
set_location_assignment PIN_AB1   -to sys_ddr_dq[53]
set_location_assignment PIN_Y2    -to sys_ddr_dq[54]
set_location_assignment PIN_AC4   -to sys_ddr_dq[55]
set_location_assignment PIN_AE3   -to sys_ddr_dq[56]
set_location_assignment PIN_AE2   -to sys_ddr_dq[57]
set_location_assignment PIN_AE1   -to sys_ddr_dq[58]
set_location_assignment PIN_AF3   -to sys_ddr_dq[59]
set_location_assignment PIN_AG2   -to sys_ddr_dq[60]
set_location_assignment PIN_AF2   -to sys_ddr_dq[61]
set_location_assignment PIN_AD3   -to sys_ddr_dq[62]
set_location_assignment PIN_AD1   -to sys_ddr_dq[63]
set_location_assignment PIN_AH8   -to sys_ddr_dbi_n[0]
set_location_assignment PIN_AM6   -to sys_ddr_dbi_n[1]
set_location_assignment PIN_AM5   -to sys_ddr_dbi_n[2]
set_location_assignment PIN_AT4   -to sys_ddr_dbi_n[3]
set_location_assignment PIN_AA10  -to sys_ddr_dbi_n[4]
set_location_assignment PIN_AB5   -to sys_ddr_dbi_n[5]
set_location_assignment PIN_AB2   -to sys_ddr_dbi_n[6]
set_location_assignment PIN_AC1   -to sys_ddr_dbi_n[7]
set_location_assignment PIN_AH7   -to sys_ddr_rzq

