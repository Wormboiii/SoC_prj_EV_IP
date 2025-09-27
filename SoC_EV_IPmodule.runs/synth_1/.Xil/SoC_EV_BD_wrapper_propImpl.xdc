set_property SRC_FILE_INFO {cfile:/home/wonhyeok/SoC_EV_IPmodule/SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_clk_wiz_0/SoC_EV_BD_clk_wiz_0.xdc rfile:../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_clk_wiz_0/SoC_EV_BD_clk_wiz_0.xdc id:1 order:EARLY scoped_inst:SoC_EV_BD_i/clk_wiz/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/wonhyeok/SoC_EV_IPmodule/SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_microblaze_riscv_0_0/SoC_EV_BD_microblaze_riscv_0_0.xdc rfile:../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_microblaze_riscv_0_0/SoC_EV_BD_microblaze_riscv_0_0.xdc id:2 order:EARLY scoped_inst:SoC_EV_BD_i/microblaze_riscv_0/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/home/wonhyeok/SoC_EV_IPmodule/SoC_EV_IPmodule.srcs/constrs_1/imports/basys_datasheet/Basys-3-Master.xdc rfile:../../../SoC_EV_IPmodule.srcs/constrs_1/imports/basys_datasheet/Basys-3-Master.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:/home/wonhyeok/SoC_EV_IPmodule/SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_mdm_1_0/SoC_EV_BD_mdm_1_0.xdc rfile:../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ip/SoC_EV_BD_mdm_1_0/SoC_EV_BD_mdm_1_0.xdc id:4 order:LATE scoped_inst:SoC_EV_BD_i/mdm_1/U0} [current_design]
current_instance SoC_EV_BD_i/clk_wiz/inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
current_instance SoC_EV_BD_i/microblaze_riscv_0/U0
set_property src_info {type:SCOPED_XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-3  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:2 line:10 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*/C]
set_property src_info {type:SCOPED_XDC file:2 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/D]
set_property src_info {type:SCOPED_XDC file:2 line:13 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CE]
set_property src_info {type:SCOPED_XDC file:2 line:14 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/*/D]
set_property src_info {type:SCOPED_XDC file:2 line:15 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]
set_property src_info {type:SCOPED_XDC file:2 line:16 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/PRE]
set_property src_info {type:SCOPED_XDC file:2 line:17 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]
current_instance
set_property src_info {type:XDC file:3 line:75 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J1   IOSTANDARD LVCMOS33 } [get_ports {btn[0]}];#Sch name = JA1
set_property src_info {type:XDC file:3 line:76 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports {btn[1]}];#Sch name = JA2
set_property src_info {type:XDC file:3 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports {btn[2]}];#Sch name = JA3
set_property src_info {type:XDC file:3 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports {btn[3]}];#Sch name = JA4
set_property src_info {type:XDC file:3 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports {btn[4]}];#Sch name = JA7
set_property src_info {type:XDC file:3 line:80 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports {photo_INT[0]}];#Sch name = JA8
set_property src_info {type:XDC file:3 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports {photo_INT[1]}];#Sch name = JA9
set_property src_info {type:XDC file:3 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports {photo_INT[2]}];#Sch name = JA10
set_property src_info {type:XDC file:3 line:85 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports {ser_fnd}];#Sch name = JB1
set_property src_info {type:XDC file:3 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports {rclk_fnd}];#Sch name = JB2
set_property src_info {type:XDC file:3 line:87 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports {srclk_fnd}];#Sch name = JB3
set_property src_info {type:XDC file:3 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports {pwm_servo}];#Sch name = JB4
set_property src_info {type:XDC file:3 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports {ser_led}];#Sch name = JB7
set_property src_info {type:XDC file:3 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports {rclk_led}];#Sch name = JB8
set_property src_info {type:XDC file:3 line:91 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports {srclk_led}];#Sch name = JB9
set_property src_info {type:XDC file:3 line:92 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports {pwm_buzzer}];#Sch name = JB10
set_property src_info {type:XDC file:3 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports {IN1}];#Sch name = JC1
set_property src_info {type:XDC file:3 line:96 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports {IN2}];#Sch name = JC2
set_property src_info {type:XDC file:3 line:97 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports {IN3}];#Sch name = JC3
set_property src_info {type:XDC file:3 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports {IN4}];#Sch name = JC4
set_property src_info {type:XDC file:3 line:99 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports {iic_rtl_scl_io}];#Sch name = JC7
set_property src_info {type:XDC file:3 line:100 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports {iic_rtl_sda_io}];#Sch name = JC8
current_instance SoC_EV_BD_i/mdm_1/U0
set_property src_info {type:SCOPED_XDC file:4 line:15 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:4 line:18 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins "Use*.BSCAN*/*/UPDATE"]] -description "Avoid warning for valid UPDATE clock constraint"
set_property src_info {type:SCOPED_XDC file:4 line:21 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins "Use*.BSCAN*/*/TCK"]] -description "Avoid warning for valid TCK clock constraint"
set_property src_info {type:SCOPED_XDC file:4 line:24 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins */*/*.BUFG_UPDATE/*/O]] -description "Avoid warning for valid UPDATE clock constraint"
set_property src_info {type:SCOPED_XDC file:4 line:29 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:4 line:30 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:4 line:31 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:32 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/UPDATE]
set_property src_info {type:SCOPED_XDC file:4 line:33 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/CE]
set_property src_info {type:SCOPED_XDC file:4 line:34 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/D]
set_property src_info {type:SCOPED_XDC file:4 line:35 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/R]
set_property src_info {type:SCOPED_XDC file:4 line:36 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/CE]
set_property src_info {type:SCOPED_XDC file:4 line:37 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/D]
set_property src_info {type:SCOPED_XDC file:4 line:38 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/R]
set_property src_info {type:SCOPED_XDC file:4 line:39 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-2  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:40 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:41 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:42 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-11 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:43 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:4 line:44 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_JTAG_BSCAN.*/C]
set_property src_info {type:SCOPED_XDC file:4 line:45 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/O]
set_property src_info {type:SCOPED_XDC file:4 line:46 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:4 line:47 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:4 line:48 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:4 line:49 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:4 line:50 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/UPDATE]
set_property src_info {type:SCOPED_XDC file:4 line:51 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/R]
set_property src_info {type:SCOPED_XDC file:4 line:52 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/R]
set_property src_info {type:SCOPED_XDC file:4 line:54 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Internal_BSCANID.bscanid*reg/D]
set_property src_info {type:SCOPED_XDC file:4 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Internal_BSCANID.bscanid*reg/CE]
