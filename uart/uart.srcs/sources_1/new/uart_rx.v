`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2023 08:07:39 PM
// Design Name: 
// Module Name: uart_rx
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


module uart_receiver(
    input clk,
    input rx, // Input signal from UART transmitter
    output reg [DATA_WIDTH-1:0] data, // Output received data
    output reg valid // Output signal indicating valid received data
);

    parameter IDLE = 2'b00;
    parameter START = 2'b01;
    parameter DATA = 2'b10;
    parameter STOP = 2'b11;

    parameter BAUD_RATE = 9600;
    parameter DATA_WIDTH = 8;

    reg [2:0] state; // State machine state
    reg [DATA_WIDTH+3:0] bit_count; // Count of received bits (start + data + stop)
    reg [DATA_WIDTH-1:0] shift_reg; // Shift register used to receive data
    reg start_bit_received; // Flag indicating whether the start bit has been received

    // Calculate the number of clock cycles required to wait for one bit at the given baud rate
    localparam CYCLES_PER_BIT = $ceil($div($div(BAUD_RATE, 10), DATA_WIDTH));

    always @(posedge clk) begin
        case (state)
            IDLE: // Idle state
            begin
                if (!rx) begin // If start bit is received
                    state <= START; // Change state to start bit reception
                    start_bit_received <= 1; // Set flag to indicate that start bit has been received
                    bit_count <= 1; // Reset bit count and set to start bit
                    shift_reg <= 0; // Reset shift register
                end
            end
            START: // Wait for start bit to finish
            begin
                if (bit_count == DATA_WIDTH+2) begin // If all bits (start + data + stop) have been received
                    data <= shift_reg; // Output received data
                    valid <= 1; // Set valid data signal
                    state <= IDLE; // Change state to idle
                end
                else if (bit_count % (DATA_WIDTH+1) == 0 && rx) begin // If start bit is received again
                    state <= START; // Change state to start bit reception
                    bit_count <= 1; // Reset bit count and set to start bit
                    shift_reg <= 0; // Reset shift register
                end
                else begin
                    bit_count <= bit_count + 1; // Increment bit count
                end
            end
            DATA: // Receive data bits
            begin
                shift_reg <= {shift_reg[DATA_WIDTH-2:0], rx}; // Shift received bit into shift register
                bit_count <= bit_count + 1; // Increment bit count
                if (bit_count % (DATA_WIDTH+1) == 0) begin // If all data bits have been received
                    state <= STOP; // Change state to stop bit reception
                end
            end
            STOP: // Wait for stop bit
            begin
                if (!rx && !start_bit_received) begin // If stop bit is received
                    state <= START; // Change state to start bit reception
                    bit_count <= 1; // Reset bit count and set to start bit
                    shift_reg <= 0; // Reset shift register
                end
                else begin
                    bit_count <= bit_count + 1; // Increment bit count
                end
            end
        endcase
    end

endmodule


