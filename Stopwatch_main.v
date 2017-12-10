`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 12:37:24 PM
// Design Name: 
// Module Name: Stopwatch_main
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


module Stopwatch_main(
    input clk,
    input wire rst,
    input wire start,
    input wire [1:0] mode,
    input wire [3:0] init_0,
    input wire [3:0] init_1,
    output [7:0] sseg,
    output [3:0] an/*,
    output reg tick_light*/
    );
    
    wire [1:0] T_s;
    wire T_ld, T_comp;
    wire [13:0] T;
    reg [15:0] sw;
    wire slow_clk;
    wire fast_clk;
    
    initial begin
        sw = 0;
        //sseg = 8'b11111111;
        //an = 4'b1111;
    end
                
    clk_div_display c0(.clk(clk), .clk_out_state(slow_clk), .clk_out_fast(fast_clk));
    stopwatch_state s0(.clk(slow_clk), .start(start), .rst(rst), .T_comp(T_comp), .T_s(T_s), .T_ld(T_ld)/*, .led(tick_light)*/);
    stopwatch_datapath s1(.T_s(T_s), .mode(mode), .init_0(init_0), .init_1(init_1), .T_ld(T_ld), .clk(slow_clk), .T(T), .T_comp(T_comp));
    
    always@(T) begin
        sw[3:0] = T % 10;
        sw[7:4] = (T/10)%10;
        sw[11:8] = (T/100)%(10);
        sw[15:12] = (T/1000)%(10);
    end
    
    time_multiplexing_main d0(.clk(fast_clk), .sw(sw), .an(an), .sseg(sseg));
endmodule
