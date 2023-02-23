`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 07:11:31 PM
// Design Name: 
// Module Name: traffic_control
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


module traffic_control(n_lights, s_lights, e_lights, w_lights, clk, rst_a);

output reg [2:0] n_lights, s_lights, e_lights, w_lights;
input clk;
input rst_a;

reg [2:0] state;

parameter [2:0] north=3'b000;
parameter [2:0] north_y=3'b001;
parameter [2:0] south=3'b010;
parameter [2:0] south_y=3'b011;
parameter [2:0] east=3'b100;
parameter [2:0] east_y=3'b101;
parameter [2:0] west=3'b110;
parameter [2:0] west_y=3'b111;

reg [2:0] count;

always @(posedge clk, posedge rst_a)
    begin
        if(rst_a)
    begin
        state=north;
        count=3'b000;
    end
else
    begin
    case (state)
    north:
    begin
        if (count==3'b111)
            begin
                count=3'b000;
                state=north_y;
            end
        else
            begin
                count=count+3'b001;
                state=north;
            end
    end

    north_y:
    begin
        if (count==3'b011)
            begin
                count=3'b000;
                state=south;
            end
        else
            begin
                count=count+3'b001;
                state=north_y;
            end
    end 
    
    south:
    begin
        if (count==3'b111)
            begin
                count=3'b000;
                state=south_y;
            end
        else
            begin
                count=count+3'b001;
                state=south;
            end
    end

    south_y:
    begin
        if (count==3'b011)
            begin
                count=3'b000;
                state=east;
            end
        else
            begin
                count=count+3'b001;
                state=south_y;
            end
    end 
    
    east:
    begin
        if (count==3'b111)
            begin
                count=3'b000;
                state=east_y;
            end
        else
            begin
                count=count+3'b001;
                state=east;
            end
    end

    east_y:
    begin
        if (count==3'b011)
            begin
                count=3'b000;
                state=west;
            end
        else
            begin
                count=count+3'b001;
                state=east_y;
            end
    end 
    
    west:
    begin
        if (count==3'b111)
            begin
                count=3'b000;
                state=west_y;
            end
        else
            begin
                count=count+3'b001;
                state=west;
            end
    end

    west_y:
    begin
        if (count==3'b011)
            begin
                count=3'b000;
                state=north;
            end
        else
            begin
                count=count+3'b001;
                state=west_y;
            end
        end 
    endcase
    end
    end
    
always@(state)
    begin
        case (state)
            north:
                begin
                    n_lights = 3'b001;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end 
            north_y:
                begin
                    n_lights = 3'b010;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end
            south:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b001;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end 
            south_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b010;
                    e_lights = 3'b100;
                    w_lights = 3'b100;
                end 
             east:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b001;
                    w_lights = 3'b100;
                end 
             east_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b010;
                    w_lights = 3'b100;
                end 
             west:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b001;
                end 
              west_y:
                begin
                    n_lights = 3'b100;
                    s_lights = 3'b100;
                    e_lights = 3'b100;
                    w_lights = 3'b010;
                end  
        endcase
    end



endmodule
