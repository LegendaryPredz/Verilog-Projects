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


module uart_tx
#(
    parameter baud_rate,
    parameter clk_freq
)
(
    input clk,
    input [7:0] data,
    output reg tx
);

    parameter IDLE = 2'b00;
    parameter START = 2'b01;
    parameter DATA = 2'b10;
    parameter STOP = 2'b11;

    localparam clocks_per_bit = clk_freq / baud_rate;

    reg [2:0] state;
    reg [3:0] bit_count;
    reg [7:0] shift_reg;
    reg [31:0] delay_counter;

    always @(posedge clk) begin
        case (state)
            IDLE:
            begin
                if (data != 8'hFF) begin
                    tx <= 0;
                    state <= START;
                    bit_count <= 0;
                    shift_reg <= data;
                    delay_counter <= clocks_per_bit - 1;
                end
            end
            START:
            begin
                tx <= 1;
                state <= DATA;
                delay_counter <= clocks_per_bit - 1;
            end
            DATA:
            begin
                tx <= shift_reg[0];
                shift_reg <= {shift_reg[6:0], 1'b0};
                bit_count <= bit_count + 1;
                if (bit_count == 7) begin
                    state <= STOP;
                    delay_counter <= clocks_per_bit - 1;
                end else begin
                    delay_counter <= delay_counter - 1;
                end
            end
            STOP:
            begin
                tx <= 1;
                state <= IDLE;
                delay_counter <= clocks_per_bit - 1;
            end
        endcase

        if (delay_counter > 0) begin
            delay_counter <= delay_counter - 1;
        end
    end

endmodule

