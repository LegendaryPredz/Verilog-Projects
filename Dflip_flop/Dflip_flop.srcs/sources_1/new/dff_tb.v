`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 10:06:20 PM
// Design Name: 
// Module Name: dff_tb
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


module dff_tb;

reg data, rst;
reg clk = 0;
wire q; 

dff DUT (data, q, clk, rst);


always #5 clk =~ clk; 

initial begin 
    rst = 1'b1; 
    #10 rst = 1'b0; 
end 

initial begin 
    data = 1'b0;
    #20 data = 1'b1; 
    #20 data = 1'b0;
    #20 data = 1'b1;
    #20 data = 1'b0;
    #20 $finish;
end 

always @(posedge clk) 
    begin 
        $display ("clk=%b, rst=%b, data=%b, q=%b", clk, rst, data, q);
    end

endmodule
