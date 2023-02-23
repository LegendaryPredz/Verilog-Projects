`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 11:30:26 PM
// Design Name: 
// Module Name: ssd_tb
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


module ssd_tb;

    reg clk;
    reg [3:0] bnum;

    wire segA;
    wire segB;
    wire segC;
    wire segD;
    wire segE;
    wire segF;
    wire segG;

    ssd DUT (segA, segB, segC, segD, segE, segF, segG, clk, bnum);

    initial
    begin
        clk = 0;
        forever #5 clk =~ clk;
    end

    initial
    begin
        // Test case 1 : input 0
        bnum = 4'b0000;
        #10;
        if(segA !== 1 || segB !== 1 || segC !== 1 || segD !== 1
        || segE !== 1 || segF !== 1 || segG !== 0)
            $error("Test case 1 failed");

            //Test case 2 : input 5    
        bnum = 4'b0101;
        #10;
        if(segA !== 1 || segB !== 0 || segC !== 1 || segD !== 1
        || segE !== 0 || segF !== 1 || segG !== 1)
            $error("Test case 2 failed");

            //Test case 3: input 10
        bnum = 4'b1010;
        #10;
        if(segA !== 1 || segB !== 1 || segC !== 1 || segD !== 0
        || segE !== 1 || segF !== 1 || segG !== 1)
            $error("Test case 3 failed");

        $finish;
    end
endmodule
