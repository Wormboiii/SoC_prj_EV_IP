//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Sat Sep 27 12:24:23 2025
//Host        : ThinkBook running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target SoC_EV_BD.bd
//Design      : SoC_EV_BD
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "SoC_EV_BD,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SoC_EV_BD,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=22,numReposBlks=21,numNonXlnxBlks=8,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=11,da_board_cnt=3,da_clkrst_cnt=1,da_microblaze_riscv_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "SoC_EV_BD.hwdef" *) 
module SoC_EV_BD
   (IN1,
    IN2,
    IN3,
    IN4,
    btn,
    iic_rtl_scl_i,
    iic_rtl_scl_o,
    iic_rtl_scl_t,
    iic_rtl_sda_i,
    iic_rtl_sda_o,
    iic_rtl_sda_t,
    led_16bits_tri_o,
    photo_INT,
    pwm_buzzer,
    pwm_servo,
    rclk_fnd,
    rclk_led,
    reset,
    ser_fnd,
    ser_led,
    srclk_fnd,
    srclk_led,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  output IN1;
  output IN2;
  output IN3;
  output IN4;
  input [4:0]btn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SCL_I" *) (* X_INTERFACE_MODE = "Master" *) input iic_rtl_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SCL_O" *) output iic_rtl_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SCL_T" *) output iic_rtl_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SDA_I" *) input iic_rtl_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SDA_O" *) output iic_rtl_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 iic_rtl SDA_T" *) output iic_rtl_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led_16bits TRI_O" *) (* X_INTERFACE_MODE = "Master" *) output [15:0]led_16bits_tri_o;
  input [2:0]photo_INT;
  output pwm_buzzer;
  output pwm_servo;
  output rclk_fnd;
  output rclk_led;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset;
  output ser_fnd;
  output ser_led;
  output srclk_fnd;
  output srclk_led;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN SoC_EV_BD_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart RxD" *) (* X_INTERFACE_MODE = "Master" *) input usb_uart_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 usb_uart TxD" *) output usb_uart_txd;

  wire IN1;
  wire IN2;
  wire IN3;
  wire IN4;
  wire [3:0]axi_smc_M00_AXI_ARADDR;
  wire axi_smc_M00_AXI_ARREADY;
  wire axi_smc_M00_AXI_ARVALID;
  wire [3:0]axi_smc_M00_AXI_AWADDR;
  wire axi_smc_M00_AXI_AWREADY;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [31:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [31:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WREADY;
  wire [3:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire [8:0]axi_smc_M01_AXI_ARADDR;
  wire axi_smc_M01_AXI_ARREADY;
  wire axi_smc_M01_AXI_ARVALID;
  wire [8:0]axi_smc_M01_AXI_AWADDR;
  wire axi_smc_M01_AXI_AWREADY;
  wire axi_smc_M01_AXI_AWVALID;
  wire axi_smc_M01_AXI_BREADY;
  wire [1:0]axi_smc_M01_AXI_BRESP;
  wire axi_smc_M01_AXI_BVALID;
  wire [31:0]axi_smc_M01_AXI_RDATA;
  wire axi_smc_M01_AXI_RREADY;
  wire [1:0]axi_smc_M01_AXI_RRESP;
  wire axi_smc_M01_AXI_RVALID;
  wire [31:0]axi_smc_M01_AXI_WDATA;
  wire axi_smc_M01_AXI_WREADY;
  wire [3:0]axi_smc_M01_AXI_WSTRB;
  wire axi_smc_M01_AXI_WVALID;
  wire [8:0]axi_smc_M02_AXI_ARADDR;
  wire axi_smc_M02_AXI_ARREADY;
  wire axi_smc_M02_AXI_ARVALID;
  wire [8:0]axi_smc_M02_AXI_AWADDR;
  wire axi_smc_M02_AXI_AWREADY;
  wire axi_smc_M02_AXI_AWVALID;
  wire axi_smc_M02_AXI_BREADY;
  wire [1:0]axi_smc_M02_AXI_BRESP;
  wire axi_smc_M02_AXI_BVALID;
  wire [31:0]axi_smc_M02_AXI_RDATA;
  wire axi_smc_M02_AXI_RREADY;
  wire [1:0]axi_smc_M02_AXI_RRESP;
  wire axi_smc_M02_AXI_RVALID;
  wire [31:0]axi_smc_M02_AXI_WDATA;
  wire axi_smc_M02_AXI_WREADY;
  wire [3:0]axi_smc_M02_AXI_WSTRB;
  wire axi_smc_M02_AXI_WVALID;
  wire [4:0]axi_smc_M03_AXI_ARADDR;
  wire [2:0]axi_smc_M03_AXI_ARPROT;
  wire axi_smc_M03_AXI_ARREADY;
  wire axi_smc_M03_AXI_ARVALID;
  wire [4:0]axi_smc_M03_AXI_AWADDR;
  wire [2:0]axi_smc_M03_AXI_AWPROT;
  wire axi_smc_M03_AXI_AWREADY;
  wire axi_smc_M03_AXI_AWVALID;
  wire axi_smc_M03_AXI_BREADY;
  wire [1:0]axi_smc_M03_AXI_BRESP;
  wire axi_smc_M03_AXI_BVALID;
  wire [31:0]axi_smc_M03_AXI_RDATA;
  wire axi_smc_M03_AXI_RREADY;
  wire [1:0]axi_smc_M03_AXI_RRESP;
  wire axi_smc_M03_AXI_RVALID;
  wire [31:0]axi_smc_M03_AXI_WDATA;
  wire axi_smc_M03_AXI_WREADY;
  wire [3:0]axi_smc_M03_AXI_WSTRB;
  wire axi_smc_M03_AXI_WVALID;
  wire [4:0]axi_smc_M04_AXI_ARADDR;
  wire [2:0]axi_smc_M04_AXI_ARPROT;
  wire axi_smc_M04_AXI_ARREADY;
  wire axi_smc_M04_AXI_ARVALID;
  wire [4:0]axi_smc_M04_AXI_AWADDR;
  wire [2:0]axi_smc_M04_AXI_AWPROT;
  wire axi_smc_M04_AXI_AWREADY;
  wire axi_smc_M04_AXI_AWVALID;
  wire axi_smc_M04_AXI_BREADY;
  wire [1:0]axi_smc_M04_AXI_BRESP;
  wire axi_smc_M04_AXI_BVALID;
  wire [31:0]axi_smc_M04_AXI_RDATA;
  wire axi_smc_M04_AXI_RREADY;
  wire [1:0]axi_smc_M04_AXI_RRESP;
  wire axi_smc_M04_AXI_RVALID;
  wire [31:0]axi_smc_M04_AXI_WDATA;
  wire axi_smc_M04_AXI_WREADY;
  wire [3:0]axi_smc_M04_AXI_WSTRB;
  wire axi_smc_M04_AXI_WVALID;
  wire [4:0]axi_smc_M05_AXI_ARADDR;
  wire [2:0]axi_smc_M05_AXI_ARPROT;
  wire axi_smc_M05_AXI_ARREADY;
  wire axi_smc_M05_AXI_ARVALID;
  wire [4:0]axi_smc_M05_AXI_AWADDR;
  wire [2:0]axi_smc_M05_AXI_AWPROT;
  wire axi_smc_M05_AXI_AWREADY;
  wire axi_smc_M05_AXI_AWVALID;
  wire axi_smc_M05_AXI_BREADY;
  wire [1:0]axi_smc_M05_AXI_BRESP;
  wire axi_smc_M05_AXI_BVALID;
  wire [31:0]axi_smc_M05_AXI_RDATA;
  wire axi_smc_M05_AXI_RREADY;
  wire [1:0]axi_smc_M05_AXI_RRESP;
  wire axi_smc_M05_AXI_RVALID;
  wire [31:0]axi_smc_M05_AXI_WDATA;
  wire axi_smc_M05_AXI_WREADY;
  wire [3:0]axi_smc_M05_AXI_WSTRB;
  wire axi_smc_M05_AXI_WVALID;
  wire [4:0]axi_smc_M06_AXI_ARADDR;
  wire [2:0]axi_smc_M06_AXI_ARPROT;
  wire axi_smc_M06_AXI_ARREADY;
  wire axi_smc_M06_AXI_ARVALID;
  wire [4:0]axi_smc_M06_AXI_AWADDR;
  wire [2:0]axi_smc_M06_AXI_AWPROT;
  wire axi_smc_M06_AXI_AWREADY;
  wire axi_smc_M06_AXI_AWVALID;
  wire axi_smc_M06_AXI_BREADY;
  wire [1:0]axi_smc_M06_AXI_BRESP;
  wire axi_smc_M06_AXI_BVALID;
  wire [31:0]axi_smc_M06_AXI_RDATA;
  wire axi_smc_M06_AXI_RREADY;
  wire [1:0]axi_smc_M06_AXI_RRESP;
  wire axi_smc_M06_AXI_RVALID;
  wire [31:0]axi_smc_M06_AXI_WDATA;
  wire axi_smc_M06_AXI_WREADY;
  wire [3:0]axi_smc_M06_AXI_WSTRB;
  wire axi_smc_M06_AXI_WVALID;
  wire [4:0]axi_smc_M07_AXI_ARADDR;
  wire [2:0]axi_smc_M07_AXI_ARPROT;
  wire axi_smc_M07_AXI_ARREADY;
  wire axi_smc_M07_AXI_ARVALID;
  wire [4:0]axi_smc_M07_AXI_AWADDR;
  wire [2:0]axi_smc_M07_AXI_AWPROT;
  wire axi_smc_M07_AXI_AWREADY;
  wire axi_smc_M07_AXI_AWVALID;
  wire axi_smc_M07_AXI_BREADY;
  wire [1:0]axi_smc_M07_AXI_BRESP;
  wire axi_smc_M07_AXI_BVALID;
  wire [31:0]axi_smc_M07_AXI_RDATA;
  wire axi_smc_M07_AXI_RREADY;
  wire [1:0]axi_smc_M07_AXI_RRESP;
  wire axi_smc_M07_AXI_RVALID;
  wire [31:0]axi_smc_M07_AXI_WDATA;
  wire axi_smc_M07_AXI_WREADY;
  wire [3:0]axi_smc_M07_AXI_WSTRB;
  wire axi_smc_M07_AXI_WVALID;
  wire [3:0]axi_smc_M08_AXI_ARADDR;
  wire [2:0]axi_smc_M08_AXI_ARPROT;
  wire axi_smc_M08_AXI_ARREADY;
  wire axi_smc_M08_AXI_ARVALID;
  wire [3:0]axi_smc_M08_AXI_AWADDR;
  wire [2:0]axi_smc_M08_AXI_AWPROT;
  wire axi_smc_M08_AXI_AWREADY;
  wire axi_smc_M08_AXI_AWVALID;
  wire axi_smc_M08_AXI_BREADY;
  wire [1:0]axi_smc_M08_AXI_BRESP;
  wire axi_smc_M08_AXI_BVALID;
  wire [31:0]axi_smc_M08_AXI_RDATA;
  wire axi_smc_M08_AXI_RREADY;
  wire [1:0]axi_smc_M08_AXI_RRESP;
  wire axi_smc_M08_AXI_RVALID;
  wire [31:0]axi_smc_M08_AXI_WDATA;
  wire axi_smc_M08_AXI_WREADY;
  wire [3:0]axi_smc_M08_AXI_WSTRB;
  wire axi_smc_M08_AXI_WVALID;
  wire [4:0]axi_smc_M09_AXI_ARADDR;
  wire [2:0]axi_smc_M09_AXI_ARPROT;
  wire axi_smc_M09_AXI_ARREADY;
  wire axi_smc_M09_AXI_ARVALID;
  wire [4:0]axi_smc_M09_AXI_AWADDR;
  wire [2:0]axi_smc_M09_AXI_AWPROT;
  wire axi_smc_M09_AXI_AWREADY;
  wire axi_smc_M09_AXI_AWVALID;
  wire axi_smc_M09_AXI_BREADY;
  wire [1:0]axi_smc_M09_AXI_BRESP;
  wire axi_smc_M09_AXI_BVALID;
  wire [31:0]axi_smc_M09_AXI_RDATA;
  wire axi_smc_M09_AXI_RREADY;
  wire [1:0]axi_smc_M09_AXI_RRESP;
  wire axi_smc_M09_AXI_RVALID;
  wire [31:0]axi_smc_M09_AXI_WDATA;
  wire axi_smc_M09_AXI_WREADY;
  wire [3:0]axi_smc_M09_AXI_WSTRB;
  wire axi_smc_M09_AXI_WVALID;
  wire [4:0]axi_smc_M10_AXI_ARADDR;
  wire [2:0]axi_smc_M10_AXI_ARPROT;
  wire axi_smc_M10_AXI_ARREADY;
  wire axi_smc_M10_AXI_ARVALID;
  wire [4:0]axi_smc_M10_AXI_AWADDR;
  wire [2:0]axi_smc_M10_AXI_AWPROT;
  wire axi_smc_M10_AXI_AWREADY;
  wire axi_smc_M10_AXI_AWVALID;
  wire axi_smc_M10_AXI_BREADY;
  wire [1:0]axi_smc_M10_AXI_BRESP;
  wire axi_smc_M10_AXI_BVALID;
  wire [31:0]axi_smc_M10_AXI_RDATA;
  wire axi_smc_M10_AXI_RREADY;
  wire [1:0]axi_smc_M10_AXI_RRESP;
  wire axi_smc_M10_AXI_RVALID;
  wire [31:0]axi_smc_M10_AXI_WDATA;
  wire axi_smc_M10_AXI_WREADY;
  wire [3:0]axi_smc_M10_AXI_WSTRB;
  wire axi_smc_M10_AXI_WVALID;
  wire [4:0]btn;
  wire iic_rtl_scl_i;
  wire iic_rtl_scl_o;
  wire iic_rtl_scl_t;
  wire iic_rtl_sda_i;
  wire iic_rtl_sda_o;
  wire iic_rtl_sda_t;
  wire [15:0]led_16bits_tri_o;
  wire mdm_1_debug_sys_rst;
  wire microblaze_riscv_0_Clk;
  wire [31:0]microblaze_riscv_0_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_riscv_0_M_AXI_DP_ARPROT;
  wire microblaze_riscv_0_M_AXI_DP_ARREADY;
  wire microblaze_riscv_0_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_riscv_0_M_AXI_DP_AWPROT;
  wire microblaze_riscv_0_M_AXI_DP_AWREADY;
  wire microblaze_riscv_0_M_AXI_DP_AWVALID;
  wire microblaze_riscv_0_M_AXI_DP_BREADY;
  wire [1:0]microblaze_riscv_0_M_AXI_DP_BRESP;
  wire microblaze_riscv_0_M_AXI_DP_BVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DP_RDATA;
  wire microblaze_riscv_0_M_AXI_DP_RREADY;
  wire [1:0]microblaze_riscv_0_M_AXI_DP_RRESP;
  wire microblaze_riscv_0_M_AXI_DP_RVALID;
  wire [31:0]microblaze_riscv_0_M_AXI_DP_WDATA;
  wire microblaze_riscv_0_M_AXI_DP_WREADY;
  wire [3:0]microblaze_riscv_0_M_AXI_DP_WSTRB;
  wire microblaze_riscv_0_M_AXI_DP_WVALID;
  wire microblaze_riscv_0_debug_CAPTURE;
  wire microblaze_riscv_0_debug_CLK;
  wire microblaze_riscv_0_debug_DISABLE;
  wire [0:7]microblaze_riscv_0_debug_REG_EN;
  wire microblaze_riscv_0_debug_RST;
  wire microblaze_riscv_0_debug_SHIFT;
  wire microblaze_riscv_0_debug_TDI;
  wire microblaze_riscv_0_debug_TDO;
  wire microblaze_riscv_0_debug_UPDATE;
  wire [0:31]microblaze_riscv_0_dlmb_1_ABUS;
  wire microblaze_riscv_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_1_BE;
  wire microblaze_riscv_0_dlmb_1_CE;
  wire [0:31]microblaze_riscv_0_dlmb_1_READDBUS;
  wire microblaze_riscv_0_dlmb_1_READSTROBE;
  wire microblaze_riscv_0_dlmb_1_READY;
  wire microblaze_riscv_0_dlmb_1_UE;
  wire microblaze_riscv_0_dlmb_1_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_1_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_1_ABUS;
  wire microblaze_riscv_0_ilmb_1_ADDRSTROBE;
  wire microblaze_riscv_0_ilmb_1_CE;
  wire [0:31]microblaze_riscv_0_ilmb_1_READDBUS;
  wire microblaze_riscv_0_ilmb_1_READSTROBE;
  wire microblaze_riscv_0_ilmb_1_READY;
  wire microblaze_riscv_0_ilmb_1_UE;
  wire microblaze_riscv_0_ilmb_1_WAIT;
  wire [2:0]photo_INT;
  wire [0:0]proc_sys_reset_0_bus_struct_reset;
  wire proc_sys_reset_0_mb_reset;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire pwm_buzzer;
  wire pwm_servo;
  wire rclk_fnd;
  wire rclk_led;
  wire reset;
  wire ser_fnd;
  wire ser_led;
  wire srclk_fnd;
  wire srclk_led;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  SoC_EV_BD_CustomIP_EXTERNAL_BT_0_0 CustomIP_EXTERNAL_BT_0
       (.btn(btn),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M04_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M04_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M04_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M04_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M04_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M04_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M04_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M04_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M04_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M04_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M04_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M04_AXI_RDATA),
        .s00_axi_rready(axi_smc_M04_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M04_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M04_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M04_AXI_WDATA),
        .s00_axi_wready(axi_smc_M04_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M04_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M04_AXI_WVALID));
  SoC_EV_BD_CustomIP_EXTERNAL_FN_0_0 CustomIP_EXTERNAL_FN_0
       (.rclk(rclk_fnd),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M09_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M09_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M09_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M09_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M09_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M09_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M09_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M09_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M09_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M09_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M09_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M09_AXI_RDATA),
        .s00_axi_rready(axi_smc_M09_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M09_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M09_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M09_AXI_WDATA),
        .s00_axi_wready(axi_smc_M09_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M09_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M09_AXI_WVALID),
        .ser(ser_fnd),
        .srclk(srclk_fnd));
  SoC_EV_BD_CustomIP_EXTERNAL_LE_0_0 CustomIP_EXTERNAL_LE_0
       (.rclk(rclk_led),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M08_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M08_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M08_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M08_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M08_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M08_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M08_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M08_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M08_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M08_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M08_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M08_AXI_RDATA),
        .s00_axi_rready(axi_smc_M08_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M08_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M08_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M08_AXI_WDATA),
        .s00_axi_wready(axi_smc_M08_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M08_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M08_AXI_WVALID),
        .ser(ser_led),
        .srclk(srclk_led));
  SoC_EV_BD_CustomIP_PHOTO_INT_C_0_0 CustomIP_PHOTO_INT_C_0
       (.photo_INT(photo_INT),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M05_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M05_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M05_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M05_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M05_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M05_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M05_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M05_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M05_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M05_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M05_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M05_AXI_RDATA),
        .s00_axi_rready(axi_smc_M05_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M05_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M05_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M05_AXI_WDATA),
        .s00_axi_wready(axi_smc_M05_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M05_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M05_AXI_WVALID));
  SoC_EV_BD_CustomIP_PWM_0_0 CustomIP_PWM_0
       (.pwm(pwm_servo),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M06_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M06_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M06_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M06_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M06_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M06_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M06_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M06_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M06_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M06_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M06_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M06_AXI_RDATA),
        .s00_axi_rready(axi_smc_M06_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M06_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M06_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M06_AXI_WDATA),
        .s00_axi_wready(axi_smc_M06_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M06_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M06_AXI_WVALID));
  SoC_EV_BD_CustomIP_PWM_1_0 CustomIP_PWM_1
       (.pwm(pwm_buzzer),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M07_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M07_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M07_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M07_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M07_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M07_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M07_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M07_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M07_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M07_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M07_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M07_AXI_RDATA),
        .s00_axi_rready(axi_smc_M07_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M07_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M07_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M07_AXI_WDATA),
        .s00_axi_wready(axi_smc_M07_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M07_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M07_AXI_WVALID));
  SoC_EV_BD_CustomIP_STEPPER_0_0 CustomIP_STEPPER_0
       (.IN1(IN1),
        .IN2(IN2),
        .IN3(IN3),
        .IN4(IN4),
        .s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M03_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M03_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M03_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M03_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M03_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M03_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M03_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M03_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M03_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M03_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M03_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M03_AXI_RDATA),
        .s00_axi_rready(axi_smc_M03_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M03_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M03_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M03_AXI_WDATA),
        .s00_axi_wready(axi_smc_M03_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M03_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M03_AXI_WVALID));
  SoC_EV_BD_CustomIP_TIMER_SEC_0_0 CustomIP_TIMER_SEC_0
       (.s00_axi_aclk(microblaze_riscv_0_Clk),
        .s00_axi_araddr(axi_smc_M10_AXI_ARADDR),
        .s00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axi_arprot(axi_smc_M10_AXI_ARPROT),
        .s00_axi_arready(axi_smc_M10_AXI_ARREADY),
        .s00_axi_arvalid(axi_smc_M10_AXI_ARVALID),
        .s00_axi_awaddr(axi_smc_M10_AXI_AWADDR),
        .s00_axi_awprot(axi_smc_M10_AXI_AWPROT),
        .s00_axi_awready(axi_smc_M10_AXI_AWREADY),
        .s00_axi_awvalid(axi_smc_M10_AXI_AWVALID),
        .s00_axi_bready(axi_smc_M10_AXI_BREADY),
        .s00_axi_bresp(axi_smc_M10_AXI_BRESP),
        .s00_axi_bvalid(axi_smc_M10_AXI_BVALID),
        .s00_axi_rdata(axi_smc_M10_AXI_RDATA),
        .s00_axi_rready(axi_smc_M10_AXI_RREADY),
        .s00_axi_rresp(axi_smc_M10_AXI_RRESP),
        .s00_axi_rvalid(axi_smc_M10_AXI_RVALID),
        .s00_axi_wdata(axi_smc_M10_AXI_WDATA),
        .s00_axi_wready(axi_smc_M10_AXI_WREADY),
        .s00_axi_wstrb(axi_smc_M10_AXI_WSTRB),
        .s00_axi_wvalid(axi_smc_M10_AXI_WVALID));
  SoC_EV_BD_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_o(led_16bits_tri_o),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(axi_smc_M01_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_smc_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M01_AXI_AWADDR),
        .s_axi_awready(axi_smc_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M01_AXI_AWVALID),
        .s_axi_bready(axi_smc_M01_AXI_BREADY),
        .s_axi_bresp(axi_smc_M01_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M01_AXI_BVALID),
        .s_axi_rdata(axi_smc_M01_AXI_RDATA),
        .s_axi_rready(axi_smc_M01_AXI_RREADY),
        .s_axi_rresp(axi_smc_M01_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M01_AXI_RVALID),
        .s_axi_wdata(axi_smc_M01_AXI_WDATA),
        .s_axi_wready(axi_smc_M01_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M01_AXI_WVALID));
  SoC_EV_BD_axi_iic_0_0 axi_iic_0
       (.s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(axi_smc_M02_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_smc_M02_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M02_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M02_AXI_AWADDR),
        .s_axi_awready(axi_smc_M02_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M02_AXI_AWVALID),
        .s_axi_bready(axi_smc_M02_AXI_BREADY),
        .s_axi_bresp(axi_smc_M02_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M02_AXI_BVALID),
        .s_axi_rdata(axi_smc_M02_AXI_RDATA),
        .s_axi_rready(axi_smc_M02_AXI_RREADY),
        .s_axi_rresp(axi_smc_M02_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M02_AXI_RVALID),
        .s_axi_wdata(axi_smc_M02_AXI_WDATA),
        .s_axi_wready(axi_smc_M02_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M02_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M02_AXI_WVALID),
        .scl_i(iic_rtl_scl_i),
        .scl_o(iic_rtl_scl_o),
        .scl_t(iic_rtl_scl_t),
        .sda_i(iic_rtl_sda_i),
        .sda_o(iic_rtl_sda_o),
        .sda_t(iic_rtl_sda_t));
  SoC_EV_BD_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_smc_M01_AXI_ARADDR),
        .M01_AXI_arready(axi_smc_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_smc_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_smc_M01_AXI_AWADDR),
        .M01_AXI_awready(axi_smc_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_smc_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_smc_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_smc_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_smc_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_smc_M01_AXI_RDATA),
        .M01_AXI_rready(axi_smc_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_smc_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_smc_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_smc_M01_AXI_WDATA),
        .M01_AXI_wready(axi_smc_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_smc_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_smc_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_smc_M02_AXI_ARADDR),
        .M02_AXI_arready(axi_smc_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_smc_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_smc_M02_AXI_AWADDR),
        .M02_AXI_awready(axi_smc_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_smc_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_smc_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_smc_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_smc_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_smc_M02_AXI_RDATA),
        .M02_AXI_rready(axi_smc_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_smc_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_smc_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_smc_M02_AXI_WDATA),
        .M02_AXI_wready(axi_smc_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_smc_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_smc_M02_AXI_WVALID),
        .M03_AXI_araddr(axi_smc_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_smc_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_smc_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_smc_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_smc_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_smc_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_smc_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_smc_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_smc_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_smc_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_smc_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_smc_M03_AXI_RDATA),
        .M03_AXI_rready(axi_smc_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_smc_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_smc_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_smc_M03_AXI_WDATA),
        .M03_AXI_wready(axi_smc_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_smc_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_smc_M03_AXI_WVALID),
        .M04_AXI_araddr(axi_smc_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi_smc_M04_AXI_ARPROT),
        .M04_AXI_arready(axi_smc_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_smc_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_smc_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi_smc_M04_AXI_AWPROT),
        .M04_AXI_awready(axi_smc_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_smc_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_smc_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_smc_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_smc_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_smc_M04_AXI_RDATA),
        .M04_AXI_rready(axi_smc_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_smc_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_smc_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_smc_M04_AXI_WDATA),
        .M04_AXI_wready(axi_smc_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_smc_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_smc_M04_AXI_WVALID),
        .M05_AXI_araddr(axi_smc_M05_AXI_ARADDR),
        .M05_AXI_arprot(axi_smc_M05_AXI_ARPROT),
        .M05_AXI_arready(axi_smc_M05_AXI_ARREADY),
        .M05_AXI_arvalid(axi_smc_M05_AXI_ARVALID),
        .M05_AXI_awaddr(axi_smc_M05_AXI_AWADDR),
        .M05_AXI_awprot(axi_smc_M05_AXI_AWPROT),
        .M05_AXI_awready(axi_smc_M05_AXI_AWREADY),
        .M05_AXI_awvalid(axi_smc_M05_AXI_AWVALID),
        .M05_AXI_bready(axi_smc_M05_AXI_BREADY),
        .M05_AXI_bresp(axi_smc_M05_AXI_BRESP),
        .M05_AXI_bvalid(axi_smc_M05_AXI_BVALID),
        .M05_AXI_rdata(axi_smc_M05_AXI_RDATA),
        .M05_AXI_rready(axi_smc_M05_AXI_RREADY),
        .M05_AXI_rresp(axi_smc_M05_AXI_RRESP),
        .M05_AXI_rvalid(axi_smc_M05_AXI_RVALID),
        .M05_AXI_wdata(axi_smc_M05_AXI_WDATA),
        .M05_AXI_wready(axi_smc_M05_AXI_WREADY),
        .M05_AXI_wstrb(axi_smc_M05_AXI_WSTRB),
        .M05_AXI_wvalid(axi_smc_M05_AXI_WVALID),
        .M06_AXI_araddr(axi_smc_M06_AXI_ARADDR),
        .M06_AXI_arprot(axi_smc_M06_AXI_ARPROT),
        .M06_AXI_arready(axi_smc_M06_AXI_ARREADY),
        .M06_AXI_arvalid(axi_smc_M06_AXI_ARVALID),
        .M06_AXI_awaddr(axi_smc_M06_AXI_AWADDR),
        .M06_AXI_awprot(axi_smc_M06_AXI_AWPROT),
        .M06_AXI_awready(axi_smc_M06_AXI_AWREADY),
        .M06_AXI_awvalid(axi_smc_M06_AXI_AWVALID),
        .M06_AXI_bready(axi_smc_M06_AXI_BREADY),
        .M06_AXI_bresp(axi_smc_M06_AXI_BRESP),
        .M06_AXI_bvalid(axi_smc_M06_AXI_BVALID),
        .M06_AXI_rdata(axi_smc_M06_AXI_RDATA),
        .M06_AXI_rready(axi_smc_M06_AXI_RREADY),
        .M06_AXI_rresp(axi_smc_M06_AXI_RRESP),
        .M06_AXI_rvalid(axi_smc_M06_AXI_RVALID),
        .M06_AXI_wdata(axi_smc_M06_AXI_WDATA),
        .M06_AXI_wready(axi_smc_M06_AXI_WREADY),
        .M06_AXI_wstrb(axi_smc_M06_AXI_WSTRB),
        .M06_AXI_wvalid(axi_smc_M06_AXI_WVALID),
        .M07_AXI_araddr(axi_smc_M07_AXI_ARADDR),
        .M07_AXI_arprot(axi_smc_M07_AXI_ARPROT),
        .M07_AXI_arready(axi_smc_M07_AXI_ARREADY),
        .M07_AXI_arvalid(axi_smc_M07_AXI_ARVALID),
        .M07_AXI_awaddr(axi_smc_M07_AXI_AWADDR),
        .M07_AXI_awprot(axi_smc_M07_AXI_AWPROT),
        .M07_AXI_awready(axi_smc_M07_AXI_AWREADY),
        .M07_AXI_awvalid(axi_smc_M07_AXI_AWVALID),
        .M07_AXI_bready(axi_smc_M07_AXI_BREADY),
        .M07_AXI_bresp(axi_smc_M07_AXI_BRESP),
        .M07_AXI_bvalid(axi_smc_M07_AXI_BVALID),
        .M07_AXI_rdata(axi_smc_M07_AXI_RDATA),
        .M07_AXI_rready(axi_smc_M07_AXI_RREADY),
        .M07_AXI_rresp(axi_smc_M07_AXI_RRESP),
        .M07_AXI_rvalid(axi_smc_M07_AXI_RVALID),
        .M07_AXI_wdata(axi_smc_M07_AXI_WDATA),
        .M07_AXI_wready(axi_smc_M07_AXI_WREADY),
        .M07_AXI_wstrb(axi_smc_M07_AXI_WSTRB),
        .M07_AXI_wvalid(axi_smc_M07_AXI_WVALID),
        .M08_AXI_araddr(axi_smc_M08_AXI_ARADDR),
        .M08_AXI_arprot(axi_smc_M08_AXI_ARPROT),
        .M08_AXI_arready(axi_smc_M08_AXI_ARREADY),
        .M08_AXI_arvalid(axi_smc_M08_AXI_ARVALID),
        .M08_AXI_awaddr(axi_smc_M08_AXI_AWADDR),
        .M08_AXI_awprot(axi_smc_M08_AXI_AWPROT),
        .M08_AXI_awready(axi_smc_M08_AXI_AWREADY),
        .M08_AXI_awvalid(axi_smc_M08_AXI_AWVALID),
        .M08_AXI_bready(axi_smc_M08_AXI_BREADY),
        .M08_AXI_bresp(axi_smc_M08_AXI_BRESP),
        .M08_AXI_bvalid(axi_smc_M08_AXI_BVALID),
        .M08_AXI_rdata(axi_smc_M08_AXI_RDATA),
        .M08_AXI_rready(axi_smc_M08_AXI_RREADY),
        .M08_AXI_rresp(axi_smc_M08_AXI_RRESP),
        .M08_AXI_rvalid(axi_smc_M08_AXI_RVALID),
        .M08_AXI_wdata(axi_smc_M08_AXI_WDATA),
        .M08_AXI_wready(axi_smc_M08_AXI_WREADY),
        .M08_AXI_wstrb(axi_smc_M08_AXI_WSTRB),
        .M08_AXI_wvalid(axi_smc_M08_AXI_WVALID),
        .M09_AXI_araddr(axi_smc_M09_AXI_ARADDR),
        .M09_AXI_arprot(axi_smc_M09_AXI_ARPROT),
        .M09_AXI_arready(axi_smc_M09_AXI_ARREADY),
        .M09_AXI_arvalid(axi_smc_M09_AXI_ARVALID),
        .M09_AXI_awaddr(axi_smc_M09_AXI_AWADDR),
        .M09_AXI_awprot(axi_smc_M09_AXI_AWPROT),
        .M09_AXI_awready(axi_smc_M09_AXI_AWREADY),
        .M09_AXI_awvalid(axi_smc_M09_AXI_AWVALID),
        .M09_AXI_bready(axi_smc_M09_AXI_BREADY),
        .M09_AXI_bresp(axi_smc_M09_AXI_BRESP),
        .M09_AXI_bvalid(axi_smc_M09_AXI_BVALID),
        .M09_AXI_rdata(axi_smc_M09_AXI_RDATA),
        .M09_AXI_rready(axi_smc_M09_AXI_RREADY),
        .M09_AXI_rresp(axi_smc_M09_AXI_RRESP),
        .M09_AXI_rvalid(axi_smc_M09_AXI_RVALID),
        .M09_AXI_wdata(axi_smc_M09_AXI_WDATA),
        .M09_AXI_wready(axi_smc_M09_AXI_WREADY),
        .M09_AXI_wstrb(axi_smc_M09_AXI_WSTRB),
        .M09_AXI_wvalid(axi_smc_M09_AXI_WVALID),
        .M10_AXI_araddr(axi_smc_M10_AXI_ARADDR),
        .M10_AXI_arprot(axi_smc_M10_AXI_ARPROT),
        .M10_AXI_arready(axi_smc_M10_AXI_ARREADY),
        .M10_AXI_arvalid(axi_smc_M10_AXI_ARVALID),
        .M10_AXI_awaddr(axi_smc_M10_AXI_AWADDR),
        .M10_AXI_awprot(axi_smc_M10_AXI_AWPROT),
        .M10_AXI_awready(axi_smc_M10_AXI_AWREADY),
        .M10_AXI_awvalid(axi_smc_M10_AXI_AWVALID),
        .M10_AXI_bready(axi_smc_M10_AXI_BREADY),
        .M10_AXI_bresp(axi_smc_M10_AXI_BRESP),
        .M10_AXI_bvalid(axi_smc_M10_AXI_BVALID),
        .M10_AXI_rdata(axi_smc_M10_AXI_RDATA),
        .M10_AXI_rready(axi_smc_M10_AXI_RREADY),
        .M10_AXI_rresp(axi_smc_M10_AXI_RRESP),
        .M10_AXI_rvalid(axi_smc_M10_AXI_RVALID),
        .M10_AXI_wdata(axi_smc_M10_AXI_WDATA),
        .M10_AXI_wready(axi_smc_M10_AXI_WREADY),
        .M10_AXI_wstrb(axi_smc_M10_AXI_WSTRB),
        .M10_AXI_wvalid(axi_smc_M10_AXI_WVALID),
        .S00_AXI_araddr(microblaze_riscv_0_M_AXI_DP_ARADDR),
        .S00_AXI_arprot(microblaze_riscv_0_M_AXI_DP_ARPROT),
        .S00_AXI_arready(microblaze_riscv_0_M_AXI_DP_ARREADY),
        .S00_AXI_arvalid(microblaze_riscv_0_M_AXI_DP_ARVALID),
        .S00_AXI_awaddr(microblaze_riscv_0_M_AXI_DP_AWADDR),
        .S00_AXI_awprot(microblaze_riscv_0_M_AXI_DP_AWPROT),
        .S00_AXI_awready(microblaze_riscv_0_M_AXI_DP_AWREADY),
        .S00_AXI_awvalid(microblaze_riscv_0_M_AXI_DP_AWVALID),
        .S00_AXI_bready(microblaze_riscv_0_M_AXI_DP_BREADY),
        .S00_AXI_bresp(microblaze_riscv_0_M_AXI_DP_BRESP),
        .S00_AXI_bvalid(microblaze_riscv_0_M_AXI_DP_BVALID),
        .S00_AXI_rdata(microblaze_riscv_0_M_AXI_DP_RDATA),
        .S00_AXI_rready(microblaze_riscv_0_M_AXI_DP_RREADY),
        .S00_AXI_rresp(microblaze_riscv_0_M_AXI_DP_RRESP),
        .S00_AXI_rvalid(microblaze_riscv_0_M_AXI_DP_RVALID),
        .S00_AXI_wdata(microblaze_riscv_0_M_AXI_DP_WDATA),
        .S00_AXI_wready(microblaze_riscv_0_M_AXI_DP_WREADY),
        .S00_AXI_wstrb(microblaze_riscv_0_M_AXI_DP_WSTRB),
        .S00_AXI_wvalid(microblaze_riscv_0_M_AXI_DP_WVALID),
        .aclk(microblaze_riscv_0_Clk),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  SoC_EV_BD_axi_uartlite_0_0 axi_uartlite_0
       (.rx(usb_uart_rxd),
        .s_axi_aclk(microblaze_riscv_0_Clk),
        .s_axi_araddr(axi_smc_M00_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_smc_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M00_AXI_AWADDR),
        .s_axi_awready(axi_smc_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M00_AXI_AWVALID),
        .s_axi_bready(axi_smc_M00_AXI_BREADY),
        .s_axi_bresp(axi_smc_M00_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M00_AXI_BVALID),
        .s_axi_rdata(axi_smc_M00_AXI_RDATA),
        .s_axi_rready(axi_smc_M00_AXI_RREADY),
        .s_axi_rresp(axi_smc_M00_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M00_AXI_RVALID),
        .s_axi_wdata(axi_smc_M00_AXI_WDATA),
        .s_axi_wready(axi_smc_M00_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M00_AXI_WVALID),
        .tx(usb_uart_txd));
  SoC_EV_BD_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock),
        .clk_out1(microblaze_riscv_0_Clk),
        .reset(reset));
  SoC_EV_BD_mdm_1_0 mdm_1
       (.Dbg_Capture_0(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable_0(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_riscv_0_debug_RST),
        .Dbg_Shift_0(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO_0(microblaze_riscv_0_debug_TDO),
        .Dbg_Update_0(microblaze_riscv_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  (* BMM_INFO_PROCESSOR = "riscv > SoC_EV_BD microblaze_riscv_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  SoC_EV_BD_microblaze_riscv_0_0 microblaze_riscv_0
       (.Byte_Enable(microblaze_riscv_0_dlmb_1_BE),
        .Clk(microblaze_riscv_0_Clk),
        .DCE(microblaze_riscv_0_dlmb_1_CE),
        .DReady(microblaze_riscv_0_dlmb_1_READY),
        .DUE(microblaze_riscv_0_dlmb_1_UE),
        .DWait(microblaze_riscv_0_dlmb_1_WAIT),
        .D_AS(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_riscv_0_dlmb_1_ABUS),
        .Data_Read(microblaze_riscv_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_riscv_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_riscv_0_debug_CLK),
        .Dbg_Disable(microblaze_riscv_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_riscv_0_debug_REG_EN),
        .Dbg_Shift(microblaze_riscv_0_debug_SHIFT),
        .Dbg_TDI(microblaze_riscv_0_debug_TDI),
        .Dbg_TDO(microblaze_riscv_0_debug_TDO),
        .Dbg_Update(microblaze_riscv_0_debug_UPDATE),
        .Debug_Rst(microblaze_riscv_0_debug_RST),
        .ICE(microblaze_riscv_0_ilmb_1_CE),
        .IFetch(microblaze_riscv_0_ilmb_1_READSTROBE),
        .IReady(microblaze_riscv_0_ilmb_1_READY),
        .IUE(microblaze_riscv_0_ilmb_1_UE),
        .IWAIT(microblaze_riscv_0_ilmb_1_WAIT),
        .I_AS(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_riscv_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_riscv_0_ilmb_1_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(microblaze_riscv_0_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_riscv_0_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_riscv_0_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_riscv_0_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_riscv_0_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_riscv_0_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_riscv_0_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_riscv_0_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_riscv_0_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_riscv_0_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_riscv_0_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_riscv_0_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_riscv_0_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_riscv_0_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_riscv_0_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_riscv_0_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_riscv_0_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_riscv_0_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_riscv_0_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .Reset(proc_sys_reset_0_mb_reset),
        .Write_Strobe(microblaze_riscv_0_dlmb_1_WRITESTROBE));
  microblaze_riscv_0_local_memory_imp_PQ7701 microblaze_riscv_0_local_memory
       (.DLMB_abus(microblaze_riscv_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_riscv_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_riscv_0_dlmb_1_BE),
        .DLMB_ce(microblaze_riscv_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_riscv_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_riscv_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_riscv_0_dlmb_1_READY),
        .DLMB_ue(microblaze_riscv_0_dlmb_1_UE),
        .DLMB_wait(microblaze_riscv_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_riscv_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_riscv_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_riscv_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_riscv_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_riscv_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_riscv_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_riscv_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_riscv_0_ilmb_1_READY),
        .ILMB_ue(microblaze_riscv_0_ilmb_1_UE),
        .ILMB_wait(microblaze_riscv_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_riscv_0_Clk),
        .SYS_Rst(proc_sys_reset_0_bus_struct_reset));
  SoC_EV_BD_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .bus_struct_reset(proc_sys_reset_0_bus_struct_reset),
        .dcm_locked(1'b1),
        .ext_reset_in(reset),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(proc_sys_reset_0_mb_reset),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(microblaze_riscv_0_Clk));
endmodule

module microblaze_riscv_0_local_memory_imp_PQ7701
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire [0:31]DLMB_abus;
  wire DLMB_addrstrobe;
  wire [0:3]DLMB_be;
  wire DLMB_ce;
  wire [0:31]DLMB_readdbus;
  wire DLMB_readstrobe;
  wire DLMB_ready;
  wire DLMB_ue;
  wire DLMB_wait;
  wire [0:31]DLMB_writedbus;
  wire DLMB_writestrobe;
  wire [0:31]ILMB_abus;
  wire ILMB_addrstrobe;
  wire ILMB_ce;
  wire [0:31]ILMB_readdbus;
  wire ILMB_readstrobe;
  wire ILMB_ready;
  wire ILMB_ue;
  wire ILMB_wait;
  wire LMB_Clk;
  wire SYS_Rst;
  wire [0:31]microblaze_riscv_0_dlmb_bus_ABUS;
  wire microblaze_riscv_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_dlmb_bus_BE;
  wire microblaze_riscv_0_dlmb_bus_CE;
  wire [0:31]microblaze_riscv_0_dlmb_bus_READDBUS;
  wire microblaze_riscv_0_dlmb_bus_READSTROBE;
  wire microblaze_riscv_0_dlmb_bus_READY;
  wire microblaze_riscv_0_dlmb_bus_UE;
  wire microblaze_riscv_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_dlmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_ADDR;
  wire microblaze_riscv_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_dlmb_cntlr_DOUT;
  wire microblaze_riscv_0_dlmb_cntlr_EN;
  wire microblaze_riscv_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_ABUS;
  wire microblaze_riscv_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_riscv_0_ilmb_bus_BE;
  wire microblaze_riscv_0_ilmb_bus_CE;
  wire [0:31]microblaze_riscv_0_ilmb_bus_READDBUS;
  wire microblaze_riscv_0_ilmb_bus_READSTROBE;
  wire microblaze_riscv_0_ilmb_bus_READY;
  wire microblaze_riscv_0_ilmb_bus_UE;
  wire microblaze_riscv_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_riscv_0_ilmb_bus_WRITEDBUS;
  wire microblaze_riscv_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_ADDR;
  wire microblaze_riscv_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_riscv_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_riscv_0_ilmb_cntlr_DOUT;
  wire microblaze_riscv_0_ilmb_cntlr_EN;
  wire microblaze_riscv_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_riscv_0_ilmb_cntlr_WE;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > SoC_EV_BD microblaze_riscv_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  SoC_EV_BD_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_dlmb_cntlr_DOUT[31],microblaze_riscv_0_dlmb_cntlr_DOUT[30],microblaze_riscv_0_dlmb_cntlr_DOUT[29],microblaze_riscv_0_dlmb_cntlr_DOUT[28],microblaze_riscv_0_dlmb_cntlr_DOUT[27],microblaze_riscv_0_dlmb_cntlr_DOUT[26],microblaze_riscv_0_dlmb_cntlr_DOUT[25],microblaze_riscv_0_dlmb_cntlr_DOUT[24],microblaze_riscv_0_dlmb_cntlr_DOUT[23],microblaze_riscv_0_dlmb_cntlr_DOUT[22],microblaze_riscv_0_dlmb_cntlr_DOUT[21],microblaze_riscv_0_dlmb_cntlr_DOUT[20],microblaze_riscv_0_dlmb_cntlr_DOUT[19],microblaze_riscv_0_dlmb_cntlr_DOUT[18],microblaze_riscv_0_dlmb_cntlr_DOUT[17],microblaze_riscv_0_dlmb_cntlr_DOUT[16],microblaze_riscv_0_dlmb_cntlr_DOUT[15],microblaze_riscv_0_dlmb_cntlr_DOUT[14],microblaze_riscv_0_dlmb_cntlr_DOUT[13],microblaze_riscv_0_dlmb_cntlr_DOUT[12],microblaze_riscv_0_dlmb_cntlr_DOUT[11],microblaze_riscv_0_dlmb_cntlr_DOUT[10],microblaze_riscv_0_dlmb_cntlr_DOUT[9],microblaze_riscv_0_dlmb_cntlr_DOUT[8],microblaze_riscv_0_dlmb_cntlr_DOUT[7],microblaze_riscv_0_dlmb_cntlr_DOUT[6],microblaze_riscv_0_dlmb_cntlr_DOUT[5],microblaze_riscv_0_dlmb_cntlr_DOUT[4],microblaze_riscv_0_dlmb_cntlr_DOUT[3],microblaze_riscv_0_dlmb_cntlr_DOUT[2],microblaze_riscv_0_dlmb_cntlr_DOUT[1],microblaze_riscv_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  SoC_EV_BD_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_riscv_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_dlmb_bus_BE),
        .LMB_CE(DLMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(DLMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_dlmb_bus_READSTROBE),
        .LMB_Ready(DLMB_ready),
        .LMB_UE(DLMB_ue),
        .LMB_Wait(DLMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_dlmb_bus_WRITESTROBE),
        .M_ABus(DLMB_abus),
        .M_AddrStrobe(DLMB_addrstrobe),
        .M_BE(DLMB_be),
        .M_DBus(DLMB_writedbus),
        .M_ReadStrobe(DLMB_readstrobe),
        .M_WriteStrobe(DLMB_writestrobe),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_dlmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_dlmb_bus_WAIT));
  SoC_EV_BD_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_riscv_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_riscv_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_riscv_0_ilmb_cntlr_DOUT[31],microblaze_riscv_0_ilmb_cntlr_DOUT[30],microblaze_riscv_0_ilmb_cntlr_DOUT[29],microblaze_riscv_0_ilmb_cntlr_DOUT[28],microblaze_riscv_0_ilmb_cntlr_DOUT[27],microblaze_riscv_0_ilmb_cntlr_DOUT[26],microblaze_riscv_0_ilmb_cntlr_DOUT[25],microblaze_riscv_0_ilmb_cntlr_DOUT[24],microblaze_riscv_0_ilmb_cntlr_DOUT[23],microblaze_riscv_0_ilmb_cntlr_DOUT[22],microblaze_riscv_0_ilmb_cntlr_DOUT[21],microblaze_riscv_0_ilmb_cntlr_DOUT[20],microblaze_riscv_0_ilmb_cntlr_DOUT[19],microblaze_riscv_0_ilmb_cntlr_DOUT[18],microblaze_riscv_0_ilmb_cntlr_DOUT[17],microblaze_riscv_0_ilmb_cntlr_DOUT[16],microblaze_riscv_0_ilmb_cntlr_DOUT[15],microblaze_riscv_0_ilmb_cntlr_DOUT[14],microblaze_riscv_0_ilmb_cntlr_DOUT[13],microblaze_riscv_0_ilmb_cntlr_DOUT[12],microblaze_riscv_0_ilmb_cntlr_DOUT[11],microblaze_riscv_0_ilmb_cntlr_DOUT[10],microblaze_riscv_0_ilmb_cntlr_DOUT[9],microblaze_riscv_0_ilmb_cntlr_DOUT[8],microblaze_riscv_0_ilmb_cntlr_DOUT[7],microblaze_riscv_0_ilmb_cntlr_DOUT[6],microblaze_riscv_0_ilmb_cntlr_DOUT[5],microblaze_riscv_0_ilmb_cntlr_DOUT[4],microblaze_riscv_0_ilmb_cntlr_DOUT[3],microblaze_riscv_0_ilmb_cntlr_DOUT[2],microblaze_riscv_0_ilmb_cntlr_DOUT[1],microblaze_riscv_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_riscv_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_riscv_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_riscv_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_riscv_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  SoC_EV_BD_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_riscv_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_riscv_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_riscv_0_ilmb_bus_BE),
        .LMB_CE(ILMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(ILMB_readdbus),
        .LMB_ReadStrobe(microblaze_riscv_0_ilmb_bus_READSTROBE),
        .LMB_Ready(ILMB_ready),
        .LMB_UE(ILMB_ue),
        .LMB_Wait(ILMB_wait),
        .LMB_WriteDBus(microblaze_riscv_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_riscv_0_ilmb_bus_WRITESTROBE),
        .M_ABus(ILMB_abus),
        .M_AddrStrobe(ILMB_addrstrobe),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(ILMB_readstrobe),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_riscv_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_riscv_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_riscv_0_ilmb_bus_READY),
        .Sl_UE(microblaze_riscv_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_riscv_0_ilmb_bus_WAIT));
  SoC_EV_BD_lmb_bram_0 lmb_bram
       (.addra({microblaze_riscv_0_dlmb_cntlr_ADDR[0],microblaze_riscv_0_dlmb_cntlr_ADDR[1],microblaze_riscv_0_dlmb_cntlr_ADDR[2],microblaze_riscv_0_dlmb_cntlr_ADDR[3],microblaze_riscv_0_dlmb_cntlr_ADDR[4],microblaze_riscv_0_dlmb_cntlr_ADDR[5],microblaze_riscv_0_dlmb_cntlr_ADDR[6],microblaze_riscv_0_dlmb_cntlr_ADDR[7],microblaze_riscv_0_dlmb_cntlr_ADDR[8],microblaze_riscv_0_dlmb_cntlr_ADDR[9],microblaze_riscv_0_dlmb_cntlr_ADDR[10],microblaze_riscv_0_dlmb_cntlr_ADDR[11],microblaze_riscv_0_dlmb_cntlr_ADDR[12],microblaze_riscv_0_dlmb_cntlr_ADDR[13],microblaze_riscv_0_dlmb_cntlr_ADDR[14],microblaze_riscv_0_dlmb_cntlr_ADDR[15],microblaze_riscv_0_dlmb_cntlr_ADDR[16],microblaze_riscv_0_dlmb_cntlr_ADDR[17],microblaze_riscv_0_dlmb_cntlr_ADDR[18],microblaze_riscv_0_dlmb_cntlr_ADDR[19],microblaze_riscv_0_dlmb_cntlr_ADDR[20],microblaze_riscv_0_dlmb_cntlr_ADDR[21],microblaze_riscv_0_dlmb_cntlr_ADDR[22],microblaze_riscv_0_dlmb_cntlr_ADDR[23],microblaze_riscv_0_dlmb_cntlr_ADDR[24],microblaze_riscv_0_dlmb_cntlr_ADDR[25],microblaze_riscv_0_dlmb_cntlr_ADDR[26],microblaze_riscv_0_dlmb_cntlr_ADDR[27],microblaze_riscv_0_dlmb_cntlr_ADDR[28],microblaze_riscv_0_dlmb_cntlr_ADDR[29],microblaze_riscv_0_dlmb_cntlr_ADDR[30],microblaze_riscv_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_riscv_0_ilmb_cntlr_ADDR[0],microblaze_riscv_0_ilmb_cntlr_ADDR[1],microblaze_riscv_0_ilmb_cntlr_ADDR[2],microblaze_riscv_0_ilmb_cntlr_ADDR[3],microblaze_riscv_0_ilmb_cntlr_ADDR[4],microblaze_riscv_0_ilmb_cntlr_ADDR[5],microblaze_riscv_0_ilmb_cntlr_ADDR[6],microblaze_riscv_0_ilmb_cntlr_ADDR[7],microblaze_riscv_0_ilmb_cntlr_ADDR[8],microblaze_riscv_0_ilmb_cntlr_ADDR[9],microblaze_riscv_0_ilmb_cntlr_ADDR[10],microblaze_riscv_0_ilmb_cntlr_ADDR[11],microblaze_riscv_0_ilmb_cntlr_ADDR[12],microblaze_riscv_0_ilmb_cntlr_ADDR[13],microblaze_riscv_0_ilmb_cntlr_ADDR[14],microblaze_riscv_0_ilmb_cntlr_ADDR[15],microblaze_riscv_0_ilmb_cntlr_ADDR[16],microblaze_riscv_0_ilmb_cntlr_ADDR[17],microblaze_riscv_0_ilmb_cntlr_ADDR[18],microblaze_riscv_0_ilmb_cntlr_ADDR[19],microblaze_riscv_0_ilmb_cntlr_ADDR[20],microblaze_riscv_0_ilmb_cntlr_ADDR[21],microblaze_riscv_0_ilmb_cntlr_ADDR[22],microblaze_riscv_0_ilmb_cntlr_ADDR[23],microblaze_riscv_0_ilmb_cntlr_ADDR[24],microblaze_riscv_0_ilmb_cntlr_ADDR[25],microblaze_riscv_0_ilmb_cntlr_ADDR[26],microblaze_riscv_0_ilmb_cntlr_ADDR[27],microblaze_riscv_0_ilmb_cntlr_ADDR[28],microblaze_riscv_0_ilmb_cntlr_ADDR[29],microblaze_riscv_0_ilmb_cntlr_ADDR[30],microblaze_riscv_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_riscv_0_dlmb_cntlr_CLK),
        .clkb(microblaze_riscv_0_ilmb_cntlr_CLK),
        .dina({microblaze_riscv_0_dlmb_cntlr_DIN[0],microblaze_riscv_0_dlmb_cntlr_DIN[1],microblaze_riscv_0_dlmb_cntlr_DIN[2],microblaze_riscv_0_dlmb_cntlr_DIN[3],microblaze_riscv_0_dlmb_cntlr_DIN[4],microblaze_riscv_0_dlmb_cntlr_DIN[5],microblaze_riscv_0_dlmb_cntlr_DIN[6],microblaze_riscv_0_dlmb_cntlr_DIN[7],microblaze_riscv_0_dlmb_cntlr_DIN[8],microblaze_riscv_0_dlmb_cntlr_DIN[9],microblaze_riscv_0_dlmb_cntlr_DIN[10],microblaze_riscv_0_dlmb_cntlr_DIN[11],microblaze_riscv_0_dlmb_cntlr_DIN[12],microblaze_riscv_0_dlmb_cntlr_DIN[13],microblaze_riscv_0_dlmb_cntlr_DIN[14],microblaze_riscv_0_dlmb_cntlr_DIN[15],microblaze_riscv_0_dlmb_cntlr_DIN[16],microblaze_riscv_0_dlmb_cntlr_DIN[17],microblaze_riscv_0_dlmb_cntlr_DIN[18],microblaze_riscv_0_dlmb_cntlr_DIN[19],microblaze_riscv_0_dlmb_cntlr_DIN[20],microblaze_riscv_0_dlmb_cntlr_DIN[21],microblaze_riscv_0_dlmb_cntlr_DIN[22],microblaze_riscv_0_dlmb_cntlr_DIN[23],microblaze_riscv_0_dlmb_cntlr_DIN[24],microblaze_riscv_0_dlmb_cntlr_DIN[25],microblaze_riscv_0_dlmb_cntlr_DIN[26],microblaze_riscv_0_dlmb_cntlr_DIN[27],microblaze_riscv_0_dlmb_cntlr_DIN[28],microblaze_riscv_0_dlmb_cntlr_DIN[29],microblaze_riscv_0_dlmb_cntlr_DIN[30],microblaze_riscv_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_riscv_0_ilmb_cntlr_DIN[0],microblaze_riscv_0_ilmb_cntlr_DIN[1],microblaze_riscv_0_ilmb_cntlr_DIN[2],microblaze_riscv_0_ilmb_cntlr_DIN[3],microblaze_riscv_0_ilmb_cntlr_DIN[4],microblaze_riscv_0_ilmb_cntlr_DIN[5],microblaze_riscv_0_ilmb_cntlr_DIN[6],microblaze_riscv_0_ilmb_cntlr_DIN[7],microblaze_riscv_0_ilmb_cntlr_DIN[8],microblaze_riscv_0_ilmb_cntlr_DIN[9],microblaze_riscv_0_ilmb_cntlr_DIN[10],microblaze_riscv_0_ilmb_cntlr_DIN[11],microblaze_riscv_0_ilmb_cntlr_DIN[12],microblaze_riscv_0_ilmb_cntlr_DIN[13],microblaze_riscv_0_ilmb_cntlr_DIN[14],microblaze_riscv_0_ilmb_cntlr_DIN[15],microblaze_riscv_0_ilmb_cntlr_DIN[16],microblaze_riscv_0_ilmb_cntlr_DIN[17],microblaze_riscv_0_ilmb_cntlr_DIN[18],microblaze_riscv_0_ilmb_cntlr_DIN[19],microblaze_riscv_0_ilmb_cntlr_DIN[20],microblaze_riscv_0_ilmb_cntlr_DIN[21],microblaze_riscv_0_ilmb_cntlr_DIN[22],microblaze_riscv_0_ilmb_cntlr_DIN[23],microblaze_riscv_0_ilmb_cntlr_DIN[24],microblaze_riscv_0_ilmb_cntlr_DIN[25],microblaze_riscv_0_ilmb_cntlr_DIN[26],microblaze_riscv_0_ilmb_cntlr_DIN[27],microblaze_riscv_0_ilmb_cntlr_DIN[28],microblaze_riscv_0_ilmb_cntlr_DIN[29],microblaze_riscv_0_ilmb_cntlr_DIN[30],microblaze_riscv_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_riscv_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_riscv_0_ilmb_cntlr_DOUT),
        .ena(microblaze_riscv_0_dlmb_cntlr_EN),
        .enb(microblaze_riscv_0_ilmb_cntlr_EN),
        .rsta(microblaze_riscv_0_dlmb_cntlr_RST),
        .rstb(microblaze_riscv_0_ilmb_cntlr_RST),
        .wea({microblaze_riscv_0_dlmb_cntlr_WE[0],microblaze_riscv_0_dlmb_cntlr_WE[1],microblaze_riscv_0_dlmb_cntlr_WE[2],microblaze_riscv_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_riscv_0_ilmb_cntlr_WE[0],microblaze_riscv_0_ilmb_cntlr_WE[1],microblaze_riscv_0_ilmb_cntlr_WE[2],microblaze_riscv_0_ilmb_cntlr_WE[3]}));
endmodule
