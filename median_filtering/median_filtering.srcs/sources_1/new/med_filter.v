`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2023 09:01:09 PM
// Design Name: 
// Module Name: med_filter
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


module med_filter(
    input clk,
    input rst,
    input [7:0] pix_in,
    output [7:0] pix_out
);

    reg [7:0] pix_mem [0:8];
    reg [7:0] median;
    reg [3:0] count = 0;
    reg [7:0] sorted_pix [0:8];

    always @(posedge clk) begin
            pix_mem[count] <= pix_in;
            count <= count + 1;
            if (count == 9) begin
                count <= 0;
            end
        end

    reg [3:0] i;
    reg [3:0] j;
    always @(*) begin
            for (i = 0; i < 9; i = i + 1) begin
                sorted_pix[i] = pix_mem[i];
            end

            // Sorting the array
            for (i = 0; i < 9; i = i + 1) begin
                for (j = i + 1; j < 9; j = j + 1) begin
                    if (sorted_pix[j] < sorted_pix[i]) begin
                        median = sorted_pix[i];
                        sorted_pix[i] = sorted_pix[j];
                        sorted_pix[j] = median;
                    end
                end
            end
        end

    assign pix_out = sorted_pix[4];
endmodule

