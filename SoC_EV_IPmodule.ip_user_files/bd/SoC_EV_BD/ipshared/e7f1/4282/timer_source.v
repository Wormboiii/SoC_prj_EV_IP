`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 12:19:35 PM
// Design Name: 
// Module Name: timer_source
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