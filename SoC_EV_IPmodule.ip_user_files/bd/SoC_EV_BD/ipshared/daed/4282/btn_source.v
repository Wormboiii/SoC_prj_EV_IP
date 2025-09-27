`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 10:01:27 AM
// Design Name: 
// Module Name: btn_source
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