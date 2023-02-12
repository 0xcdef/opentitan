// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_peri module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// main
//   -> s1n_28
//     -> uart0
//     -> uart1
//     -> uart2
//     -> sensor_ctrl
//     -> uart3
//     -> i2c0
//     -> i2c1
//     -> i2c2
//     -> pattgen
//     -> gpio
//     -> spi_device
//     -> rv_timer
//     -> pwrmgr_aon
//     -> rstmgr_aon
//     -> clkmgr_aon
//     -> pinmux_aon
//     -> otp_ctrl.core
//     -> otp_ctrl.prim
//     -> lc_ctrl
//     -> alert_handler
//     -> ast
//     -> sram_ctrl_ret_aon.ram
//     -> sram_ctrl_ret_aon.regs
//     -> aon_timer_aon
//     -> adc_ctrl_aon
//     -> sysrst_ctrl_aon
//     -> pwm_aon

module xbar_peri (
  input clk_peri_i,
  input rst_peri_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_main_i,
  output tlul_pkg::tl_d2h_t tl_main_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_uart0_o,
  input  tlul_pkg::tl_d2h_t tl_uart0_i,
  output tlul_pkg::tl_h2d_t tl_uart1_o,
  input  tlul_pkg::tl_d2h_t tl_uart1_i,
  output tlul_pkg::tl_h2d_t tl_uart2_o,
  input  tlul_pkg::tl_d2h_t tl_uart2_i,
  output tlul_pkg::tl_h2d_t tl_uart3_o,
  input  tlul_pkg::tl_d2h_t tl_uart3_i,
  output tlul_pkg::tl_h2d_t tl_i2c0_o,
  input  tlul_pkg::tl_d2h_t tl_i2c0_i,
  output tlul_pkg::tl_h2d_t tl_i2c1_o,
  input  tlul_pkg::tl_d2h_t tl_i2c1_i,
  output tlul_pkg::tl_h2d_t tl_i2c2_o,
  input  tlul_pkg::tl_d2h_t tl_i2c2_i,
  output tlul_pkg::tl_h2d_t tl_pattgen_o,
  input  tlul_pkg::tl_d2h_t tl_pattgen_i,
  output tlul_pkg::tl_h2d_t tl_pwm_aon_o,
  input  tlul_pkg::tl_d2h_t tl_pwm_aon_i,
  output tlul_pkg::tl_h2d_t tl_gpio_o,
  input  tlul_pkg::tl_d2h_t tl_gpio_i,
  output tlul_pkg::tl_h2d_t tl_spi_device_o,
  input  tlul_pkg::tl_d2h_t tl_spi_device_i,
  output tlul_pkg::tl_h2d_t tl_rv_timer_o,
  input  tlul_pkg::tl_d2h_t tl_rv_timer_i,
  output tlul_pkg::tl_h2d_t tl_sensor_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_sensor_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_pwrmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_pwrmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_rstmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_rstmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_clkmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_clkmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_pinmux_aon_o,
  input  tlul_pkg::tl_d2h_t tl_pinmux_aon_i,
  output tlul_pkg::tl_h2d_t tl_otp_ctrl__core_o,
  input  tlul_pkg::tl_d2h_t tl_otp_ctrl__core_i,
  output tlul_pkg::tl_h2d_t tl_otp_ctrl__prim_o,
  input  tlul_pkg::tl_d2h_t tl_otp_ctrl__prim_i,
  output tlul_pkg::tl_h2d_t tl_lc_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_lc_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_alert_handler_o,
  input  tlul_pkg::tl_d2h_t tl_alert_handler_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_ret_aon__regs_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_ret_aon__regs_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_ret_aon__ram_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_ret_aon__ram_i,
  output tlul_pkg::tl_h2d_t tl_aon_timer_aon_o,
  input  tlul_pkg::tl_d2h_t tl_aon_timer_aon_i,
  output tlul_pkg::tl_h2d_t tl_sysrst_ctrl_aon_o,
  input  tlul_pkg::tl_d2h_t tl_sysrst_ctrl_aon_i,
  output tlul_pkg::tl_h2d_t tl_adc_ctrl_aon_o,
  input  tlul_pkg::tl_d2h_t tl_adc_ctrl_aon_i,
  output tlul_pkg::tl_h2d_t tl_ast_o,
  input  tlul_pkg::tl_d2h_t tl_ast_i,

  input prim_mubi_pkg::mubi4_t scanmode_i
);

  import tlul_pkg::*;
  import tl_peri_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = ^scanmode_i;

  tl_h2d_t tl_s1n_28_us_h2d ;
  tl_d2h_t tl_s1n_28_us_d2h ;


  tl_h2d_t tl_s1n_28_ds_h2d [27];
  tl_d2h_t tl_s1n_28_ds_d2h [27];

  // Create steering signal
  logic [4:0] dev_sel_s1n_28;



  assign tl_uart0_o = tl_s1n_28_ds_h2d[0];
  assign tl_s1n_28_ds_d2h[0] = tl_uart0_i;

  assign tl_uart1_o = tl_s1n_28_ds_h2d[1];
  assign tl_s1n_28_ds_d2h[1] = tl_uart1_i;

  assign tl_uart2_o = tl_s1n_28_ds_h2d[2];
  assign tl_s1n_28_ds_d2h[2] = tl_uart2_i;

  assign tl_sensor_ctrl_o = tl_s1n_28_ds_h2d[3];
  assign tl_s1n_28_ds_d2h[3] = tl_sensor_ctrl_i;

  assign tl_uart3_o = tl_s1n_28_ds_h2d[4];
  assign tl_s1n_28_ds_d2h[4] = tl_uart3_i;

  assign tl_i2c0_o = tl_s1n_28_ds_h2d[5];
  assign tl_s1n_28_ds_d2h[5] = tl_i2c0_i;

  assign tl_i2c1_o = tl_s1n_28_ds_h2d[6];
  assign tl_s1n_28_ds_d2h[6] = tl_i2c1_i;

  assign tl_i2c2_o = tl_s1n_28_ds_h2d[7];
  assign tl_s1n_28_ds_d2h[7] = tl_i2c2_i;

  assign tl_pattgen_o = tl_s1n_28_ds_h2d[8];
  assign tl_s1n_28_ds_d2h[8] = tl_pattgen_i;

  assign tl_gpio_o = tl_s1n_28_ds_h2d[9];
  assign tl_s1n_28_ds_d2h[9] = tl_gpio_i;

  assign tl_spi_device_o = tl_s1n_28_ds_h2d[10];
  assign tl_s1n_28_ds_d2h[10] = tl_spi_device_i;

  assign tl_rv_timer_o = tl_s1n_28_ds_h2d[11];
  assign tl_s1n_28_ds_d2h[11] = tl_rv_timer_i;

  assign tl_pwrmgr_aon_o = tl_s1n_28_ds_h2d[12];
  assign tl_s1n_28_ds_d2h[12] = tl_pwrmgr_aon_i;

  assign tl_rstmgr_aon_o = tl_s1n_28_ds_h2d[13];
  assign tl_s1n_28_ds_d2h[13] = tl_rstmgr_aon_i;

  assign tl_clkmgr_aon_o = tl_s1n_28_ds_h2d[14];
  assign tl_s1n_28_ds_d2h[14] = tl_clkmgr_aon_i;

  assign tl_pinmux_aon_o = tl_s1n_28_ds_h2d[15];
  assign tl_s1n_28_ds_d2h[15] = tl_pinmux_aon_i;

  assign tl_otp_ctrl__core_o = tl_s1n_28_ds_h2d[16];
  assign tl_s1n_28_ds_d2h[16] = tl_otp_ctrl__core_i;

  assign tl_otp_ctrl__prim_o = tl_s1n_28_ds_h2d[17];
  assign tl_s1n_28_ds_d2h[17] = tl_otp_ctrl__prim_i;

  assign tl_lc_ctrl_o = tl_s1n_28_ds_h2d[18];
  assign tl_s1n_28_ds_d2h[18] = tl_lc_ctrl_i;

  assign tl_alert_handler_o = tl_s1n_28_ds_h2d[19];
  assign tl_s1n_28_ds_d2h[19] = tl_alert_handler_i;

  assign tl_ast_o = tl_s1n_28_ds_h2d[20];
  assign tl_s1n_28_ds_d2h[20] = tl_ast_i;

  assign tl_sram_ctrl_ret_aon__ram_o = tl_s1n_28_ds_h2d[21];
  assign tl_s1n_28_ds_d2h[21] = tl_sram_ctrl_ret_aon__ram_i;

  assign tl_sram_ctrl_ret_aon__regs_o = tl_s1n_28_ds_h2d[22];
  assign tl_s1n_28_ds_d2h[22] = tl_sram_ctrl_ret_aon__regs_i;

  assign tl_aon_timer_aon_o = tl_s1n_28_ds_h2d[23];
  assign tl_s1n_28_ds_d2h[23] = tl_aon_timer_aon_i;

  assign tl_adc_ctrl_aon_o = tl_s1n_28_ds_h2d[24];
  assign tl_s1n_28_ds_d2h[24] = tl_adc_ctrl_aon_i;

  assign tl_sysrst_ctrl_aon_o = tl_s1n_28_ds_h2d[25];
  assign tl_s1n_28_ds_d2h[25] = tl_sysrst_ctrl_aon_i;

  assign tl_pwm_aon_o = tl_s1n_28_ds_h2d[26];
  assign tl_s1n_28_ds_d2h[26] = tl_pwm_aon_i;

  assign tl_s1n_28_us_h2d = tl_main_i;
  assign tl_main_o = tl_s1n_28_us_d2h;

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_28 = 5'd27;
    if ((tl_s1n_28_us_h2d.a_address &
         ~(ADDR_MASK_UART0)) == ADDR_SPACE_UART0) begin
      dev_sel_s1n_28 = 5'd0;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_UART1)) == ADDR_SPACE_UART1) begin
      dev_sel_s1n_28 = 5'd1;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_UART2)) == ADDR_SPACE_UART2) begin
      dev_sel_s1n_28 = 5'd2;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_SENSOR_CTRL)) == ADDR_SPACE_SENSOR_CTRL) begin
      dev_sel_s1n_28 = 5'd3;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_UART3)) == ADDR_SPACE_UART3) begin
      dev_sel_s1n_28 = 5'd4;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_I2C0)) == ADDR_SPACE_I2C0) begin
      dev_sel_s1n_28 = 5'd5;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_I2C1)) == ADDR_SPACE_I2C1) begin
      dev_sel_s1n_28 = 5'd6;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_I2C2)) == ADDR_SPACE_I2C2) begin
      dev_sel_s1n_28 = 5'd7;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_PATTGEN)) == ADDR_SPACE_PATTGEN) begin
      dev_sel_s1n_28 = 5'd8;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_GPIO)) == ADDR_SPACE_GPIO) begin
      dev_sel_s1n_28 = 5'd9;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_SPI_DEVICE)) == ADDR_SPACE_SPI_DEVICE) begin
      dev_sel_s1n_28 = 5'd10;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_RV_TIMER)) == ADDR_SPACE_RV_TIMER) begin
      dev_sel_s1n_28 = 5'd11;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_PWRMGR_AON)) == ADDR_SPACE_PWRMGR_AON) begin
      dev_sel_s1n_28 = 5'd12;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_RSTMGR_AON)) == ADDR_SPACE_RSTMGR_AON) begin
      dev_sel_s1n_28 = 5'd13;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_CLKMGR_AON)) == ADDR_SPACE_CLKMGR_AON) begin
      dev_sel_s1n_28 = 5'd14;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_PINMUX_AON)) == ADDR_SPACE_PINMUX_AON) begin
      dev_sel_s1n_28 = 5'd15;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_OTP_CTRL__CORE)) == ADDR_SPACE_OTP_CTRL__CORE) begin
      dev_sel_s1n_28 = 5'd16;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_OTP_CTRL__PRIM)) == ADDR_SPACE_OTP_CTRL__PRIM) begin
      dev_sel_s1n_28 = 5'd17;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_LC_CTRL)) == ADDR_SPACE_LC_CTRL) begin
      dev_sel_s1n_28 = 5'd18;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_ALERT_HANDLER)) == ADDR_SPACE_ALERT_HANDLER) begin
      dev_sel_s1n_28 = 5'd19;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_AST)) == ADDR_SPACE_AST) begin
      dev_sel_s1n_28 = 5'd20;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_RET_AON__RAM)) == ADDR_SPACE_SRAM_CTRL_RET_AON__RAM) begin
      dev_sel_s1n_28 = 5'd21;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_RET_AON__REGS)) == ADDR_SPACE_SRAM_CTRL_RET_AON__REGS) begin
      dev_sel_s1n_28 = 5'd22;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_AON_TIMER_AON)) == ADDR_SPACE_AON_TIMER_AON) begin
      dev_sel_s1n_28 = 5'd23;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_ADC_CTRL_AON)) == ADDR_SPACE_ADC_CTRL_AON) begin
      dev_sel_s1n_28 = 5'd24;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_SYSRST_CTRL_AON)) == ADDR_SPACE_SYSRST_CTRL_AON) begin
      dev_sel_s1n_28 = 5'd25;

    end else if ((tl_s1n_28_us_h2d.a_address &
                  ~(ADDR_MASK_PWM_AON)) == ADDR_SPACE_PWM_AON) begin
      dev_sel_s1n_28 = 5'd26;
end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .HReqPass  (1'b0),
    .HRspPass  (1'b0),
    .DReqPass  (27'h8),
    .DRspPass  (27'h8),
    .DReqDepth (108'h111111111111111111111110111),
    .DRspDepth (108'h111111111111111111111110111),
    .N         (27)
  ) u_s1n_28 (
    .clk_i        (clk_peri_i),
    .rst_ni       (rst_peri_ni),
    .tl_h_i       (tl_s1n_28_us_h2d),
    .tl_h_o       (tl_s1n_28_us_d2h),
    .tl_d_o       (tl_s1n_28_ds_h2d),
    .tl_d_i       (tl_s1n_28_ds_d2h),
    .dev_select_i (dev_sel_s1n_28)
  );

endmodule
