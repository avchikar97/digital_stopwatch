`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2017 11:09:43 AM
// Design Name: 
// Module Name: time_mux_state_machine
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


module time_mux_state_machine(
    input clk,
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    output reg [3:0] an,
    output reg [7:0] sseg
    );
    
    reg [1:0] state;
    reg [1:0] next_state;
    
    initial begin
        state = 2'b00;
    end
    
    always @(*) begin
        case(state) //State transition
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00;
            default: begin
                next_state = 2'b00;
            end
        endcase
    end
    
    always @(posedge clk) begin
        case(state) //Multiplexer
            2'b00: sseg = in0 & 8'b11111111;
            2'b01: sseg = in1 & 8'b11111111;
            2'b10: sseg = in2 & 8'b01111111;
            2'b11: sseg = in3 & 8'b11111111;
            default: begin
                sseg = in0;
            end
                
        endcase
        
        case(state) //Decoder
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
            default: begin
                an = 4'b1110;
            end
        endcase
    end
    
    always @(posedge clk) begin
            state <= next_state;
    end
endmodule
