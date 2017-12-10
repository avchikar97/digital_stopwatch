//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2017 11:02:52 AM
// Design Name: 
// Module Name: time_multiplexing_main
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

module time_multiplexing_main(
    input clk,
    input [15:0] sw,
    output [3:0] an,
    output [7:0] sseg
    );
    
    wire [7:0] in0, in1, in2, in3;
    
    hexto7segment c1 (.x(sw[3:0]), .r(in0));
    hexto7segment c2 (.x(sw[7:4]), .r(in1));
    hexto7segment c3 (.x(sw[11:8]), .r(in2));
    hexto7segment c4 (.x(sw[15:12]), .r(in3));
    
    time_mux_state_machine c6(
        .clk(clk),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .an(an),
        .sseg(sseg));
endmodule
