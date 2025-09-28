`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2025 10:27:47 AM
// Design Name: 
// Module Name: exam02_sequential_logic
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

module D_flip_flop_n(
    input d,
    input clk,
    input enable,
    input reset_p,
    output reg q);

    always @(negedge clk or posedge reset_p)begin
        if(reset_p)begin
            q = 1'b0;
        end
        else if(enable)begin
            q = d;
        end
    end
endmodule

module D_flip_flop_p(
    input d,
    input clk,
    input enable,
    input reset_p,
    output reg q);

    always @(posedge clk or posedge reset_p)begin
        if(!reset_p)begin
            q = 1'b0;
        end
        else if(enable)begin
            q = d;
        end
    end
endmodule

module T_flip_flop_n(
    input clk, reset_p,
    input enable,
    input t,
    output reg q);

    always @(negedge clk, posedge reset_p)begin
        if(reset_p)begin
            q = 0;
        end
        else begin
            if(enable)begin
                if(t) q = ~q;
                else q = q;
            end
        end
    end

endmodule

module T_flip_flop_p(
    input clk, reset_p,
    input enable,
    input t,
    output reg q);

    always @(posedge clk, posedge reset_p)begin
        if(reset_p)begin
            q = 0;
        end
        else begin
            if(enable)begin
                if(t) q = ~q;
                else q = q;
            end
        end
    end

endmodule

module up_counter_asyc(
    input clk, reset_p,
    output [3:0] count);
    
    T_flip_flop_n cnt0(.clk(clk), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[0]));
    T_flip_flop_n cnt1(.clk(count[0]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[1]));
    T_flip_flop_n cnt2(.clk(count[1]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[2]));
    T_flip_flop_n cnt3(.clk(count[2]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[3]));

endmodule

module down_counter_asyc(
    input clk, reset_p,
    output [3:0] count);
    
    T_flip_flop_p cnt0(.clk(clk), .reset_p(reset_p), 
        .enable(1), .t(1), .q(count[0]));
    T_flip_flop_p cnt1(.clk(count[0]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[1]));
    T_flip_flop_p cnt2(.clk(count[1]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[2]));
    T_flip_flop_p cnt3(.clk(count[2]), .reset_p(reset_p), 
        .enable(1'b1), .t(1'b1), .q(count[3]));

endmodule

module up_counter_p(
    input clk, reset_p,
    output reg [3:0] count);

    always @(posedge clk, posedge reset_p)begin
        if(reset_p)count = 0;
        else count = count + 1;
    end

endmodule

module up_counter_n(
    input clk, reset_p,
    output reg [3:0] count);

    always @(negedge clk, posedge reset_p)begin
        if(reset_p)count = 0;
        else count = count + 1;
    end

endmodule

module down_counter_p(
    input clk, reset_p,
    output reg [3:0] count);

    always @(posedge clk, posedge reset_p)begin
        if(reset_p)count = 0;
        else count = count - 1;
    end

endmodule

module ring_counter (
    input clk,
    input reset_p,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset_p) begin
        if(reset_p) begin
            q <= 4'b0001;                   // 초기값 0001 설정
        end

        else begin
            case (q)
                4'b0001 : q <= 4'b0010;
                4'b0010 : q <= 4'b0100;
                4'b0100 : q <= 4'b1000;
                4'b1000 : q <= 4'b0001;
                default : q <= 4'b0001;     // 문제 생기면 초기값으로
            endcase
        end
    end

endmodule

module ring_counter_shift (
    input clk,
    input reset_p,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset_p) begin
        if(reset_p) begin
            q <= 4'b0001;                   // 초기값 0001 설정
        end

        else begin
                if (q == 4'b1000)
                    q <= 4'b0001;
                else if (q == 4'b0000 || q > 4'b1000)
                    q <= 4'b0001;
                else
                    q <= {q[2:0], 1'b0};
        end
    end

endmodule

module ring_counter_p (
    input clk,
    input reset_p,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset_p) begin
        if(reset_p) q <= 4'b0001;                   // 초기값 0001 설정
        else   q = {q[2:0], q[3]};
    end
endmodule

module ring_counter_led (
    input clk,
    input reset_p,
    output reg [15:0] q
);
    always @(posedge clk or posedge reset_p) begin
        if(reset_p) q <= 4'b0000_0000_0000_0001;                   // 초기값 0001 설정
        else   q = {q[14:0], q[15]};
    end
endmodule

module edge_detector_n(
    input clk,
    input reset_p,
    input cp,

    output p_edge,
    output n_edge

    );

    reg ff_cur, ff_old;

    always @(negedge clk or posedge reset_p) begin
        if(reset_p) begin
            ff_cur <= 0;
            ff_old <= 0;
        end else begin
            ff_old <= ff_cur;
            ff_cur <= cp;
        end
    end

    assign p_edge = ({ff_cur, ff_old} == 2'b10) ? 1 : 0;
    assign n_edge = ({ff_cur, ff_old} == 2'b01) ? 1 : 0;
endmodule

module edge_detector_p(
    input clk,
    input reset_p,
    input cp,

    output p_edge,
    output n_edge

    );

    reg ff_cur, ff_old;

    always @(posedge clk or posedge reset_p) begin
        if(reset_p) begin
            ff_cur <= 0;
            ff_old <= 0;
        end else begin
            ff_old <= ff_cur;
            ff_cur <= cp;
        end
    end

    assign p_edge = ({ff_cur, ff_old} == 2'b10) ? 1'b1 : 1'b0;
    assign n_edge = ({ff_cur, ff_old} == 2'b01) ? 1'b1 : 1'b0;
endmodule

module memory(
    input clk, 
    input rd_en, wr_en,
    input [3:0] wr_addr,
    input [3:0] rd_addr,
    input [7:0] i_data,
    output reg [7:0] o_data);

    reg [7:0] ram [0:1023];
    always @(posedge clk)begin
        if(wr_en)ram[wr_addr] = i_data;
    end
    always @(posedge clk)begin
        if(rd_en)o_data = ram[rd_addr];
    end

endmodule















