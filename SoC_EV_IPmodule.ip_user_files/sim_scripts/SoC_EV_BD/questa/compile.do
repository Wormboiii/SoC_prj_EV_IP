vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/microblaze_v11_0_15
vlib questa_lib/msim/microblaze_riscv_v1_0_5
vlib questa_lib/msim/lmb_v10_v3_0_15
vlib questa_lib/msim/lmb_bram_if_cntlr_v4_0_26
vlib questa_lib/msim/blk_mem_gen_v8_4_11
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/mdm_riscv_v1_0_5
vlib questa_lib/msim/axi_uartlite_v2_0_39
vlib questa_lib/msim/xlconstant_v1_1_10
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_35
vlib questa_lib/msim/axi_vip_v1_1_21
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_37
vlib questa_lib/msim/axi_iic_v2_1_11

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap microblaze_v11_0_15 questa_lib/msim/microblaze_v11_0_15
vmap microblaze_riscv_v1_0_5 questa_lib/msim/microblaze_riscv_v1_0_5
vmap lmb_v10_v3_0_15 questa_lib/msim/lmb_v10_v3_0_15
vmap lmb_bram_if_cntlr_v4_0_26 questa_lib/msim/lmb_bram_if_cntlr_v4_0_26
vmap blk_mem_gen_v8_4_11 questa_lib/msim/blk_mem_gen_v8_4_11
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap mdm_riscv_v1_0_5 questa_lib/msim/mdm_riscv_v1_0_5
vmap axi_uartlite_v2_0_39 questa_lib/msim/axi_uartlite_v2_0_39
vmap xlconstant_v1_1_10 questa_lib/msim/xlconstant_v1_1_10
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_35 questa_lib/msim/axi_register_slice_v2_1_35
vmap axi_vip_v1_1_21 questa_lib/msim/axi_vip_v1_1_21
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 questa_lib/msim/axi_gpio_v2_0_37
vmap axi_iic_v2_1_11 questa_lib/msim/axi_iic_v2_1_11

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/media/wonhyeok/data/XILINX/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/media/wonhyeok/data/XILINX/2025.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_proc_sys_reset_0_0/sim/SoC_EV_BD_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_clk_wiz_0/SoC_EV_BD_clk_wiz_0_clk_wiz.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_clk_wiz_0/SoC_EV_BD_clk_wiz_0.v" \

vcom -work microblaze_v11_0_15 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/75f6/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work microblaze_riscv_v1_0_5 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/0725/hdl/microblaze_riscv_v1_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_microblaze_riscv_0_0/sim/SoC_EV_BD_microblaze_riscv_0_0.vhd" \

vcom -work lmb_v10_v3_0_15 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/b1c4/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_dlmb_v10_0/sim/SoC_EV_BD_dlmb_v10_0.vhd" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_ilmb_v10_0/sim/SoC_EV_BD_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_26 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/0e64/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_dlmb_bram_if_cntlr_0/sim/SoC_EV_BD_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_ilmb_bram_if_cntlr_0/sim/SoC_EV_BD_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_11 -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_lmb_bram_0/sim/SoC_EV_BD_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_riscv_v1_0_5 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/2c73/hdl/mdm_riscv_v1_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_mdm_1_0/sim/SoC_EV_BD_mdm_1_0.vhd" \

vcom -work axi_uartlite_v2_0_39 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/eab1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_uartlite_0_0/sim/SoC_EV_BD_axi_uartlite_0_0.vhd" \

vlog -work xlconstant_v1_1_10 -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a165/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_0/sim/bd_cb0a_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_1/sim/bd_cb0a_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_2/sim/bd_cb0a_arinsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_3/sim/bd_cb0a_rinsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_4/sim/bd_cb0a_awinsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_5/sim/bd_cb0a_winsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_6/sim/bd_cb0a_binsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_7/sim/bd_cb0a_aroutsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_8/sim/bd_cb0a_routsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_9/sim/bd_cb0a_awoutsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_10/sim/bd_cb0a_woutsw_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_11/sim/bd_cb0a_boutsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_12/sim/bd_cb0a_arni_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_13/sim/bd_cb0a_rni_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_14/sim/bd_cb0a_awni_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_15/sim/bd_cb0a_wni_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_16/sim/bd_cb0a_bni_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/d800/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_17/sim/bd_cb0a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_18/sim/bd_cb0a_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/dce3/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_19/sim/bd_cb0a_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_20/sim/bd_cb0a_s00a2s_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_21/sim/bd_cb0a_sarn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_22/sim/bd_cb0a_srn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_23/sim/bd_cb0a_sawn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_24/sim/bd_cb0a_swn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_25/sim/bd_cb0a_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_26/sim/bd_cb0a_m00s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_27/sim/bd_cb0a_m00arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_28/sim/bd_cb0a_m00rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_29/sim/bd_cb0a_m00awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_30/sim/bd_cb0a_m00wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_31/sim/bd_cb0a_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/0133/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_32/sim/bd_cb0a_m00e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_33/sim/bd_cb0a_m01s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_34/sim/bd_cb0a_m01arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_35/sim/bd_cb0a_m01rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_36/sim/bd_cb0a_m01awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_37/sim/bd_cb0a_m01wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_38/sim/bd_cb0a_m01bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_39/sim/bd_cb0a_m01e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_40/sim/bd_cb0a_m02s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_41/sim/bd_cb0a_m02arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_42/sim/bd_cb0a_m02rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_43/sim/bd_cb0a_m02awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_44/sim/bd_cb0a_m02wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_45/sim/bd_cb0a_m02bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_46/sim/bd_cb0a_m02e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_47/sim/bd_cb0a_m03s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_48/sim/bd_cb0a_m03arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_49/sim/bd_cb0a_m03rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_50/sim/bd_cb0a_m03awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_51/sim/bd_cb0a_m03wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_52/sim/bd_cb0a_m03bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_53/sim/bd_cb0a_m03e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_54/sim/bd_cb0a_m04s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_55/sim/bd_cb0a_m04arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_56/sim/bd_cb0a_m04rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_57/sim/bd_cb0a_m04awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_58/sim/bd_cb0a_m04wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_59/sim/bd_cb0a_m04bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_60/sim/bd_cb0a_m04e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_61/sim/bd_cb0a_m05s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_62/sim/bd_cb0a_m05arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_63/sim/bd_cb0a_m05rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_64/sim/bd_cb0a_m05awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_65/sim/bd_cb0a_m05wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_66/sim/bd_cb0a_m05bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_67/sim/bd_cb0a_m05e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_68/sim/bd_cb0a_m06s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_69/sim/bd_cb0a_m06arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_70/sim/bd_cb0a_m06rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_71/sim/bd_cb0a_m06awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_72/sim/bd_cb0a_m06wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_73/sim/bd_cb0a_m06bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_74/sim/bd_cb0a_m06e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_75/sim/bd_cb0a_m07s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_76/sim/bd_cb0a_m07arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_77/sim/bd_cb0a_m07rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_78/sim/bd_cb0a_m07awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_79/sim/bd_cb0a_m07wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_80/sim/bd_cb0a_m07bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_81/sim/bd_cb0a_m07e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_82/sim/bd_cb0a_m08s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_83/sim/bd_cb0a_m08arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_84/sim/bd_cb0a_m08rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_85/sim/bd_cb0a_m08awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_86/sim/bd_cb0a_m08wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_87/sim/bd_cb0a_m08bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_88/sim/bd_cb0a_m08e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_89/sim/bd_cb0a_m09s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_90/sim/bd_cb0a_m09arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_91/sim/bd_cb0a_m09rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_92/sim/bd_cb0a_m09awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_93/sim/bd_cb0a_m09wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_94/sim/bd_cb0a_m09bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_95/sim/bd_cb0a_m09e_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_96/sim/bd_cb0a_m10s2a_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_97/sim/bd_cb0a_m10arn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_98/sim/bd_cb0a_m10rn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_99/sim/bd_cb0a_m10awn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_100/sim/bd_cb0a_m10wn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_101/sim/bd_cb0a_m10bn_0.sv" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/ip/ip_102/sim/bd_cb0a_m10e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/bd_0/sim/bd_cb0a.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_35 -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_21 -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f16f/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_21 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_smc_0/sim/SoC_EV_BD_axi_smc_0.sv" \

vcom -work interrupt_control_v3_1_5 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_gpio_0_0/sim/SoC_EV_BD_axi_gpio_0_0.vhd" \

vcom -work axi_iic_v2_1_11 -64 -93  \
"../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/67c0/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_axi_iic_0_0/sim/SoC_EV_BD_axi_iic_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a9be" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/a8e4/hdl/verilog" "+incdir+../../../../SoC_EV_IPmodule.gen/sources_1/bd/SoC_EV_BD/ipshared/ec67/hdl" "+incdir+../../../../../../../media/wonhyeok/data/XILINX/2025.1/data/rsb/busdef" "+incdir+/media/wonhyeok/data/XILINX/2025.1/Vivado/data/xilinx_vip/include" \
"../../../bd/SoC_EV_BD/ipshared/dfc5/hdl/CustomIP_STEPPER_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/dfc5/4282/stepper_source.v" \
"../../../bd/SoC_EV_BD/ipshared/dfc5/hdl/CustomIP_STEPPER.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_STEPPER_0_0/sim/SoC_EV_BD_CustomIP_STEPPER_0_0.v" \
"../../../bd/SoC_EV_BD/ipshared/daed/hdl/CustomIP_EXTERNAL_BTN_CNTR_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/daed/4282/btn_source.v" \
"../../../bd/SoC_EV_BD/ipshared/daed/hdl/CustomIP_EXTERNAL_BTN_CNTR.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_EXTERNAL_BT_0_0/sim/SoC_EV_BD_CustomIP_EXTERNAL_BT_0_0.v" \
"../../../bd/SoC_EV_BD/ipshared/5a8b/hdl/CustomIP_PHOTO_INT_CNTR_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/5a8b/4282/photoINT_souce.v" \
"../../../bd/SoC_EV_BD/ipshared/5a8b/hdl/CustomIP_PHOTO_INT_CNTR.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_PHOTO_INT_C_0_0/sim/SoC_EV_BD_CustomIP_PHOTO_INT_C_0_0.v" \
"../../../bd/SoC_EV_BD/ipshared/af28/hdl/CustomIP_PWM_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/af28/4282/pwm_source.v" \
"../../../bd/SoC_EV_BD/ipshared/af28/hdl/CustomIP_PWM.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_PWM_0_0/sim/SoC_EV_BD_CustomIP_PWM_0_0.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_PWM_1_0/sim/SoC_EV_BD_CustomIP_PWM_1_0.v" \
"../../../bd/SoC_EV_BD/ipshared/8adc/hdl/CustomIP_EXTERNAL_LED_CNTR_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/8adc/4282/sr_led_source.v" \
"../../../bd/SoC_EV_BD/ipshared/8adc/hdl/CustomIP_EXTERNAL_LED_CNTR.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_EXTERNAL_LE_0_0/sim/SoC_EV_BD_CustomIP_EXTERNAL_LE_0_0.v" \
"../../../bd/SoC_EV_BD/ipshared/3abe/hdl/CustomIP_EXTERNAL_FND_CNTR_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/3abe/4282/sr_fnd_source.v" \
"../../../bd/SoC_EV_BD/ipshared/3abe/hdl/CustomIP_EXTERNAL_FND_CNTR.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_EXTERNAL_FN_0_0/sim/SoC_EV_BD_CustomIP_EXTERNAL_FN_0_0.v" \
"../../../bd/SoC_EV_BD/ipshared/e7f1/hdl/CustomIP_TIMER_SEC_slave_lite_v1_0_S00_AXI.v" \
"../../../bd/SoC_EV_BD/ipshared/e7f1/hdl/CustomIP_TIMER_SEC.v" \
"../../../bd/SoC_EV_BD/ipshared/e7f1/4282/timer_source.v" \
"../../../bd/SoC_EV_BD/ip/SoC_EV_BD_CustomIP_TIMER_SEC_0_0/sim/SoC_EV_BD_CustomIP_TIMER_SEC_0_0.v" \
"../../../bd/SoC_EV_BD/sim/SoC_EV_BD.v" \

vlog -work xil_defaultlib \
"glbl.v"

