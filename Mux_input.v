`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2017 02:56:06 PM
// Design Name: 
// Module Name: Mux_input
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


module Mux_input(
    input wire [13:0] A,
    input [13:0] i0,
    input [13:0] i1,
    input [13:0] i2,
    input [13:0] i3,
    input [1:0] s,
    output reg [13:0] x,
    output reg [13:0] y
    );
    
    always@(A, s, i1) begin
        case(s)
            2'b00:begin
                x = A + 1;
                y = i0;//T_low = 0000
            end
            2'b01:begin
                x = A + 1;
                y = i1;//initial from switches
            end
            2'b10:begin
                x = A - 1;
                y = i2;//T_high = 9999
            end
            2'b11:begin
                x = A - 1;
                y = i1;//initial from switches
            end
            default begin
                x = 0;
                y = 0;
            end
        endcase
    end
endmodule
