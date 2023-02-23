`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 09:42:56 PM
// Design Name: 
// Module Name: adff_tb
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


module adff_tb;

    reg data, clk, rst;
    wire q;

    adff DUT (data, q, clk, rst);

    initial begin
        clk = 0;
        forever #5 clk =~ clk;
    end

    initial begin
        rst = 1;
        data = 0;
        #10 rst = 0;
    end

    initial begin
        data = 1;
        #10;
        if (q !== 1'b1) $display("Test case 1 failed");

        data = 0;
        #10;
        if (q !== 1'b1) $display("Test case 2 failed");

        data = 1;
        #5 data = 0;
        #5;
        if (q !== 1'b0) $display("Test case 3 failed");

        $display ("All test cases passed!");
        $finish;
    end
endmodule
