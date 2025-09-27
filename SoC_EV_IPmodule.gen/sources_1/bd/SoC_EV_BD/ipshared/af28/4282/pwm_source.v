`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 10:14:00 AM
// Design Name: 
// Module Name: pwm_source
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




module pwm_custom(
    input clk, reset_p,
    input [27:0] duty,          // 1~100,000,000까지  듀티비 입력받을 레지스터
    input [26:0] freq_div,      // 1~100,000,000까지 분주비 입력받을 레지스터
    output reg pwm);
    
    integer divFreq_cnt;        // 타겟 주파수 세는 변수
    integer duty_cnt;           // 타겟 듀티비 세는 변수
    wire target_freq_pedge;     // 라이징엣지 받아올 변수
    reg target_freq;            // 타겟 주파수로 사용
    
    
    
    // 타겟 주파수 생성하는 부분
    always @(posedge clk, posedge reset_p) begin
      if(reset_p) begin
        target_freq <= 0;
        divFreq_cnt <= 0;
      end else begin
        if(divFreq_cnt >= freq_div-1) begin         // 입력받은 분주비까지 카운팅 되면
            divFreq_cnt <= 0;                       // 카운트 0으로 초기화
            target_freq <= ~target_freq;            // 타겟 주파수 토글하면서 사각파 생성
        end else begin
            divFreq_cnt <= divFreq_cnt + 2;         // 분주비까지 도달 못하면 계속 카운팅
        end                                         // 매 클럭마다 카운팅, 클럭이 반파이기 때문에 분주비 그대로 받아서 작동하려면 +2로 두배 빠르게 세야 함
      end  
    end
    
    // 타겟 주파수 라이징엣지만 뽑아올거
    edge_detector_p pwm_freqX128_ed(
        .clk(clk),
        .reset_p(reset_p),
        .cp(target_freq),
        .p_edge(target_freq_pedge)
    );
    
    
    // 타겟 주파수에 맞게 듀티비 맞춰서 실제로 PWM 출력 해주는 부분
    always @(posedge clk, posedge reset_p) begin
      if(reset_p) begin
          duty_cnt <= 0;
          pwm <= 0;
      end else begin
          if(target_freq_pedge) begin           // 타켓 주파수의 라이징엣지일 때 일단 출력 High로 올림
              pwm <= 1;                         // 이때부터 카운팅 시작해서 주파수는 타겟 주파수 그대로 유지하는데
              duty_cnt <= 0;                    // 듀티비를 어느정도 할지(high를 얼마나 길게 유지할지) 정함
          end else begin
              if(duty_cnt >= duty-1) begin      // 입력받은 듀티비 값까지 다 세면
                  pwm <= 0;                     // 출력을 LOW로 떨궈줌
                  duty_cnt <= 0;                // 카운트 0으로 초기화
              end else begin
                duty_cnt <= duty_cnt + 1;       // 입력 듀티비까지 도달 못하면 계속 카운팅
              end                               // 얘도 똑같이 반파임, 근데 분주비와 듀티비를 입력할 때 두 수가 같아야
          end                                   // 직관적으로 봤을때 100%의 듀티비가 되기 때문에 얘는 +1씩 카운팅
      end
    end
    
endmodule