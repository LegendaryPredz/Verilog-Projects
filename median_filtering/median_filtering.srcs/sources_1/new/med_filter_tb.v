`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2023 09:14:54 PM
// Design Name: 
// Module Name: med_filter_tb
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


module med_filter_tb;

  localparam IMG_WIDTH = 8;
  localparam IMG_HEIGHT = 8;
  localparam PIX_MIN = 0;
  localparam PIX_MAX = 255;

  reg clk;
  reg rst;
  reg [7:0] pix_in;
  wire [7:0] pix_out;

  med_filter DUT (.clk(clk), .rst(rst), .pix_in(pix_in), .pix_out(pix_out));

  initial begin
    clk = 0;
    forever #10 clk =~ clk;
  end

  initial begin
    rst = 1;
    #100;
    rst = 0;
  end

  reg [7:0] test_img [0:IMG_HEIGHT-1][0:IMG_WIDTH-1];
  reg [3:0] i;
  reg [3:0] j;

  initial begin
    for(i = 0; i < IMG_HEIGHT; i = i + 1) begin
      for(j = 0; j < IMG_WIDTH; j = j + 1) begin
        test_img[i][j] = $random % (PIX_MAX - PIX_MIN + 1) + PIX_MIN;
      end
    end
    $display("Test Image:");
    for (i = 0; i < IMG_HEIGHT; i = i + 1) begin
      for(j = 0; j < IMG_WIDTH; j = j + 1) begin
        $write("%3d ", test_img[i][j]);
      end
      $write("\n");
    end
  end

  initial begin
    #10
    for(i = 0; i < IMG_HEIGHT; i = i + 1) begin
      for(j = 0; j < IMG_WIDTH; j = j + 1) begin
        pix_in = test_img[i][j];
        #10;
        $display("Input Pixel = %d, Output Pixel = %d", pix_in, pix_out);
      end
    end
    $finish;
  end

endmodule
