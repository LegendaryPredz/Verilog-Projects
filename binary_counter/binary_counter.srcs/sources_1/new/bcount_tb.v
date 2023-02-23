`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 08:58:07 PM
// Design Name: 
// Module Name: bcount_tb
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


module bcount_tb;

    wire [3:0] val;
    reg clk;
    reg rst;

    bcount DUT (val, clk, rst);

    always #5 clk =~ clk;

    initial
    begin
        clk <= 0;
        rst <= 0;


        #20
        rst <= 1;
        #80
        rst <= 0;
        #50
        rst <= 1;

        #20

        $finish;
    end

endmodule
