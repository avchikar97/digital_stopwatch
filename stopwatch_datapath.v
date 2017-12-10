`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2017 08:22:11 AM
// Design Name: 
// Module Name: stopwatch_state
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


module stopwatch_datapath(
    input [1:0] T_s,
    input [1:0] mode,
    input [3:0] init_0,
    input [3:0] init_1,
    input T_ld,
    input clk,
    output reg [13:0] T,
    output reg T_comp
    );
    
    wire [13:0] increment;
    wire [13:0] T_out;
    wire [13:0] T_initial;
    reg [13:0] T_init_low;
    reg [13:0] T_init_high;
    wire [13:0] init_value;
    wire data_clock;
    
    initial begin
        T_init_low = 0;
        T_init_high = 9999;
    end
        
    assign init_value = (init_1*10)+init_0;
    assign data_clock = clk;
        
    localparam [1:0] Mux_i0 = 0, Mux_i1 = 1, Mux_i2 = 2;
    
    //Incrementer a0(.A(T), .mode(mode), .y(increment));
    
    //Mux_behavioral m0(.i0(T_init_low), .i1(init*(3'd100)), .i2(T_init_high), .i3(init*(3'd100)), .s(mode), .y(T_initial));
    
    Mux_input m2(.A(T), .i0(T_init_low), .i1(init_value*(100)), .i2(T_init_high), .i3(11), .s(mode), .x(increment), .y(T_initial));
    
    Mux_behavioral m1(.i0(T_initial), .i1(increment), .i2(T), .i3(0), .s(T_s), .y(T_out));

    always@(posedge data_clock) begin
        case(mode)
            2'b00:begin
                if(T_out >= 9998) begin//limit of mode 1 is 9999
                    T_comp = 1;
                    //T = 9999;
                end
                else begin
                    T_comp = 0;
                    //T = T_out;
                end
            end
            2'b01:begin
                if(T_out >= 9998) begin//limit of mode 2 is 9999
                    T_comp = 1;
                    //T = 9999;
                end
                else begin
                    T_comp = 0;
                    //T = T_out;
                end
            end
            2'b10:begin
                if(T_out <= 0001 || T_out > 9999) begin//limit of mode 3 is 0000
                    T_comp = 1;
                    //T = 0000;
                end
                else begin
                    T_comp = 0;
                    //T = T_out;
                end
            end
            2'b11:begin
                if(T_out <= 0001 || T_out > 9999) begin//limit of mode 4 is 0000
                    T_comp = 1;
                    //T = 0000;
                end
                else begin
                    T_comp = 0;
                    //T = T_out;
                end
            end
        endcase
        if(T_ld)
            T = T_out;
    end
endmodule
