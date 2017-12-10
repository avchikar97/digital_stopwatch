//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2017 02:46:03 PM
// Design Name: 
// Module Name: Mux_behavioral
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
`timescale 1ns / 1ps

module Mux_behavioral(
    input [13:0] i0,
    input [13:0] i1,
    input [13:0] i2,
    input [13:0] i3,
    input wire [1:0] s,
    output reg [13:0] y
    );
    
    always @(s) begin
        y = 1'b0;
            case(s)
            2'b00 : y = i0;
            2'b01 : y = i1;
            2'b10 : y = i2;
            2'b11 : y = i3;
            default : begin
                y = 0;
            end
            endcase
    end
    
endmodule
