`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 09:35:47 PM
// Design Name: 
// Module Name: adff
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


module adff(data, q, clk, rst);

input data;
input clk, rst;
output q; 

reg q; 

always @(posedge clk or negedge rst)
if (~rst) 
    begin 
        q <= 1'b0;
    end
else 
    begin 
        q <= data;
    end 
           
endmodule
