//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Sat Sep 27 12:24:23 2025
//Host        : ThinkBook running 64-bit Ubuntu 24.04.3 LTS
//Command     : generate_target SoC_EV_BD_wrapper.bd
//Design      : SoC_EV_BD_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SoC_EV_BD_wrapper
   (IN1,
    IN2,
    IN3,
    IN4,
    btn,
    iic_rtl_scl_io,
    iic_rtl_sda_io,
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
  inout iic_rtl_scl_io;
  inout iic_rtl_sda_io;
  output [15:0]led_16bits_tri_o;
  input [2:0]photo_INT;
  output pwm_buzzer;
  output pwm_servo;
  output rclk_fnd;
  output rclk_led;
  input reset;
  output ser_fnd;
  output ser_led;
  output srclk_fnd;
  output srclk_led;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire IN1;
  wire IN2;
  wire IN3;
  wire IN4;
  wire [4:0]btn;
  wire iic_rtl_scl_i;
  wire iic_rtl_scl_io;
  wire iic_rtl_scl_o;
  wire iic_rtl_scl_t;
  wire iic_rtl_sda_i;
  wire iic_rtl_sda_io;
  wire iic_rtl_sda_o;
  wire iic_rtl_sda_t;
  wire [15:0]led_16bits_tri_o;
  wire [2:0]photo_INT;
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

  SoC_EV_BD SoC_EV_BD_i
       (.IN1(IN1),
        .IN2(IN2),
        .IN3(IN3),
        .IN4(IN4),
        .btn(btn),
        .iic_rtl_scl_i(iic_rtl_scl_i),
        .iic_rtl_scl_o(iic_rtl_scl_o),
        .iic_rtl_scl_t(iic_rtl_scl_t),
        .iic_rtl_sda_i(iic_rtl_sda_i),
        .iic_rtl_sda_o(iic_rtl_sda_o),
        .iic_rtl_sda_t(iic_rtl_sda_t),
        .led_16bits_tri_o(led_16bits_tri_o),
        .photo_INT(photo_INT),
        .pwm_buzzer(pwm_buzzer),
        .pwm_servo(pwm_servo),
        .rclk_fnd(rclk_fnd),
        .rclk_led(rclk_led),
        .reset(reset),
        .ser_fnd(ser_fnd),
        .ser_led(ser_led),
        .srclk_fnd(srclk_fnd),
        .srclk_led(srclk_led),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF iic_rtl_scl_iobuf
       (.I(iic_rtl_scl_o),
        .IO(iic_rtl_scl_io),
        .O(iic_rtl_scl_i),
        .T(iic_rtl_scl_t));
  IOBUF iic_rtl_sda_iobuf
       (.I(iic_rtl_sda_o),
        .IO(iic_rtl_sda_io),
        .O(iic_rtl_sda_i),
        .T(iic_rtl_sda_t));
endmodule
