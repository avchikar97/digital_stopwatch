`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2017 08:46:56 PM
// Design Name: 
// Module Name: clkdiv
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


module clk_div_display(
    input clk,
    output wire clk_out_state,
    output wire clk_out_fast
    );
    
    reg [19:0] COUNT;
    assign clk_out_state = COUNT[19];
    assign clk_out_fast = COUNT[10];
        
    initial begin
        COUNT = 0;
    end
        
    always @(posedge clk) begin
            COUNT = COUNT + 1;
            if(COUNT >= 1000000) begin
                COUNT = 0;
            end
    end
endmodule
