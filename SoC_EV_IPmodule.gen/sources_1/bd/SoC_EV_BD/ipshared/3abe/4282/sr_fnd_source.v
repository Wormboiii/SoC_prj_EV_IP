`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 10:27:18 AM
// Design Name: 
// Module Name: sr_fnd_source
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


module seg_cntr(
    input clk,
    input reset_p,
    input common_mode,       // 하드웨어 애노드 캐소드 공통 바꿀 필요 없이 다 쓸수있게 할거
    input [3:0] control,
    output srclk,
    output rclk,
    output ser
);

    reg [7:0] data_out;
    always @(posedge clk, posedge reset_p) begin
    
        if(reset_p) begin
            data_out <= 8'b0000_0000;
        end else begin
            if(common_mode) begin                     // 캐소드 공통일때(1줘야 켜지는 애들)
                case(control)
                    4'b0001: data_out = 8'b0000_0110; // '1' (dp, g, f, e, d, c, b, a)
                    4'b0010: data_out = 8'b0101_1011; // '2'
                    4'b0011: data_out = 8'b0100_1111; // '3'
                    4'b0100: data_out = 8'b0110_0110; // '4'
                    4'b0101: data_out = 8'b0110_1101; // '5'
                    4'b0110: data_out = 8'b0111_1101; // '6'
                    4'b0111: data_out = 8'b0000_0111; // '7'
                    4'b1000: data_out = 8'b0111_1111; // '8'
                    4'b1001: data_out = 8'b0110_0111; // '9'
                    4'b0000: data_out = 8'b0011_1111; // '0'
                    4'b1010: data_out = 8'b1000_0000; // 'dp'
                    default: data_out = 8'b0000_0000; // 모든 스위치 OFF일 때
                endcase
            end else begin                            // 애노드 공통일때(0줘야 켜지는 애들)
                case(control)
                    4'b0001: data_out = ~(8'b0000_0110); // '1' (dp, g, f, e, d, c, b, a)
                    4'b0010: data_out = ~(8'b0101_1011); // '2'
                    4'b0011: data_out = ~(8'b0100_1111); // '3'
                    4'b0100: data_out = ~(8'b0110_0110); // '4'
                    4'b0101: data_out = ~(8'b0110_1101); // '5'
                    4'b0110: data_out = ~(8'b0111_1101); // '6'
                    4'b0111: data_out = ~(8'b0000_0111); // '7'
                    4'b1000: data_out = ~(8'b0111_1111); // '8'
                    4'b1001: data_out = ~(8'b0110_0111); // '9'
                    4'b0000: data_out = ~(8'b0011_1111); // '0'
                    4'b1010: data_out = ~(8'b1000_0000); // 'dp'
                    default: data_out = ~(8'b0000_0000); // 모든 스위치 OFF일 때
                endcase            
            end   
        end
    end

    sn74hc595_cntr sr_seg (
        .clk(clk),
        .reset_p(reset_p),
        .data_in(data_out),
        .srclk(srclk),
        .rclk(rclk),
        .ser(ser)
    );

endmodule