`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2017 10:50:49 AM
// Design Name: 
// Module Name: hexto7segment
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


module hexto7segment(
    input [3:0] x,
    output reg [7:0] r
    );
    
    always @(*)
        case(x)
            4'b0000: r = 8'b10000001;
            4'b0001: r = 8'b11001111;
            4'b0010: r = 8'b10010010;
            4'b0011: r = 8'b10000110;
            4'b0100: r = 8'b11001100;
            4'b0101: r = 8'b10100100;
            4'b0110: r = 8'b10100000;
            4'b0111: r = 8'b10001111;
            4'b1000: r = 8'b10000000;
            4'b1001: r = 8'b10001100;
            4'b1010: r = 8'b10001000;
            4'b1011: r = 8'b11100000;
            4'b1100: r = 8'b10110001;
            4'b1101: r = 8'b11000010;
            4'b1110: r = 8'b10110000;
            4'b1111: r = 8'b10111000;
        endcase
endmodule
