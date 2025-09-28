`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 11:23:59 AM
// Design Name: 
// Module Name: test_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ring_counter_led_top(
    input clk, reset_p,
    output reg [15:0] led);
    
    reg [20:0] clk_div;
    always @(posedge clk)clk_div = clk_div + 1;
    wire clk_div_18;
    edge_detector_p clk_div_edge(
        .clk(clk), .reset_p(reset_p), .cp(clk_div[18]),
        .p_edge(clk_div_18));
    
    always @(posedge clk or posedge reset_p)begin
        if(reset_p)led = 16'b0000_0000_0000_0001;
        else if(clk_div_18)led = {led[14:0], led[15]};
    end
    
endmodule

module watch(
    input clk, reset_p,
    input btn_mode, inc_sec, inc_min,
    output reg [7:0] sec, min,
    output reg set_watch);

    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            set_watch = 0;
        end
        else if(btn_mode)begin
            set_watch = ~set_watch;
        end
    end

    reg [26:0] cnt_sysclk;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            cnt_sysclk = 0;
            sec = 0;
            min = 0;
        end
        else begin
            if(set_watch)begin
                if(inc_sec)begin
                    if(sec >= 59)sec = 0;
                    else sec = sec + 1;
                end
                if(inc_min)begin
                    if(min >= 59)min = 0;
                    else min = min + 1;
                end
            end
            else begin
                if(cnt_sysclk >= 27'd99_999_999)begin
                    cnt_sysclk = 0;
                    if(sec >= 59)begin
                        sec = 0;
                        if(min >= 59)min = 0;
                        else min = min + 1;
                    end
                    else sec = sec + 1;
                end
                else cnt_sysclk = cnt_sysclk + 1;
            end
        end
    end

endmodule

module watch_top(
    input clk, reset_p,
    input [2:0] btn,
    output [7:0] seg_7,
    output [3:0] com,
    output [15:0] led);
    
    wire btn_mode, inc_sec, inc_min;
    wire [7:0] sec, min;
    wire set_watch;
    wire [15:0] sec_bcd, min_bcd;
    assign led[0] = set_watch;
    btn_cntr mode_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[0]), .btn_pedge(btn_mode));
    btn_cntr inc_sec__btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[1]), .btn_pedge(inc_sec));
    btn_cntr inc_min_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[2]), .btn_pedge(inc_min));
    
    watch watch_instance(.clk(clk), .reset_p(reset_p),
        .btn_mode(btn_mode), .inc_sec(inc_sec), .inc_min(inc_min),
        .sec(sec), .min(min), .set_watch(set_watch));
    
    bin_to_dec bcd_sec(.bin(sec), .bcd(sec_bcd));
    bin_to_dec bcd_min(.bin(min), .bcd(min_bcd));
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value({min_bcd[7:0], sec_bcd[7:0]}), .hex_bcd(1),
        .seg_7(seg_7), .com(com));

endmodule

module cook_timer(
    input clk, reset_p,
    input btn_mode, inc_sec, inc_min, alarm_off,
    output reg [7:0] sec, min,
    output reg alarm,
    output reg start_set);

    reg set_flag;
    
    wire [15:0] cur_time = {min, sec};
    reg [7:0] set_sec, set_min;
    reg [26:0] cnt_sysclk = 0;
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            start_set = 0;
            alarm = 0;
        end
        else if(btn_mode && cur_time != 0 && start_set == 0)begin
            start_set = 1;
            set_sec = sec;
            set_min = min;
        end
        else if(start_set && btn_mode)begin
            start_set = 0;
        end
        else if(start_set && min == 0 && sec == 0)begin
            start_set = 0;
            alarm = 1;
        end
        else if(alarm && (alarm_off || inc_sec || inc_min || btn_mode))begin
            alarm = 0;
            set_flag = 1;
        end
        else if(cur_time != 0)set_flag = 0;
    end
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            cnt_sysclk = 0;
            sec = 0;
            min = 0;        
        end
        else begin
            if(start_set)begin
                if(cnt_sysclk >= 99_999_999)begin
                    cnt_sysclk = 0;
                    if(sec == 0)begin
                        if(min)begin
                            sec = 59;
                            min = min - 1;
                        end
                    end
                    else sec = sec - 1;
                end
                else cnt_sysclk = cnt_sysclk + 1;
            end
            else begin
                if(inc_sec)begin
                    if(sec >= 59) sec = 0;
                    else sec = sec + 1;
                end
                else if(inc_min)begin
                    if(min >= 99)min = 0;
                    else min = min + 1;
                end
                if(set_flag)begin
                    sec = set_sec;
                    min = set_min;
                end
            end
        end
    end


endmodule

module cook_timer_top(
    input clk, reset_p,
    input [3:0] btn,
    output [7:0] seg_7,
    output [3:0] com,
    output alarm,
    output [15:0] led);
    
    wire start_set;
    assign led[0] = start_set;
    assign led[15] = alarm;
    
    wire [7:0] sec, min;
    
    wire btn_mode, inc_sec, inc_min, alarm_off;
    wire [7:0] sec_bcd, min_bcd;    
    
    btn_cntr mode_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[0]), .btn_pedge(btn_mode));
    btn_cntr inc_sec__btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[1]), .btn_pedge(inc_sec));
    btn_cntr inc_min_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[2]), .btn_pedge(inc_min));
    btn_cntr alarm_off_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[3]), .btn_pedge(alarm_off));
    
    cook_timer cook_timer_instance(.clk(clk), .reset_p(reset_p),
        .btn_mode(btn_mode), .inc_sec(inc_sec), 
        .inc_min(inc_min), .alarm_off(alarm_off),
        .sec(sec), .min(min),
        .alarm(alarm), .start_set(start_set));

    bin_to_dec bcd_sec(.bin(sec), .bcd(sec_bcd));
    bin_to_dec bcd_min(.bin(min), .bcd(min_bcd));
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value({min_bcd[7:0], sec_bcd[7:0]}), .hex_bcd(1),
        .seg_7(seg_7), .com(com));
    
endmodule

module stop_watch(
    input clk, reset_p,
    input start_stop, lap, clear,
    output reg [7:0] min, sec, csec, lap_min, lap_sec, lap_csec
    );
    
    wire lap_pedge, clear_pedge;
    
    edge_detector_p lap_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(lap),
        .p_edge(lap_pedge)
    );
    
    edge_detector_p clear_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(clear),
        .p_edge(clear_pedge)
    );
    
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            lap_min = 0;
            lap_sec = 0;
            lap_csec = 0;
        end
        else if(lap_pedge)begin
            lap_min = min;
            lap_sec = sec;
            lap_csec = csec;
        end
        else if(clear_pedge)begin
            lap_min = 0;
            lap_sec = 0;
            lap_csec = 0;
        end
    end
    
    reg [26:0] cnt_sysclk;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            min = 0;
            sec = 0;
            csec = 0;
            cnt_sysclk = 0;
        end
        else begin
            if(start_stop)begin
                if(cnt_sysclk >= 999_999)begin
                    cnt_sysclk = 0;
                    if(csec >= 99)begin
                        csec = 0;
                        if(sec >= 59) begin
                            sec = 0;
                            if(min >= 99) begin
                                min = 0;
                            end else min = min + 1;
                        end else sec = sec + 1;
                    end else csec = csec + 1;
                end else cnt_sysclk = cnt_sysclk + 1;
            end
            if(clear_pedge)begin
                min = 0;
                sec = 0;
                csec = 0;
                cnt_sysclk = 0;
            end
        end
    end
endmodule

module stop_watch_top(
    input clk, reset_p,
    input [2:0] btn,
    output [7:0] seg_7, 
    output [3:0] com,
    output [15:0] led);

    wire btn_start, btn_lap, btn_clear;
    wire [7:0] fnd_sec, fnd_csec;
    wire lap, start_stop;
    assign led[0] = start_stop;
    assign led[1] = lap;
    
    btn_cntr start_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[0]), .btn_pedge(btn_start));
    btn_cntr lap__btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[1]), .btn_pedge(btn_lap));
    btn_cntr clear_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[2]), .btn_pedge(btn_clear));
    
    stop_watch stop_watch_instance(.clk(clk), .reset_p(reset_p),
        .btn_start(btn_start), .btn_lap(btn_lap), .btn_clear(btn_clear),
        .fnd_sec(fnd_sec), .fnd_csec(fnd_csec),
        .lap(lap), .start_stop(start_stop));
            
    wire [7:0] sec_bcd, csec_bcd;
    bin_to_dec bcd_sec(.bin(fnd_sec), .bcd(sec_bcd));
    bin_to_dec bcd_csec(.bin(fnd_csec), .bcd(csec_bcd));
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value({sec_bcd, csec_bcd}), .hex_bcd(1),
        .seg_7(seg_7), .com(com));
endmodule

module multifunction_watch_top(
    input clk, reset_p,
    input [3:0] btn,
    input alarm_off,
    output [7:0] seg_7,
    output [3:0] com,
    output alarm,
    output [15:0] led);
    
    localparam WATCH = 0;
    localparam COOK_TIMER = 1;
    localparam STOP_WATCH = 2;
    
    reg [1:0] mode;
    assign led[1:0] = mode;
    assign led[15] = alarm;
    wire btn_mode;
    btn_cntr mode_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[0]), .btn_pedge(btn_mode));
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)mode = WATCH;
        else if(btn_mode)begin
            if(mode == WATCH)      mode = COOK_TIMER;
            else if(mode == COOK_TIMER) mode = STOP_WATCH;
            else if(mode == STOP_WATCH) mode = WATCH;
        end
    end    
    reg [2:0] watch_btn, cook_btn, stop_btn;
    wire [7:0] watch_seg_7, cook_seg_7, stop_seg_7;
    wire [3:0] watch_com, cook_com, stop_com;
    always @(*)begin
        case(mode)
            WATCH:begin
                watch_btn = btn[3:1];
                cook_btn = 0;
                stop_btn = 0;
            end
            COOK_TIMER:begin
                watch_btn = 0;
                cook_btn = btn[3:1];
                stop_btn = 0;
            end
            STOP_WATCH:begin
                watch_btn = 0;
                cook_btn = 0;
                stop_btn = btn[3:1];
            end
        endcase
    end
    
    watch_top watch(.clk(clk), .reset_p(reset_p),
        .btn(watch_btn), .seg_7(watch_seg_7), .com(watch_com));
    
    
    cook_timer_top timer(.clk(clk), .reset_p(reset_p),
        .btn({alarm_off, cook_btn}), .seg_7(cook_seg_7), .com(cook_com), 
        .alarm(alarm));
    
    stop_watch_top stop(.clk(clk), .reset_p(reset_p),
        .btn(stop_btn), .seg_7(stop_seg_7), .com(stop_com));
        
    assign seg_7 = mode == WATCH ? watch_seg_7 :
                   mode == COOK_TIMER ? cook_seg_7 :
                   mode == STOP_WATCH ? stop_seg_7 :  watch_seg_7;             
    assign com = mode == WATCH ? watch_com :
                   mode == COOK_TIMER ? cook_com :
                   mode == STOP_WATCH ? stop_com :  watch_com; 

endmodule

module multifunction_watch_top_v2(
    input clk, reset_p,
    input [3:0] btn,
    input alarm_off,
    output [7:0] seg_7,
    output [3:0] com,
    output alarm,
    output [15:0] led);
    
    localparam WATCH = 0;
    localparam COOK_TIMER = 1;
    localparam STOP_WATCH = 2;
    
    reg [1:0] mode;
    assign led[1:0] = mode;
    assign led[15] = alarm;
    wire btn_mode;
    btn_cntr mode_btn(
        .clk(clk), .reset_p(reset_p), .btn(btn[0]), .btn_pedge(btn_mode));
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)mode = WATCH;
        else if(btn_mode)begin
            if(mode == WATCH)      mode = COOK_TIMER;
            else if(mode == COOK_TIMER) mode = STOP_WATCH;
            else if(mode == STOP_WATCH) mode = WATCH;
        end
    end
    wire [2:0] debounced_btn_pedge; 
    btn_cntr mode_btn1(
        .clk(clk), .reset_p(reset_p), .btn(btn[1]), .btn_pedge(debounced_btn_pedge[0]));
    btn_cntr mode_btn2(
        .clk(clk), .reset_p(reset_p), .btn(btn[2]), .btn_pedge(debounced_btn_pedge[1]));
    btn_cntr mode_btn3(
        .clk(clk), .reset_p(reset_p), .btn(btn[3]), .btn_pedge(debounced_btn_pedge[2]));    
    
    reg [2:0] watch_btn, cook_btn, stop_btn;
    always @(*)begin
        case(mode)
            WATCH:begin
                watch_btn = debounced_btn_pedge;
                cook_btn = 0;
                stop_btn = 0;
            end
            COOK_TIMER:begin
                watch_btn = 0;
                cook_btn = debounced_btn_pedge;
                stop_btn = 0;
            end
            STOP_WATCH:begin
                watch_btn = 0;
                cook_btn = 0;
                stop_btn = debounced_btn_pedge;
            end
        endcase
    end
    wire [7:0] watch_sec, watch_min, cook_sec, cook_min, stop_sec, stop_csec;
    wire set_watch;
    assign led[4] = set_watch;
    watch watch_instance(.clk(clk), .reset_p(reset_p),
        .btn_mode(watch_btn[0]), .inc_sec(watch_btn[1]), .inc_min(watch_btn[2]),
        .sec(watch_sec), .min(watch_min), .set_watch(set_watch));
    wire start_set;
    assign led[6] = start_set;
    cook_timer cook_timer_instance(.clk(clk), .reset_p(reset_p),
        .btn_mode(cook_btn[0]), .inc_sec(cook_btn[1]), 
        .inc_min(cook_btn[2]), .alarm_off(alarm_off),
        .sec(cook_sec), .min(cook_min),
        .alarm(alarm), .start_set(start_set));
    wire lap, start_stop;
    assign led[8] = start_stop;
    assign led[9] = lap;    
    stop_watch stop_watch_instance(.clk(clk), .reset_p(reset_p),
        .btn_start(stop_btn[0]), .btn_lap(stop_btn[1]), .btn_clear(stop_btn[2]),
        .fnd_sec(stop_sec), .fnd_csec(stop_csec),
        .lap(lap), .start_stop(start_stop));
    
    wire [7:0] bin_low, bin_high;
    wire [7:0] fnd_value_low, fnd_value_high;
    wire [15:0]fnd_value = {fnd_value_high, fnd_value_low}; 
    assign bin_low = mode == WATCH ? watch_sec :
                   mode == COOK_TIMER ? cook_sec :
                   mode == STOP_WATCH ? stop_csec :  watch_sec;             
    assign bin_high = mode == WATCH ? watch_min :
                   mode == COOK_TIMER ? cook_min :
                   mode == STOP_WATCH ? stop_sec :  watch_min;
    
    bin_to_dec bcd_low(.bin(bin_low), .bcd(fnd_value_low));
    bin_to_dec bcd_high(.bin(bin_high), .bcd(fnd_value_high));   
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value(fnd_value),
        .hex_bcd(1),
        .seg_7(seg_7), .com(com));

endmodule

module dht11_top(
    input clk, reset_p,
    inout dht11_data,
    output [7:0] seg_7, 
    output [3:0] com,
    output [15:0] led);
    
    wire [7:0] humidity, temperature;
    dht11_cntr dht11(
        clk, reset_p,
        dht11_data,
        humidity, temperature, led);
    
    wire [7:0] humi_bcd, tmpr_bcd;
    bin_to_dec bcd_humi(.bin(humidity), .bcd(humi_bcd));
    bin_to_dec bcd_tmpr(.bin(temperature), .bcd(tmpr_bcd));   
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value({humi_bcd, tmpr_bcd}),
        .hex_bcd(1),
        .seg_7(seg_7), .com(com));


endmodule

module hc_sr04_top(
    input clk, reset_p,
    input echo,
    output trig,
    output [7:0] seg_7,
    output [3:0] com,
    output [15:0] led);
    
    wire [11:0] distance_cm, distance_cm_bcd;
    hc_sr04_cntr_MHG ultra_sonic(clk, reset_p, echo, trig, distance_cm, led);
    bin_to_dec bcd_dist(.bin(distance_cm), .bcd(distance_cm_bcd));   
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value(distance_cm_bcd),
        .hex_bcd(1),
        .seg_7(seg_7), .com(com));
    
endmodule

module keypad_top(
    input clk, reset_p,
    input [3:0] row,
    output [3:0] column,
    output [7:0] seg_7,
    output [3:0] com,
    output [15:0] led);
    
    wire [3:0] key_value;
    wire key_valid;
    assign led[0] = key_valid;
    
    keypad_cntr key_pad(clk, reset_p, row, column, key_value, key_valid, led[5:1]);
    
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value(key_value),
        .hex_bcd(1),
        .seg_7(seg_7), .com(com));

endmodule

module i2c_txtlcd_top(
    input clk, reset_p,
    input [3:0] btn,
    input [3:0] row,
    output [3:0] column,
    output scl, sda,
    output [15:0] led);

    wire [3:0] btn_pedge;
    btn_cntr btn0(clk, reset_p, btn[0], btn_pedge[0]);
    btn_cntr btn1(clk, reset_p, btn[1], btn_pedge[1]);
    btn_cntr btn2(clk, reset_p, btn[2], btn_pedge[2]);
    btn_cntr btn3(clk, reset_p, btn[3], btn_pedge[3]);
    
    integer cnt_sysclk;
    reg count_clk_e;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)cnt_sysclk = 0;
        else if(count_clk_e)cnt_sysclk = cnt_sysclk + 1;
        else cnt_sysclk = 0;
    end
    
    reg [7:0] send_buffer;
    reg send, rs;
    wire busy;
    i2c_lcd_send_byte send_byte(clk, reset_p, 7'h27, send_buffer, 
                      send, rs, scl, sda, busy, led);
    wire [3:0] key_value;
    wire key_valid;                  
    keypad_cntr keypad(clk, reset_p, row, column, key_value, key_valid);
    
    wire key_valid_pedge;
    edge_detector_p echo_ed(
        .clk(clk), .reset_p(reset_p), .cp(key_valid),
        .p_edge(key_valid_pedge));
    
    localparam IDLE                 = 6'b00_0001;
    localparam INIT                 = 6'b00_0010;
    localparam SEND_CHARACTER       = 6'b00_0100;
    localparam SHIFT_RIGHT_DISPLAY  = 6'b00_1000;
    localparam SHIFT_LEFT_DISPLAY   = 6'b01_0000;
    localparam SEND_KEY             = 6'b10_0000;
    
    reg [5:0] state, next_state;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)state = IDLE;
        else state = next_state;
    end
    
    reg init_flag; 
    reg [10:0] cnt_data;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            next_state = IDLE;
            init_flag = 0;
            count_clk_e = 0;
            send = 0;
            send_buffer = 0;
            rs = 0;
            cnt_data = 0;
        end
        else begin
            case(state)
                IDLE               :begin
                    if(init_flag)begin
                        if(btn_pedge[0])next_state = SEND_CHARACTER;
                        if(btn_pedge[1])next_state = SHIFT_RIGHT_DISPLAY;
                        if(btn_pedge[2])next_state = SHIFT_LEFT_DISPLAY;
                        if(key_valid_pedge)next_state = SEND_KEY;
                    end
                    else begin
                        if(cnt_sysclk <= 32'd80_000_00)begin
                            count_clk_e = 1;
                        end
                        else begin
                            next_state = INIT;
                            count_clk_e = 0;
                        end
                    end
                end
                INIT               :begin
                    if(busy)begin
                        send = 0;
                        if(cnt_data >= 6)begin
                            cnt_data = 0;
                            next_state = IDLE;
                            init_flag = 1;
                        end
                    end
                    else if(!send)begin
                        case(cnt_data)
                            0:send_buffer = 8'h33;
                            1:send_buffer = 8'h32;
                            2:send_buffer = 8'h28;
                            3:send_buffer = 8'h0c;
                            4:send_buffer = 8'h01;
                            5:send_buffer = 8'h06;
                        endcase
                        send = 1;
                        cnt_data = cnt_data + 1;
                    end
                end
                SEND_CHARACTER     :begin
                    if(busy)begin
                        next_state = IDLE;
                        send = 0;
                        if(cnt_data >= 25)cnt_data = 0;
                        else cnt_data = cnt_data + 1;
                    end
                    else begin
                        rs = 1;
                        send_buffer = "a" + cnt_data;
                        send = 1;
                    end
                end
                SHIFT_RIGHT_DISPLAY:begin
                    if(busy)begin
                        next_state = IDLE;
                        send = 0;
                    end
                    else begin
                        rs = 0;
                        send_buffer = 8'h1c;
                        send = 1;
                    end
                end
                SHIFT_LEFT_DISPLAY :begin
                    if(busy)begin
                        next_state = IDLE;
                        send = 0;
                    end
                    else begin
                        rs = 0;
                        send_buffer = 8'h18;
                        send = 1;
                    end
                end
                SEND_KEY           :begin
                    if(busy)begin
                        next_state = IDLE;
                        send = 0;
                    end
                    else begin
                        rs = 1;
                        if(key_value < 10)send_buffer = "0" + key_value;
                        else if(key_value == 10)send_buffer = "+";
                        else if(key_value == 11)send_buffer = "-";
                        else if(key_value == 12)send_buffer = "C";
                        else if(key_value == 13)send_buffer = "/";
                        else if(key_value == 14)send_buffer = "*";
                        else if(key_value == 15)send_buffer = "=";
                        send = 1;
                    end
                end
            endcase
        end
    end

endmodule

module led_pwm_top(
    input clk, reset_p,
    output led_r, led_g, led_b,
    output [15:0] led);

    integer cnt;
    always @(posedge clk)cnt = cnt + 1;
    
    pwm_Nfreq_Nstep #(.duty_step_N(200)) pwm_led_r(clk, reset_p, cnt[27:20], led_r);
    pwm_Nfreq_Nstep #(.duty_step_N(100)) pwm_led_g(clk, reset_p, cnt[28:21], led_g);
    pwm_Nfreq_Nstep #(.duty_step_N(100)) pwm_led_b(clk, reset_p, cnt[29:22], led_b);
    
    
endmodule

module sg90_top(
    input clk, reset_p, 
    output sg90);

    integer step, cnt;
    always @(posedge clk)cnt = cnt + 1;
    wire cnt_pedge;
    edge_detector_p echo_ed(
        .clk(clk), .reset_p(reset_p), .cp(cnt[22]),
        .p_edge(cnt_pedge));
    
    reg inc_flag;
    always @(posedge clk or posedge reset_p)begin
        if(reset_p)begin
            step = 8;
            inc_flag = 1;
        end
        else if(cnt_pedge)begin
            if(inc_flag)begin
                if(step >= 189)inc_flag = 0;
                else step = step + 1;
            end
            else begin
                if(step <= 18)inc_flag = 1;
                else step = step - 1;
            end
        end
    end
    pwm_Nfreq_Nstep #(.pwm_freq(50), .duty_step_N(1440)) 
        pwm_sg90(clk, reset_p, step, sg90);
    

endmodule

module adc_top_6(
    input clk, reset_p,
    input vauxp6, vauxn6,
    output [7:0] seg_7,
    output [3:0] com,
    output [15:0] led);
    
    wire [4:0] channel_out;
    wire eoc_out;
    wire [15:0] do_out;
    
    xadc_wiz_0 adc
          (
          .daddr_in({2'b00, channel_out}),            // Address bus for the dynamic reconfiguration port
          .dclk_in(clk),             // Clock input for the dynamic reconfiguration port
          .den_in(eoc_out),              // Enable Signal for the dynamic reconfiguration port
          .reset_in(reset_p),            // Reset signal for the System Monitor control logic
          .vauxp6(vauxp6),              // Auxiliary channel 6
          .vauxn6(vauxn6),
          .channel_out(channel_out),         // Channel Selection Outputs
          .do_out(do_out),              // Output data bus for dynamic reconfiguration port
          .eoc_out(eoc_out)             // End of Conversion Signal
          );
    
    reg [11:0] adc_value;
    wire eoc_pedge;
    edge_detector_p eoc_ed(
        .clk(clk), .reset_p(reset_p), .cp(eoc_out),
        .p_edge(eoc_pedge));
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)adc_value = 0;
        else if(eoc_pedge)adc_value = do_out[15:8];
    end
    
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value(adc_value),
        .hex_bcd(0),
        .seg_7(seg_7), .com(com));
endmodule

module adc_sequence2_top(
    input clk, reset_p,
    input vauxp6, vauxn6, vauxp14, vauxn14,
    output [7:0] seg_7,
    output [3:0] com,
    output led_g, led_r,
    output [15:0] led);
    
    wire [4:0] channel_out;
    wire [15:0] do_out;
    wire eoc_out;
    xadc_joystic joystick
          (
          .daddr_in({2'b00, channel_out}),            // Address bus for the dynamic reconfiguration port
          .dclk_in(clk),             // Clock input for the dynamic reconfiguration port
          .den_in(eoc_out),              // Enable Signal for the dynamic reconfiguration port
          .reset_in(reset_p),            // Reset signal for the System Monitor control logic
          .vauxp6(vauxp6),              // Auxiliary channel 6
          .vauxn6(vauxn6),
          .vauxp14(vauxp14),             // Auxiliary channel 14
          .vauxn14(vauxn14),
          .channel_out(channel_out),         // Channel Selection Outputs
          .do_out(do_out),              // Output data bus for dynamic reconfiguration port
          .eoc_out(eoc_out)             // End of Conversion Signal
          );
    
    reg [11:0] adc_value_x, adc_value_y;
    wire eoc_pedge;
    edge_detector_p eoc_ed(
        .clk(clk), .reset_p(reset_p), .cp(eoc_out),
        .p_edge(eoc_pedge));
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            adc_value_x = 0;
            adc_value_y = 0;
        end
        else if(eoc_pedge)begin
            case(channel_out[3:0])
                6 :adc_value_x = do_out[15:4];
                14:adc_value_y = do_out[15:4];
            endcase
        end
    end
    wire [7:0] x_bcd, y_bcd;
    bin_to_dec bcd_x(.bin(adc_value_x[11:6]), .bcd(x_bcd));
    bin_to_dec bcd_y(.bin(adc_value_y[11:6]), .bcd(y_bcd));
    fnd_cntr fnd(.clk(clk), .reset_p(reset_p),
        .fnd_value({x_bcd, y_bcd}),
        .hex_bcd(1),
        .seg_7(seg_7), .com(com));
        
    pwm_Nfreq_Nstep #(.duty_step_N(128)) pwm_led_g(clk, reset_p, adc_value_x[11:4], led_g);
    pwm_Nfreq_Nstep #(.duty_step_N(128)) pwm_led_b(clk, reset_p, adc_value_y[11:4], led_r);
          

endmodule










