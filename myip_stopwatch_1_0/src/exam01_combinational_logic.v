module and_gate(
    input A,
    input B,
    output F
    );
    
    assign F = A & B;
    
endmodule

module half_adder_structural(
    input A, B,
    output sum, carry
    );

    xor (sum, A, B);
    and (carry, A, B);
    
endmodule 

module half_adder_behavioral(
    input A, B,
    output reg sum, carry
    );

    always @(A, B)begin
        case({A, B})
            2'b00: begin sum = 0; carry = 0; end
            2'b01: begin sum = 1; carry = 0; end
            2'b10: begin sum = 1; carry = 0; end
            2'b11: begin sum = 0; carry = 1; end
        endcase
    end

endmodule

module half_adder_dataflow(
    input A, B,
    output sum, carry
    );

    wire [1:0] sum_value;
    
    assign sum_value = A + B;
    assign sum = sum_value[0];
    assign carry = sum_value[1];
    
endmodule

module full_adder_behavioral(
    input A, B, cin,
    output reg sum, carry
    );

    always @(A, B, cin)begin
        case({A, B, cin})
            3'b000: begin sum = 0; carry = 0; end
            3'b001: begin sum = 1; carry = 0; end
            3'b010: begin sum = 1; carry = 0; end
            3'b011: begin sum = 0; carry = 1; end
            3'b100: begin sum = 1; carry = 0; end
            3'b101: begin sum = 0; carry = 1; end
            3'b110: begin sum = 0; carry = 1; end
            3'b111: begin sum = 1; carry = 1; end
        endcase
    end

endmodule

module full_adder_structural(
    input A, B, cin,
    output sum, carry
    );
    
    wire sum_0, carry_0, carry_1;

    half_adder_structural ha0(.A(A), .B(B), .sum(sum_0), .carry(carry_0));
    half_adder_structural ha1(.A(sum_0), .B(cin), .sum(sum), .carry(carry_1));
    
    or (carry, carry_0, carry_1);

endmodule

module full_adder_dataflow(
    input A, B, cin,
    output sum, carry
    );

    wire [1:0] sum_value;
    
    assign sum_value = A + B + cin;
    assign sum = sum_value[0];
    assign carry = sum_value[1];

endmodule

module fadder_4bit_dataflow(
    input [3:0] A, B, 
    input cin,
    output [3:0] sum, 
    output carry
    );

    wire [4:0] sum_value;
    
    assign sum_value = A + B + cin;
    assign sum = sum_value[3:0];
    assign carry = sum_value[4];

endmodule

module fadder_4bit_structural(
    input [3:0] A, B,
    input cin,
    output [3:0] sum,
    output carry
    );
    
    wire [2:0] carry_w;

    full_adder_structural fa0 (.A(A[0]), .B(B[0]), .cin(cin), .sum(sum[0]), .carry(carry_w[0]));
    full_adder_structural fa1 (.A(A[1]), .B(B[1]), .cin(carry_w[0]), .sum(sum[1]), .carry(carry_w[1]));
    full_adder_structural fa2 (.A(A[2]), .B(B[2]), .cin(carry_w[1]), .sum(sum[2]), .carry(carry_w[2]));
    full_adder_structural fa3 (.A(A[3]), .B(B[3]), .cin(carry_w[2]), .sum(sum[3]), .carry(carry));
endmodule

module mux_2_1(
    input [1:0] d,
    input s,
    output f
    );
    
    assign f = s ? d[1] : d[0];
    
endmodule

module mux_4_1(
    input [3:0] d,
    input [1:0] s,
    output f
    );
    
    assign f = d[s];
    
endmodule

module mux_8_1(
    input [7:0] d,
    input [2:0] s,
    output f
    );
    
    assign f = d[s];
    
endmodule

module demux_1_4_d(
    input d,
    input [1:0] s,
    output [3:0] f
    );

    assign f = (s == 2'b00) ? {3'b000, d} : 
               (s == 2'b01) ? {2'b00, d, 1'b0} :
               (s == 2'b10) ? {1'b0, d, 2'b00} : {d, 3'b000};

endmodule

module mux_demux_test(
    input [3:0] d,
    input [1:0] mux_s,
    input [1:0] demux_s,
    output [3:0] f);

    wire mux_f;
    
    mux_4_1 mux_4(.d(d), .s(mux_s), .f(mux_f));
    demux_1_4_d demux4(.d(mux_f), .s(demux_s), .f(f));

endmodule

module encoder_4_2(
    input [3:0] signal,
    output reg [1:0] code);

//    assign code = (signal == 4'b1000) ? 2'b11 :
//                  (signal == 4'b0100) ? 2'b10 :
//                  (signal == 4'b0010) ? 2'b01 : 2'b00;

//    always @(signal)begin
//        if(signal == 4'b1000) code = 2'b11;
//        else if(signal == 4'b0100) code = 2'b10;
//        else if(signal == 4'b0010) code = 2'b01;
//        else code = 2'b00;
//    end

    always @(signal)begin
        case(signal)
            4'b0001: code = 2'b00;
            4'b0010: code = 2'b01;
            4'b0100: code = 2'b10;
            4'b1000: code = 2'b11;
            default: code = 2'b00;
        endcase
    end

endmodule

module decoder_2_4(
    input [1:0] code,
    output [3:0] signal);

    assign signal = (code == 2'b00) ? 4'b0001 :
                    (code == 2'b01) ? 4'b0010 :
                    (code == 2'b10) ? 4'b0100 : 4'b1000;

endmodule

module seg_decoder (
    input [3:0] digit_in,
    output reg [7:0] seg_out
);

    always @(*) begin
        case (digit_in)
                             //pgfe_dcba
            4'd0: seg_out = 8'b1100_0000;   // 0 (dp 꺼짐)
            4'd1: seg_out = 8'b1111_1001;   // 1
            4'd2: seg_out = 8'b1010_0100;   // 2
            4'd3: seg_out = 8'b1011_0000;   // 3
            4'd4: seg_out = 8'b1001_1001;   // 4
            4'd5: seg_out = 8'b1001_0010;   // 5
            4'd6: seg_out = 8'b1000_0010;   // 6
            4'd7: seg_out = 8'b1111_1000;   // 7
            4'd8: seg_out = 8'b1000_0000;   // 8
            4'd9: seg_out = 8'b1001_0000;   // 9
            4'hA: seg_out = 8'b1000_1000;   // A
            4'hb: seg_out = 8'b1000_0011;   // b
            4'hC: seg_out = 8'b1100_0110;   // C
            4'hd: seg_out = 8'b1010_0001;   // d
            4'hE: seg_out = 8'b1000_0110;   // E
            4'hF: seg_out = 8'b1000_1110;   // F
            default: seg_out = 8'b1111_1111;
        endcase
    end
endmodule

module anode_selector (
    input [1:0] scan_count,
    output reg [3:0] an_out
);
    always @(*) begin
        case (scan_count)
            2'd0: an_out = 4'b1110; // an[0]
            2'd1: an_out = 4'b1101; // an[1]
            2'd2: an_out = 4'b1011; // an[2]
            2'd3: an_out = 4'b0111; // an[3]
            default: an_out = 4'b1111;
        endcase
    end
    
endmodule

module bin_to_dec(
    input [11:0] bin,           // 12비트 이진 입력
    output reg [15:0] bcd       // 4자리의 BCD를 출력 (4비트 x 4자리)
    );

    integer i;      // 반복문

    always @(bin) begin

        bcd = 0;    // initial value

        for(i = 0; i < 12; i = i + 1) begin
            // 1) 알고리즘 각 단위비트 자리별로 5이상이면 +3 해줌
            if(bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;          // 1의 자리수
            if(bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;          // 10의 자리수
            if(bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;       // 100의 자리수
            if(bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] +3;     // 1000의 자리수

            // 2) 1비트 left shift + 새로운 비트 붙임
            bcd = {bcd[14:0], bin[11 - i]};
        end

    end
endmodule












