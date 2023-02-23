`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2023 09:36:10 PM
// Design Name: 
// Module Name: 7sd
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

/*
      7 seg 
        A 
     F      B 
        G
     E      C 
        D

    b'1000001
      ABCDEFG
      
      0 is of 
      1 is on 
      
      exapmle: 
      
      If I want to display a 1 
      
      I would need 
      
          B 
          
          C
          
      which is b'0110000 = h'30
*/
// SEVEN-SEGMENT DISPLAY
module ssd(segA, segB, segC, segD, segE, segF, segG, clk, bnum);
    input [3:0] bnum;
    output segA, segB, segC, segD, segE, segF, segG;
    input clk;
    
    reg [6:0]  hVal = 7'h00;
    
    always @(posedge clk)
        begin
            case (bnum)
                4'b0000 : hVal <= 7'h7E;
                4'b0001 : hVal <= 7'h30;
                4'b0010 : hVal <= 7'h6D;
                4'b0011 : hVal <= 7'h79;
                4'b0100 : hVal <= 7'h33;          
                4'b0101 : hVal <= 7'h5B;
                4'b0110 : hVal <= 7'h5F;
                4'b0111 : hVal <= 7'h70;
                4'b1000 : hVal <= 7'h7F;
                4'b1001 : hVal <= 7'h7B;
                4'b1010 : hVal <= 7'h77;
                4'b1011 : hVal <= 7'h1F;
                4'b1100 : hVal <= 7'h4E;
                4'b1101 : hVal <= 7'h3D;
                4'b1110 : hVal <= 7'h4F;
                4'b1111 : hVal <= 7'h47;
            endcase
       end
       
       
    assign {segA, segB, segC, segD, segE, segF, segG} = hVal[6:0];
    
endmodule