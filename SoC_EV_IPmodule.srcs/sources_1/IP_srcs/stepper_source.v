`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 09:52:15 AM
// Design Name: 
// Module Name: stepper_source
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



module stepper_cntr(
    input clk, reset_p,
    input [1:0] cntr_sig,             // 나중에 IP로 만들면 C 코딩할때 여기 레지스터로 값 받아서 제어  
    output reg IN1, IN2, IN3, IN4     // 이거 그대로 XDC에 뽑아서 스텝모터랑 연결
    );
    
    
    // FSM 사용할 상태 선언
    localparam IDLE     = 5'b00001;   
    localparam S_0001   = 5'b00010;
    localparam S_0010   = 5'b00100;
    localparam S_0100   = 5'b01000;
    localparam S_1000   = 5'b10000;
    
    
    
    // 시스템 클락 분주
    reg delay_clk;                                  // C 코딩할때 딜레이 안넣으려고 모듈에서 미리 분주해줌
    integer delay_time;                             // C 코딩할때 최대한 논블로킹 방식으로 하기 위함
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            delay_time <= 0;
            delay_clk <= 0;
        end else begin
            if(delay_time >= 149_999) begin         // 10ms로 분주
                delay_clk <= ~delay_clk;
                delay_time <= 0;
            end else begin
                delay_time <= delay_time + 1;
            end
        end
    end
    
    
    // 엣지디텍터로 10ms로 분주한 클락 폴링엣지 잡아줌 
    wire delay_clk_ne;     
    edge_detector_p divclk_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(delay_clk),
        .n_edge(delay_clk_ne)
    );
    
    
    // 분주된 클락 폴링엣지일때 상태 바꿔줄거임(분주한 주기만큼 딜레이 줄거임)
    reg [4:0] state, next_state;
    always @(negedge clk, posedge reset_p) begin
        if(reset_p) begin
            state <= IDLE;
        end else begin
            if(delay_clk_ne) begin
                state <= next_state;
            end
        end
    end
    
    
    // 상태천이 부분
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            IN1 <= 0;
            IN2 <= 0;
            IN3 <= 0;
            IN4 <= 1;
            next_state <= IDLE;
        end else begin
            case(state)
                IDLE : begin                        // 입력 안들어올 때
                    IN1 <= 0;
                    IN2 <= 0;
                    IN3 <= 0;
                    IN4 <= 1;                               // 멈춰있을 때 0000 아니고 아무데나 1 줘야 가만히 있을때도 토크가 유지됨
                    if(cntr_sig == 0) begin            // 정지 신호(001) 들어오면 계속 상태 IDLE 유지
                        next_state <= IDLE;
                    end else if(cntr_sig == 1) begin   // 시계방향 신호(010) 들어오면 다음 상태로 ㄱㄱ
                        next_state <= S_0001;
                    end else if(cntr_sig == 2) begin   // 반시계방향 신호(100) 들어오면 다음 상태로 ㄱㄱ
                        next_state <= S_0001;
                    end
                end
                
                S_0001 : begin
                    IN1 <= 0;       // 0001 상태에 맞게 출력 0001로 줌
                    IN2 <= 0;
                    IN3 <= 0;
                    IN4 <= 1;
                    if(cntr_sig == 0) begin
                        next_state <= IDLE;
                    end else if(cntr_sig == 1) begin   // 시계방향 신호면 출력 0001 상태에서 0010 상태로 ㄱㄱ
                        next_state <= S_0010;
                    end else if(cntr_sig == 2) begin   // 반시계방향 신호면 1000 상태로 ㄱㄱ
                        next_state <= S_1000;
                    end
                end
                
                S_0010 : begin
                    IN1 <= 0;   // 0010 상태에 맞게 출력 0010으로 줌
                    IN2 <= 0;
                    IN3 <= 1;
                    IN4 <= 0;
                    if(cntr_sig == 0) begin
                        next_state <= IDLE;
                    end else if(cntr_sig == 1) begin   // 시계방향 신호면 0100 상태로 ㄱㄱ
                        next_state <= S_0100;
                    end else if(cntr_sig == 2) begin   // 반시계방향 신호면 0001 상태로 ㄱㄱ
                        next_state <= S_0001;
                    end
                end
                
                S_0100 : begin
                    IN1 <= 0;   // 0100 상태에 맞게 출력 0100으로 줌
                    IN2 <= 1;
                    IN3 <= 0;
                    IN4 <= 0;
                    if(cntr_sig == 0) begin
                        next_state <= IDLE;
                    end else if(cntr_sig == 1) begin   // 시계방향 신호면 1000 상태로 ㄱㄱ 
                        next_state <= S_1000;
                    end else if(cntr_sig == 2) begin   // 반시계방향 신호면 0010 상태로 ㄱㄱ
                        next_state <= S_0010;
                    end
                end
                
                S_1000 : begin
                    IN1 <= 1;   // 1000 상태에 맞게 출력 1000으로 줌
                    IN2 <= 0;
                    IN3 <= 0;
                    IN4 <= 0;
                    if(cntr_sig == 0) begin
                        next_state <= IDLE;
                    end else if(cntr_sig == 1) begin   // 시계방향 신호면 0001 상태로 ㄱㄱ
                        next_state <= S_0001;
                    end else if(cntr_sig == 2) begin   // 반시계방향 신호면 0100 상태로 ㄱㄱ
                        next_state <= S_0100;
                    end
                end
            endcase
        end
    end
    
endmodule