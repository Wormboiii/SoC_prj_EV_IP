`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2025 02:29:27 PM
// Design Name: 
// Module Name: controller
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


module fnd_cntr(
    input clk, reset_p,
    input [15:0] fnd_value,
    input hex_bcd,
    output [7:0] seg_7,
    output [3:0] com);
    
    wire [15:0] bcd_value;
    bin_to_dec bcd(.bin(fnd_value[11:0]), .bcd(bcd_value));
    
    reg [16:0] clk_div;
    always @(posedge clk)clk_div = clk_div + 1;
    
    anode_selector ring_com(
        .scan_count(clk_div[16:15]), .an_out(com));
    reg [3:0] digit_value; 
    wire [15:0] out_value;
    assign out_value = hex_bcd ? fnd_value : bcd_value;   
    always @(posedge clk or posedge reset_p)begin
        if(reset_p)begin
            digit_value = 0;
        end
        else begin
            case(com)
                4'b1110 : digit_value = out_value[3:0];
                4'b1101 : digit_value = out_value[7:4];
                4'b1011 : digit_value = out_value[11:8];
                4'b0111 : digit_value = out_value[15:12];
            endcase
        end
    end
    seg_decoder dec(.digit_in(digit_value), .seg_out(seg_7));
endmodule

module debounce (
    input clk,
    input btn_in,
    output reg btn_out
);

    reg [15:0] count;
    reg btn_sync_0, btn_sync_1;
    wire stable = (count == 16'hFFFF);

    always @(posedge clk) begin
        btn_sync_0 <= btn_in;
        btn_sync_1 <= btn_sync_0;
    end

    always @(posedge clk) begin
        if(btn_sync_1 == btn_out) begin
            count <= 0;
        end else begin
            count <= count + 1;
            if(stable)
                btn_out <= btn_sync_1;
        end
    end

endmodule

module btn_cntr(
    input clk, reset_p,
    input btn,
    output btn_pedge, btn_nedge);
    wire debounced_btn;
    debounce btn_0(.clk(clk), .btn_in(btn), .btn_out(debounced_btn));
    
    edge_detector_p btn_ed(
        .clk(clk), .reset_p(reset_p), .cp(debounced_btn),
        .p_edge(btn_pedge), .n_edge(btn_nedge));

endmodule

module dht11_cntr(
    input clk, reset_p,
    inout dht11_data,
    output reg [7:0] humidity, temperature,
    output [15:0] led);

    localparam S_IDLE       = 6'b00_0001;
    localparam S_LOW_18MS   = 6'b00_0010;
    localparam S_HIGH_20US  = 6'b00_0100;
    localparam S_LOW_80US   = 6'b00_1000;
    localparam S_HIGH_80US  = 6'b01_0000;
    localparam S_READ_DATA  = 6'b10_0000;
    
    localparam S_WAIT_PEDGE = 2'b01;
    localparam S_WAIT_NEDGE = 2'b10;
    
    wire clk_usec_nedge;
    clock_div_100 us_clk(.clk(clk), .reset_p(reset_p),
        .nedge_div_100(clk_usec_nedge));
    
    reg [21:0] count_usec;
    reg count_usec_e;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)count_usec = 0;
        else if(clk_usec_nedge && count_usec_e)count_usec = count_usec + 1;
        else if(!count_usec_e)count_usec = 0;
    end
    
    wire dht_nedge, dht_pedge;
    edge_detector_p dht_ed(
        .clk(clk), .reset_p(reset_p), .cp(dht11_data),
        .p_edge(dht_pedge), .n_edge(dht_nedge));
        
    reg dht11_buffer;
    reg dht11_data_out_e;
    assign dht11_data = dht11_data_out_e ? dht11_buffer : 'bz;
    
    reg [5:0] state, next_state;
    assign led[5:0] = state;
    reg [1:0] read_state;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)state = S_IDLE;
        else state = next_state;
    end
    
    reg [39:0] temp_data;
    reg [5:0] data_count;
    assign led[11:6] = data_count;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            next_state = S_IDLE;
            temp_data = 0;
            data_count = 0;
            dht11_data_out_e = 0;
            read_state = S_WAIT_PEDGE;
        end
        else begin
            case(state)
                S_IDLE:begin
                    if(count_usec < 22'd3_000_000)begin //3_000_000
                        count_usec_e = 1;
                        dht11_data_out_e = 0;
                    end
                    else begin
                        count_usec_e = 0;
                        next_state = S_LOW_18MS;
                    end
                end
                S_LOW_18MS   :begin
                    if(count_usec < 22'd18_000)begin //18_000
                        count_usec_e = 1;
                        dht11_data_out_e = 1;
                        dht11_buffer = 0;
                    end
                    else begin
                        count_usec_e = 0;
                        next_state = S_HIGH_20US;
                        dht11_data_out_e = 0;
                    end
                end
                S_HIGH_20US  :begin
                    count_usec_e = 1;
                    if(count_usec > 22'd100_000)begin
                        count_usec_e = 0;
                        next_state = S_IDLE;
                    end
                    if(dht_nedge)begin
                        next_state = S_LOW_80US;
                        count_usec_e = 0;
                    end
                end
                S_LOW_80US   :begin
                    count_usec_e = 1;
                    if(count_usec > 22'd100_000)begin
                        count_usec_e = 0;
                        next_state = S_IDLE;
                    end
                    if(dht_pedge)begin
                        next_state = S_HIGH_80US;
                        count_usec_e = 0;
                    end
                end
                S_HIGH_80US  :begin
                    count_usec_e = 1;
                    if(count_usec > 22'd100_000)begin
                        count_usec_e = 0;
                        next_state = S_IDLE;
                    end
                    if(dht_nedge)begin
                        next_state = S_READ_DATA;
                        count_usec_e = 0;
                    end
                end
                S_READ_DATA  :begin
                    case(read_state)
                        S_WAIT_PEDGE:begin
                            if(dht_pedge)read_state = S_WAIT_NEDGE;
                            count_usec_e = 0;
                        end
                        S_WAIT_NEDGE:begin
                            if(dht_nedge)begin
                                read_state = S_WAIT_PEDGE;
                                data_count = data_count + 1;
                                if(count_usec < 50)temp_data = {temp_data[38:0], 1'b0};
                                else temp_data = {temp_data[38:0], 1'b1};
                            end
                            else begin
                                count_usec_e = 1;
                                if(count_usec > 22'd100_000)begin
                                    count_usec_e = 0;
                                    next_state = S_IDLE;
                                    data_count = 0;
                                    read_state = S_WAIT_PEDGE;
                                end
                            end
                        end
                    endcase
                    if(data_count >= 40)begin
                        next_state = S_IDLE;
                        data_count = 0;
                        if(temp_data[39:32] + temp_data[31:24] + temp_data[23:16] + temp_data[15:8] == temp_data[7:0])begin
                            humidity = temp_data[39:32];
                            temperature = temp_data[23:16];
                        end
                    end
                end
                default: next_state = S_IDLE;
            endcase
        end
    end
endmodule

module hc_sr04_cntr_MHG(
    input clk,
    input reset_p,
    input echo, // HC-SR04 Echo 입력
    output reg trig, // HC-SR04 Trig 출력
    output reg [8:0] distance_cm, // 측정된 거리 (cm)
    output [15:0] led // 디버깅용 LED 출력
    );
    // FSM 상태 정의
    localparam S_IDLE   = 4'b0001; // 대기 상태
    localparam S_SEND   = 4'b0010; // Trig 신호 송신
    localparam S_RECIVE = 4'b0100; // Echo 신호 수신
    localparam S_END    = 4'b1000; // 거리 계산
    // 1us 단위 클럭 생성
    wire clk_usec_pedge;
    clock_div_100 us_clk(
        .clk(clk),
        .reset_p(reset_p),
        .nedge_div_100(clk_usec_pedge)
    );
    reg [21:0] count_usec, start_usec, div_usec_58; // 마이크로초 카운터
    reg count_usec_e, div_usec_e; // 카운터 enable
    // 마이크로초 카운터
    always @(negedge clk or posedge reset_p) begin
        if(reset_p) count_usec <= 0;
        else if(clk_usec_pedge && count_usec_e) count_usec <= count_usec + 1;
        else if(!count_usec_e) count_usec <= 0;
    end
    
    reg [8:0]  distance_cnt;
    always @(negedge clk or posedge reset_p) begin
        if(reset_p)begin
            div_usec_58 = 0;
            distance_cnt = 0;
        end
        else if(clk_usec_pedge && div_usec_e)begin
            if(div_usec_58 >= 57)begin
                div_usec_58 = 0;
                distance_cnt = distance_cnt + 1;
            end
            else div_usec_58 = div_usec_58 + 1;
        end
        else if(!div_usec_e)begin
            div_usec_58 <= 0;
            distance_cnt = 0;
        end
    end
    
    wire echo_nedge, echo_pedge;
    edge_detector_p echo_ed(
        .clk(clk), .reset_p(reset_p), .cp(echo),
        .p_edge(echo_pedge), .n_edge(echo_nedge));
    
    // FSM 상태 레지스터
    reg [3:0] state, next_state;
    reg [21:0] echo_width; // Echo 신호 폭 저장
    assign led[3:0] = state; // 하위 4비트: 상태 표시
    assign led[15] = echo; // Echo 입력 상태 표시
    assign led[14] = trig; // Trig 출력 상태 표시
    // 상태 전이
    always @(negedge clk or posedge reset_p) begin
        if(reset_p) state <= S_IDLE;
        else state <= next_state;
    end
    // FSM 동작
    always @(posedge clk or posedge reset_p) begin
        if(reset_p) begin
            next_state <= S_IDLE;
            trig <= 0;
            count_usec_e <= 0;
            distance_cm <= 0;
        end
        else begin
            case(state)
                S_IDLE: begin
                    trig <= 0;
                    count_usec_e <= 1;
                    if(count_usec > 22'd60_000) begin // 60ms 대기
                        count_usec_e <= 0;
                        next_state <= S_SEND;
                    end
                end
                S_SEND: begin
                    trig <= 1;
                    count_usec_e <= 1;
                    if(count_usec > 22'd12) begin // 12us Trig 신호
                        trig <= 0;
                        count_usec_e <= 0;
                        next_state <= S_RECIVE;
                    end
                end
                S_RECIVE: begin
                    count_usec_e <= 1;
                    if(count_usec > 22'd100_000) begin // 100ms 타임아웃
                        next_state <= S_IDLE;
                    end
                    if(echo_pedge)begin
                        div_usec_e = 1;
                    end
                    else if(echo_nedge) begin// Echo 신호 Low
                        distance_cm = distance_cnt;
                        div_usec_e = 0;
                        next_state <= S_END;
                    end
                end
                S_END: begin
                    next_state <= S_IDLE;
                end
                default: next_state <= S_IDLE;
            endcase
        end
    end
endmodule

module keypad_cntr(
    input clk, reset_p,
    input [3:0] row,
    output reg [3:0] column,
    output reg [3:0] key_value,
    output reg key_valid,
    output reg [4:0] state);

    localparam [4:0] SCAN_0       = 5'b00001;
    localparam [4:0] SCAN_1       = 5'b00010;
    localparam [4:0] SCAN_2       = 5'b00100;
    localparam [4:0] SCAN_3       = 5'b01000;
    localparam [4:0] KEY_PROCESS  = 5'b10000;
    
    reg [19:0] clk_10ms;
    always @(posedge clk)clk_10ms = clk_10ms + 1;
    
    wire clk_10ms_nedge, clk_10ms_pedge;
    edge_detector_p ms_10_ed(
        .clk(clk), .reset_p(reset_p), .cp(clk_10ms[19]),
        .p_edge(clk_10ms_pedge), .n_edge(clk_10ms_nedge));
    
    reg [4:0] next_state;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)state = SCAN_0;
        else if(clk_10ms_pedge) state = next_state;
    end
    always @* begin
        case(state)
            SCAN_0     : begin
                if(row == 0)next_state = SCAN_1;
                else next_state = KEY_PROCESS;
            end
            SCAN_1     : begin
                if(row == 0)next_state = SCAN_2;
                else next_state = KEY_PROCESS;
            end
            SCAN_2     : begin
                if(row == 0)next_state = SCAN_3;
                else next_state = KEY_PROCESS;
            end
            SCAN_3     : begin
                if(row == 0)next_state = SCAN_0;
                else next_state = KEY_PROCESS;
            end
            KEY_PROCESS: begin
                if(row == 0)next_state = SCAN_0;
                else next_state = KEY_PROCESS;
            end
            default: next_state = SCAN_1;
        endcase
    end
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            column = 4'b0001;
            key_value = 0;
            key_valid = 0;
        end
        else if(clk_10ms_nedge)begin
            case(state)
                SCAN_0     :begin
                    column = 4'b0001;
                    key_valid = 0;
                end
                SCAN_1     :begin
                    column = 4'b0010;
                    key_valid = 0;
                end
                SCAN_2     :begin
                    column = 4'b0100;
                    key_valid = 0;
                end
                SCAN_3     :begin
                    column = 4'b1000;
                    key_valid = 0;
                end
                KEY_PROCESS:begin
                    key_valid = 1;
                    case({column, row})
                        8'b0001_0001: key_value = 4'hC; //C  clear
                        8'b0001_0010: key_value = 4'h0; //0
                        8'b0001_0100: key_value = 4'hF; //F  =
                        8'b0001_1000: key_value = 4'hd; //d  /
                        8'b0010_0001: key_value = 4'h1; //1
                        8'b0010_0010: key_value = 4'h2; //2
                        8'b0010_0100: key_value = 4'h3; //3
                        8'b0010_1000: key_value = 4'hE; //E  *
                        8'b0100_0001: key_value = 4'h4; //4
                        8'b0100_0010: key_value = 4'h5; //5
                        8'b0100_0100: key_value = 4'h6; //6
                        8'b0100_1000: key_value = 4'hb; //b  -
                        8'b1000_0001: key_value = 4'h7; //7
                        8'b1000_0010: key_value = 4'h8; //8
                        8'b1000_0100: key_value = 4'h9; //9
                        8'b1000_1000: key_value = 4'hA; //A  +
                    endcase
                end
            endcase
        end
    end
    
endmodule

module I2C_master(
    input clk, reset_p,
    input [6:0] addr,
    input [7:0] data,
    input rd_wr, comm_start,
    output reg scl, sda,
    output [15:0] led);

    localparam IDLE         = 7'b000_0001;
    localparam COMM_START   = 7'b000_0010;
    localparam SEND_ADDR    = 7'b000_0100;
    localparam RD_ACK       = 7'b000_1000;
    localparam SEND_DATA    = 7'b001_0000;
    localparam SCL_STOP     = 7'b010_0000;
    localparam COMM_STOP    = 7'b100_0000;
    
    wire clk_usec_nedge;
    clock_div_100 us_clk(.clk(clk), .reset_p(reset_p),
        .nedge_div_100(clk_usec_nedge));
    
    wire comm_start_pedge;
    edge_detector_p comm_start_ed(
        .clk(clk), .reset_p(reset_p), .cp(comm_start),
        .p_edge(comm_start_pedge));
        
    wire scl_nedge, scl_pedge;
    edge_detector_p scl_ed(
        .clk(clk), .reset_p(reset_p), .cp(scl),
        .p_edge(scl_pedge), .n_edge(scl_nedge));
        
    reg [2:0] count_usec5;
    reg scl_e;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            count_usec5 = 0;
            scl = 0;
        end
        else if(scl_e)begin
            if(clk_usec_nedge)begin
                if(count_usec5 >= 4)begin
                    count_usec5 = 0;
                    scl = ~scl;
                end
                else count_usec5 = count_usec5 + 1;
            end
        end
        else if(!scl_e)begin
            count_usec5 = 0;
            scl = 1;
        end
    end
    
    reg [6:0] state, next_state;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)state = IDLE;
        else state = next_state;
    end
    
    wire [7:0] addr_rd_wr;
    assign addr_rd_wr = {addr, rd_wr};
    reg [2:0] cnt_bit;
    reg stop_flag;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            next_state = IDLE;
            scl_e = 0;
            sda = 1;
            cnt_bit = 7;
            stop_flag = 0;
        end
        else begin
            case(state)
                IDLE        : begin
                    scl_e = 0;
                    sda = 1;
                    if(comm_start_pedge)next_state = COMM_START;
                end
                COMM_START  : begin
                    sda = 0;
                    scl_e = 1;
                    next_state = SEND_ADDR;
                end
                SEND_ADDR   : begin
                    if(scl_nedge)sda = addr_rd_wr[cnt_bit];
                    if(scl_pedge)begin
                        if(cnt_bit == 0)begin
                            cnt_bit = 7;
                            next_state = RD_ACK;
                        end
                        else cnt_bit = cnt_bit - 1;
                    end
                end
                RD_ACK      : begin
                    if(scl_nedge)sda = 'bz;
                    else if(scl_pedge)begin
                        if(stop_flag)begin
                            stop_flag = 0;
                            next_state = SCL_STOP;
                        end
                        else begin
                            stop_flag = 1;
                            next_state = SEND_DATA;
                        end
                    end
                end 
                SEND_DATA   : begin
                    if(scl_nedge)sda = data[cnt_bit];
                    if(scl_pedge)begin
                        if(cnt_bit == 0)begin
                            cnt_bit = 7;
                            next_state = RD_ACK;
                        end
                        else cnt_bit = cnt_bit - 1;
                    end
                end
                SCL_STOP    : begin
                    if(scl_nedge)sda = 0;
                    if(scl_pedge)next_state = COMM_STOP;
                end
                COMM_STOP   : begin
                    if(count_usec5 >= 3)begin
                        scl_e = 0;
                        sda = 1;
                        next_state = IDLE;
                    end
                end
            endcase
        end
    end
endmodule

module i2c_lcd_send_byte(
    input clk, reset_p,
    input [6:0] addr, 
    input [7:0] send_buffer,
    input send, rs,
    output scl, sda,
    output reg busy,
    output [15:0] led);

    localparam IDLE                     = 6'b00_0001;
    localparam SEND_HIGH_NIBBLE_DISABLE = 6'b00_0010;
    localparam SEND_HIGH_NIBBLE_ENABLE  = 6'b00_0100;
    localparam SEND_LOW_NIBBLE_DISABLE  = 6'b00_1000;
    localparam SEND_LOW_NIBBLE_ENABLE   = 6'b01_0000;
    localparam SEND_DISABLE             = 6'b10_0000;
    
    wire clk_usec_nedge;
    clock_div_100 us_clk(.clk(clk), .reset_p(reset_p),
        .nedge_div_100(clk_usec_nedge));
    
    reg [7:0] data;
    reg comm_start;
    
    wire send_pedge;
    edge_detector_p send_ed(
        .clk(clk), .reset_p(reset_p), .cp(send),
        .p_edge(send_pedge));
        
    reg [21:0] count_usec;
    reg count_usec_e;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)count_usec = 0;
        else if(clk_usec_nedge && count_usec_e)count_usec = count_usec + 1;
        else if(!count_usec_e)count_usec = 0;
    end    
    
    I2C_master master(clk, reset_p, addr, data, 1'b0, comm_start, scl, sda);
    
    reg [5:0] state, next_state;
    always @(negedge clk, posedge reset_p)begin
        if(reset_p)begin
            state = IDLE;
        end
        else begin
            state = next_state;
        end
    end
    
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            next_state = IDLE;
            comm_start = 0;
            count_usec_e = 0;
            data = 0;
            busy = 0;
        end
        else begin
            case(state)
                IDLE                    :begin
                    if(send_pedge)begin
                        next_state = SEND_HIGH_NIBBLE_DISABLE;
                        busy = 1;
                    end
                end
                SEND_HIGH_NIBBLE_DISABLE:begin
                    if(count_usec <= 22'd200)begin
                                //d7 d6 d5 d4       BL en rw rs    
                        data = {send_buffer[7:4], 3'b100, rs};
                        comm_start = 1;
                        count_usec_e = 1; 
                    end
                    else begin
                        next_state = SEND_HIGH_NIBBLE_ENABLE;
                        count_usec_e = 0;
                        comm_start = 0;
                    end
                end
                SEND_HIGH_NIBBLE_ENABLE :begin
                    if(count_usec <= 22'd200)begin
                                //d7 d6 d5 d4       BL en rw rs    
                        data = {send_buffer[7:4], 3'b110, rs};
                        comm_start = 1;
                        count_usec_e = 1; 
                    end
                    else begin
                        next_state = SEND_LOW_NIBBLE_DISABLE;
                        count_usec_e = 0;
                        comm_start = 0;
                    end
                end
                SEND_LOW_NIBBLE_DISABLE :begin
                    if(count_usec <= 22'd200)begin
                                //d7 d6 d5 d4       BL en rw rs    
                        data = {send_buffer[3:0], 3'b100, rs};
                        comm_start = 1;
                        count_usec_e = 1; 
                    end
                    else begin
                        next_state = SEND_LOW_NIBBLE_ENABLE;
                        count_usec_e = 0;
                        comm_start = 0;
                    end
                end
                SEND_LOW_NIBBLE_ENABLE  :begin
                    if(count_usec <= 22'd200)begin
                                //d7 d6 d5 d4       BL en rw rs    
                        data = {send_buffer[3:0], 3'b110, rs};
                        comm_start = 1;
                        count_usec_e = 1; 
                    end
                    else begin
                        next_state = SEND_DISABLE;
                        count_usec_e = 0;
                        comm_start = 0;
                    end
                end
                SEND_DISABLE            :begin 
                    if(count_usec <= 22'd200)begin
                                //d7 d6 d5 d4       BL en rw rs    
                        data = {send_buffer[7:4], 3'b100, rs};
                        comm_start = 1;
                        count_usec_e = 1; 
                    end
                    else begin
                        next_state = IDLE;
                        count_usec_e = 0;
                        comm_start = 0;
                        busy = 0;
                    end
                end
            endcase
        end
    end
endmodule

module pwm_Nfreq_Nstep(
    input clk, reset_p,
    input [31:0] duty,
    output reg pwm);

    parameter sys_clk_freq = 100_000_000;
    parameter pwm_freq = 10_000;
    parameter duty_step_N = 200;
    parameter temp = sys_clk_freq / pwm_freq / duty_step_N / 2;
    
    integer cnt;
    reg pwm_freqXn;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            cnt  = 0;
            pwm_freqXn = 0;
        end
        else begin
            if(cnt >= temp-1)begin
                cnt = 0;
                pwm_freqXn = ~pwm_freqXn;
            end
            else cnt = cnt + 1;
        end
    end
    
    wire pwm_freqXn_nedge;
    edge_detector_p pwm_freqX128_ed(
        .clk(clk), .reset_p(reset_p), .cp(pwm_freqXn),
        .n_edge(pwm_freqXn_nedge));
        
    integer cnt_duty;
    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            cnt_duty = 0;
            pwm = 0;
        end
        else if(pwm_freqXn_nedge)begin
            if(cnt_duty >= duty_step_N)cnt_duty = 0;
            else cnt_duty = cnt_duty + 1;
            if(cnt_duty < duty)pwm = 1;
            else pwm = 0;
        end
    end
    
endmodule













































