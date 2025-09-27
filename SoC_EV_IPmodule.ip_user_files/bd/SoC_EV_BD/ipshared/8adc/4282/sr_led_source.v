`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 10:19:54 AM
// Design Name: 
// Module Name: sr_led_source
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



module edge_detector_p (
    input clk, reset_p,     // 클럭, 리셋 
    input cp,               // 입력신호 감지
    output p_edge, 
    output n_edge   
);
    reg ff_cur, ff_old;     // 현재 cp값과 이전 cp값을 저장할 플립플롭

    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin   //리셋시 플립플롭 초기화
            ff_cur <= 1'b0;
            ff_old <= 1'b0;
        end
        else begin          // 이전값 저장하고 현재값 갱신
            ff_old <= ff_cur;
            ff_cur <= cp;
        end
    end
    
    assign p_edge = ({ff_cur, ff_old} == 2'b10) ? 1'b1 : 1'b0;
    assign n_edge = ({ff_cur, ff_old} == 2'b01) ? 1'b1 : 1'b0;
    
endmodule




module sn74hc595_cntr(
    input clk, reset_p,
    input [7:0] data_in,    // 모듈에 직접 8비트 데이터 입력 받아서 그걸 595의 SER(시리얼 입력)핀에 보내줄거임
    output reg srclk,       // 데이터 송,수신 동기화를 위해 클럭 생성
    output reg rclk,        // 데이터 송신 끝을 알리는 래치 핀 
    output reg ser          // 이걸로 모듈에서 입력받은 데이터 보내줄거 
    );
    
    // 시스템 클락 분주                            
    integer delay_time;                            
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            delay_time <= 0;
            srclk <= 0;
        end else begin
            if(delay_time >= 9) begin         // 5Mhz로 분주, 595 데이터시트에 Vcc에 2V 들어오면 최대 5Mhz에서 작동한다고 써있음
                srclk <= ~srclk;
                delay_time <= 0;
            end else begin
                delay_time <= delay_time + 1;
            end
        end
    end
    
    // 엣지디텍터로 5Mhz까지 분주한 클락 엣지 잡음 
    wire clk_5Mhz_pe;
    wire clk_5Mhz_ne;     
    edge_detector_p divclk_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(srclk),
        .p_edge(clk_5Mhz_pe),
        .n_edge(clk_5Mhz_ne)
    );
    
    
    // 실제 데이터 보내는 구문
    integer cnt_data; 
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            rclk <= 0;
            ser <= 0; 
            cnt_data <= 0; 
        end else begin
            if(clk_5Mhz_pe) begin               // 위에서 분주한 5Mhz 클럭 라이징엣지 뜰 때 맞춰서 데이터 보낼거임
                if(cnt_data >= 8) begin         // 데이터 카운트 다 끝나면(8비트 다 보내면)
                    cnt_data <= 0;              // 카운트 0으로 초기화
                    rclk <= 1;                  // rclk(래치) high로 띄워서 레지스터에 넣은 값 출력
                end else begin
                    cnt_data <= cnt_data + 1;   // 8개 다 안보냈으면 보내면서 카운팅
                    rclk <= 0;                  // 아직 다 안보냈으니까 래치핀 low로 유지
                    
                    case(cnt_data)
                        0 : ser <= data_in[7];  // 카운트 0이면 모듈 입력 데이터의 7번 비트부터 595 시리얼 입력핀으로 보냄(MSB부터 보냄)
                        1 : ser <= data_in[6];  // 카운트 1이면 입력 데이터의 6번 비트 보냄
                        2 : ser <= data_in[5];
                        3 : ser <= data_in[4];
                        4 : ser <= data_in[3];  // ....
                        5 : ser <= data_in[2];
                        6 : ser <= data_in[1];
                        7 : ser <= data_in[0];  // 카운트 7이면 입력 데이터의 0번 비트(LSB) 시리얼 입력핀으로 보냄               
                    endcase
                end
            end
        end
    end
    
endmodule




module led_cntr(
    input clk, reset_p,
    input [1:0] control,
    output srclk, rclk, ser
    );
    
    
    // SFM 상태 선언부
    localparam OFF           = 10'b00000_00001;
    localparam S_0000_0001   = 10'b00000_00010;
    localparam S_0000_0010   = 10'b00000_00100;
    localparam S_0000_0100   = 10'b00000_01000;
    localparam S_0000_1000   = 10'b00000_10000;
    localparam S_0001_0000   = 10'b00001_00000;
    localparam S_0010_0000   = 10'b00010_00000;
    localparam S_0100_0000   = 10'b00100_00000;
    localparam S_1000_0000   = 10'b01000_00000;
    localparam ON            = 10'b10000_00000;
    
   
   
    reg [7:0] serial_data;  // 2비트짜리 control 레지스터 받아서 mux처럼 시리얼 출력으로 연결할거임
    sn74hc595_cntr sr_led(
        .clk(clk),
        .reset_p(reset_p),
        .data_in(serial_data),
        .srclk(srclk),
        .rclk(rclk),
        .ser(ser)
    );
    
    
    
    wire rclk_ne;     
    edge_detector_p divclk_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(rclk),              // 8비트 시리얼 입력으로 다 받으면 래치 올라가는데 그거 잡을거
        .n_edge(rclk_ne)        // 폴링엣지 잡아줌
    );
    
    
    // 상태 천이하는 부분
    reg [15:0] cnt_delay;       // LED 시프트 눈에 보이게 하려고 딜레이 줄거임
    reg [9:0] state, next_state;
    always @(negedge clk, posedge reset_p) begin
        if(reset_p) begin
            state <= OFF;
            cnt_delay <= 0;
        end else begin
            if(rclk_ne) begin
                if(cnt_delay > 49_999) begin    // 595 시프트레지스터가 입력 8비트 다 받으면 래치핀이 올라오는데 그게 1.8us 걸림
                    cnt_delay <= 0;             // 1.8us씩 50,000번 분주하면 대략 90ms정도 됨
                    state <= next_state;        // 90ms만큼 딜레이 주면서 LED 시프트 되도록(상태가 바뀌도록) 설계
                end else begin
                    cnt_delay <= cnt_delay + 1;
                end            
            end
        end
    end
    
    
    // 상태 바뀌는 부분
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            next_state <= OFF;                      // 초기화시 LED 끔
            serial_data <= 8'b0000_0000;
        end else begin
            case(state)
                OFF : begin
                    serial_data <= 8'b0000_0000;        // OFF 상태로 들어오면  LED 다 끔

                    if(control == 0) begin              // control 레지스터에 0 입력받으면 LED 다 끄는거 유지할거임
                        next_state <= OFF;          
                    end else if(control == 1) begin     // 1 입력받으면 좌로 흐르게(좌시프트) 할거임
                        next_state <= S_0000_0001;
                    end else if (control == 2) begin    // 2 입력받으면 우로 흐르게(우시프트) 할거임
                        next_state <= S_1000_0000;
                    end else if (control == 3) begin    // 3 입력받으면 LED 다 킬거임
                        next_state <= ON;
                    end
                end
                
                S_0000_0001 : begin
                    serial_data <= 8'b0000_0001;        // 여기로 들어오면 LED 맨 우측만 켤거임
                                                        // 여기서부터는 순서대로 똑같음
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0000_0010;
                    end else if (control == 2) begin
                        next_state <= S_1000_0000;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0000_0010 : begin
                    serial_data <= 8'b0000_0010;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0000_0100;
                    end else if (control == 2) begin
                        next_state <= S_0000_0001;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0000_0100 : begin
                    serial_data <= 8'b0000_0100;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0000_1000;
                    end else if (control == 2) begin
                        next_state <= S_0000_0010;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0000_1000 : begin
                    serial_data <= 8'b0000_1000;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0001_0000;
                    end else if (control == 2) begin
                        next_state <= S_0000_0100;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0001_0000 : begin
                    serial_data <= 8'b0001_0000;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0010_0000;
                    end else if (control == 2) begin
                        next_state <= S_0000_1000;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0010_0000 : begin
                    serial_data <= 8'b0010_0000;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0100_0000;
                    end else if (control == 2) begin
                        next_state <= S_0001_0000;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_0100_0000 : begin
                    serial_data <= 8'b0100_0000;
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_1000_0000;
                    end else if (control == 2) begin
                        next_state <= S_0010_0000;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                S_1000_0000 : begin
                    serial_data <= 8'b1000_0000;            // 여기로 들어오면 맨 왼쪽만 켤거임
                    
                    if(control == 0) begin
                        next_state <= OFF;
                    end else if(control == 1) begin
                        next_state <= S_0000_0001;
                    end else if (control == 2) begin
                        next_state <= S_0100_0000;
                    end else if (control == 3) begin
                        next_state <= ON;
                    end
                end
                
                ON : begin
                    serial_data <= 8'b1111_1111;            // ON 상태로 들어오면 LED 다 켤거임
                    
                    if(control == 0) begin                  // control 레지스터에 0 입력받으면 LED 다 끌거임
                        next_state <= OFF;
                    end else if(control == 1) begin         // 1 입력받으면 좌시프트 할거임
                        next_state <= S_0000_0001;
                    end else if (control == 2) begin        // 2 입력받으면 우시프트 할거임
                        next_state <= S_1000_0000;
                    end else if (control == 3) begin        // 3 입력받으면 켜는거 유지할거임
                        next_state <= ON;
                    end
                end                
            endcase
        end
    end
    
endmodule
