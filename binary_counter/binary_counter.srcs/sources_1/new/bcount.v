`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 08:58:07 PM
// Design Name: 
// Module Name: bcount
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


module bcount(val, clk, rst);

output reg[3:0] val;
input clk, rst;

always @(posedge clk)
    begin
        if(!rst)
            val = 0;
        else
            val = val + 1;
    end 
endmodule
