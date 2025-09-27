`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 09:26:45 AM
// Design Name: 
// Module Name: controllers
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







module button_cntr(
    input clk, reset_p,
    input [4:0] btn,
    input active_mode,          // 하드웨어 액티브 모드 수정해서 쓸 필요 없게 할거
    output reg [4:0] btn_out
    );
    

    wire [4:0] debounced_btn;
    debounce db_btn_0( clk, btn[0], debounced_btn[0] );
    debounce db_btn_1( clk, btn[1], debounced_btn[1] );
    debounce db_btn_2( clk, btn[2], debounced_btn[2] );
    debounce db_btn_3( clk, btn[3], debounced_btn[3] );
    debounce db_btn_4( clk, btn[4], debounced_btn[4] );
    
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            btn_out <= 0;
        end else begin
            if(active_mode) begin                   // 액티브 하이로 설정해 두면
                if(debounced_btn[0]) begin          // 하드웨어에서 high 신호 들어올 때 레지스터에 1 저장할거
                    btn_out[0] <= 1;
                end else begin
                    btn_out[0] <= 0;
                end
                
                if(debounced_btn[1]) begin
                    btn_out[1] <= 1;
                end else begin
                    btn_out[1] <= 0;
                end
                
                if(debounced_btn[2]) begin
                    btn_out[2] <= 1;
                end else begin
                    btn_out[2] <= 0;
                end
                
                if(debounced_btn[3]) begin
                    btn_out[3] <= 1;
                end else begin
                    btn_out[3] <= 0;
                end
                
                if(debounced_btn[4]) begin
                    btn_out[4] <= 1;
                end else begin
                    btn_out[4] <= 0;
                end
                
            end else begin
            
                if(~debounced_btn[0]) begin         // 액티브 로우로 설정해 두면                
                    btn_out[0] <= 1;                // 반대로 하드웨어에서 low 신호 들어올 때 1 저장할거
                end else begin
                    btn_out[0] <= 0;
                end
                
                if(~debounced_btn[1]) begin
                    btn_out[1] <= 1;
                end else begin
                    btn_out[1] <= 0;
                end
                
                if(~debounced_btn[2]) begin
                    btn_out[2] <= 1;
                end else begin
                    btn_out[2] <= 0;
                end
                
                if(~debounced_btn[3]) begin
                    btn_out[3] <= 1;
                end else begin
                    btn_out[3] <= 0;
                end
                
                if(~debounced_btn[4]) begin
                    btn_out[4] <= 1;
                end else begin
                    btn_out[4] <= 0;
                end
            end        
        end

    end
    
endmodule


module photo_INT_cntr(
    input clk, reset_p,
    input [2:0] photo_INT,
    input active_mode,              // 하드웨어 액티브 모드 수정해서 쓸 필요 없게 할거
    output reg [2:0] signal_out
    );
    
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            signal_out <= 0;
        end else begin
            if(active_mode) begin           // 액티브 하이로 설정해 두면
                if(photo_INT[0]) begin      // 하드웨어에서 high 신호 들어올 때 레지스터에 1 저장할거
                    signal_out[0] <= 1;
                end else begin
                    signal_out[0] <= 0;
                end
                
                if(photo_INT[1]) begin
                    signal_out[1] <= 1;
                end else begin
                    signal_out[1] <= 0;
                end
                if(photo_INT[2]) begin
                    signal_out[2] <= 1;
                end else begin
                    signal_out[2] <= 0;
                end
            end else begin                 // 액티브 로우로 설정해 두면
                if(~photo_INT[0]) begin    // 반대로 하드웨어에서 low 신호 들어올 때 1 저장할거
                    signal_out[0] <= 1;
                end else begin
                    signal_out[0] <= 0;
                end
                
                if(~photo_INT[1]) begin
                    signal_out[1] <= 1;
                end else begin
                    signal_out[1] <= 0;
                end
                
                if(~photo_INT[2]) begin
                    signal_out[2] <= 1;
                end else begin
                    signal_out[2] <= 0;
                end
            end
        end
    end
    
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


module timer_sec(
    input clk, reset_p,
    input enable,
    input [6:0] target_sec,
    output reg timer_done
    );
    
    reg [26:0] i;
    reg [6:0] cnt_sec;
    always @(posedge clk, posedge reset_p) begin
        if(reset_p) begin
            i <= 0;
            cnt_sec <= 0;
            timer_done <= 0;
        end else begin
            if(enable) begin
                if(i >= 99_999_999) begin
                    i <= 0;
                    cnt_sec <= cnt_sec + 1;
                end else begin
                    i <= i + 1;
                    cnt_sec <= cnt_sec;
                end
                
                if(cnt_sec >= target_sec) begin
                    timer_done <= 1;
                end
            end else begin
                i <= 0;
                cnt_sec <= 0;
                timer_done <= 0;
            end
        end
    end   
    
endmodule