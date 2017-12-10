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


module stopwatch_state(
    input clk,
    input start,
    input rst,
    input T_comp,
    output reg [1:0] T_s,
    output reg T_ld/*,
    output reg led*/
    );
    
    localparam [1:0] SW_Init = 0,
                     SW_Tick = 1,
                     SW_Pause = 2;
                     
    reg [1:0] SW_State;
    reg [1:0] next_state;
    
    reg [1:0] State_Toggle;
    localparam [1:0] State_s0 = 0, State_s1 = 1, State_s2 = 2, State_s3 = 3;
        
    reg tick;
    
    initial begin
        SW_State = SW_Init;
        State_Toggle = State_s0;
        tick = 1'b0;
        T_ld = 1;
        T_s = 1'b00;
    end
        
    always@(*)begin
    end
        
    always@(posedge clk) begin
        if(rst) begin
            SW_State = SW_Init;
            State_Toggle = State_s0;
            tick = 0;
            //led = 0;
        end
        else begin
//            if(start) begin
//                tick = !tick;
//            end
//            else begin
                case(State_Toggle)
                    State_s0 : begin
                        if(!start)
                            State_Toggle = State_s0;
                        else if(rst)
                            State_Toggle = State_s0;
                        else
                            State_Toggle = State_s1;
                    end
                    State_s1 : begin
                        if(start)
                            State_Toggle = State_s1;
                        else if(rst)
                            State_Toggle = State_s0;
                        else
                            State_Toggle = State_s2;
                    end
                    State_s2 : begin
                        if(!start)
                            State_Toggle = State_s2;
                        else if(rst)
                            State_Toggle = State_s0;
                        else
                            State_Toggle = State_s3;
                    end
                    State_s3 : begin
                        if(!start)
                            State_Toggle = State_s0;
                        else if(rst)
                            State_Toggle = State_s0;
                        else
                            State_Toggle = State_s3;
                    end
                    default : begin
                        State_Toggle = State_s0;
                    end
                endcase
                case(State_Toggle)
                    State_s0 : begin
                        tick = 1'b0;
                    end
                    State_s1 : begin
                        tick = 1'b1;
                    end
                    State_s2 : begin
                        tick = 1'b1;
                    end
                    State_s3 : begin
                        tick = 1'b0;
                    end
                    default : begin
                        tick = 1'b0;
                    end
                endcase                
                case(SW_State)
                    SW_Init : begin
                        if(rst) begin
                            SW_State = SW_Init;
                        end
                        else if(tick && !rst && !T_comp) begin
                            SW_State = SW_Tick;
                        end
                        else if(!rst && T_comp) begin
                            SW_State = SW_Pause;
                        end
                        else begin
                            SW_State = SW_Init;
                        end
                    end
                    SW_Tick : begin
                        if(rst) begin
                            SW_State = SW_Init;
                        end
                        else if(tick && !T_comp && !rst) begin
                            SW_State = SW_Tick;
                        end
                        else if(!rst &&(!tick || (tick && T_comp))) begin
                            SW_State = SW_Pause;
                        end
                        else begin
                            SW_State = SW_Init;
                        end
                    end
                    SW_Pause : begin
                        if(rst) begin
                            SW_State = SW_Init;
                        end
                        else if(!rst &&(!tick || (tick && T_comp))) begin
                            SW_State = SW_Pause;
                        end
                        else if(tick && !rst && !T_comp) begin
                            SW_State = SW_Tick;
                        end
                        else begin
                            SW_State = SW_Init;
                        end
                    end
                    default : begin
                        SW_State = SW_Init;
                    end
                endcase
//            end
        end
        
        case(SW_State)
            SW_Init : begin
                T_s = 2'b00;//output initial value
                T_ld = 1'b1;
            end
            SW_Tick : begin
                T_s = 2'b01;//output incremented value
                T_ld = 1'b1;
            end
            SW_Pause : begin
                T_s = 2'b10;//output itself (paused)
                T_ld = 1'b1;
            end
            default : begin
                T_s = 2'b00;
                T_ld = 1'b1;
            end
        endcase
    end
endmodule
