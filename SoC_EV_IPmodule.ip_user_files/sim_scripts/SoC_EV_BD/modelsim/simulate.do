onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xilinx_vip -L xpm -L proc_sys_reset_v5_0_17 -L microblaze_v11_0_15 -L microblaze_riscv_v1_0_5 -L lmb_v10_v3_0_15 -L lmb_bram_if_cntlr_v4_0_26 -L blk_mem_gen_v8_4_11 -L axi_lite_ipif_v3_0_4 -L mdm_riscv_v1_0_5 -L axi_uartlite_v2_0_39 -L xlconstant_v1_1_10 -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_35 -L axi_vip_v1_1_21 -L interrupt_control_v3_1_5 -L axi_gpio_v2_0_37 -L axi_iic_v2_1_11 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.SoC_EV_BD xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {SoC_EV_BD.udo}

run 1000ns

quit -force
