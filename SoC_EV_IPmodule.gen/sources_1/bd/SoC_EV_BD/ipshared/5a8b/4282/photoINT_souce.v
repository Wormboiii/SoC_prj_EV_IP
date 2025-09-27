`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 10:07:25 AM
// Design Name: 
// Module Name: photoINT_souce
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