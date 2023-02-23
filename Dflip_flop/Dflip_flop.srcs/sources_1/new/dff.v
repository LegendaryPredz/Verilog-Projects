`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 10:03:21 PM
// Design Name: 
// Module Name: dff
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


module dff(data, q, clk, rst);

input data, clk, rst;
output q;

reg q; 

always @(posedge clk)
begin
if (rst == 1'b1) 
    begin 
        q <= 1'b0;
    end 
else 
    begin 
        q <= data; 
    end 
end

endmodule
