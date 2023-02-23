`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 10:14:34 PM
// Design Name: 
// Module Name: uart_tb
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


module tb_uart;

  // Define parameters for baud rate and data width
  parameter BAUD_RATE = 9600;
  parameter DATA_WIDTH = 8;

  // Define signals for connecting the transmitter and receiver
  wire tx, rx;
  wire tx_done, rx_done;
  reg [DATA_WIDTH-1:0] data_in, data_out;
  reg tx_en, rx_en;

  // Instantiate the transmitter and receiver modules
  uart_transmitter #(.BAUD_RATE(BAUD_RATE), .DATA_WIDTH(DATA_WIDTH))
    transmitter (.tx(tx), .tx_done(tx_done), .data_in(data_in), .tx_en(tx_en));

  uart_receiver #(.BAUD_RATE(BAUD_RATE), .DATA_WIDTH(DATA_WIDTH))
    receiver (.rx(rx), .rx_done(rx_done), .data_out(data_out), .rx_en(rx_en));

  // Generate a clock signal
  reg clk = 0;
  always #5 clk = ~clk;

  // Define a reset signal
  reg rst = 1;
  initial #10 rst = 0;

  // Define test data
  reg [7:0] test_data = 8'b01100101;

  // Transmit test data
  initial begin
    #100;
    tx_en = 1;
    data_in = test_data;
    #1000;
    tx_en = 0;
  end

  // Receive transmitted data
  initial begin
    #1000;
    rx_en = 1;
    #1000;
    rx_en = 0;
  end

  // Check received data
  always @(posedge rx_done) begin
    if (data_out === test_data) begin
      $display("Data received correctly!");
    end else begin
      $display("Error: Received data does not match transmitted data.");
    end
  end

endmodule


