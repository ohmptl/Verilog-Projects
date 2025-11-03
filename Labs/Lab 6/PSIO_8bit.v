`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ohm Patel
// 
// Create Date: 11/02/2025 10:37:52 PM
// Design Name: PISO_8bit
// Assign Name: ECE 310 Lab 6
// Description: A verilog implementation of a
//              Parallel In Serial Out Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////

module PISO_8bit(
    input [7:0] parallel_in,
    input clk, rst, shift, load,
    output reg serial_out
);

    reg [7:0] shift_register;
    
    always @(posedge clk) begin
        if(rst) begin
            shift_register <= 8'b0;
            serial_out <= 1'b0;
        end else if (load) begin
            shift_register <= parallel_in;
            serial_out <= 1'b0;
        end else if (shift) begin
            serial_out <= shift_register[0];
            shift_register <= {1'b0, shift_register[7:1]};
        end else begin
            shift_register <= shift_register;
            serial_out <= serial_out;
        end
    end
    
endmodule
