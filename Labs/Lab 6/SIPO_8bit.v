`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ohm Patel
// 
// Create Date: 11/02/2025 10:37:52 PM
// Design Name: SIPO_8bit
// Assign Name: ECE 310 Lab 6
// Description: A verilog implementation of a
//              Serial In Parallel Out Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////

module SIPO_8bit(
    input serial_in, clk, rst, shift,
    output reg [7:0] parallel_out
);

    reg [7:0] shift_register;
    
    always @(posedge clk) begin
        if(rst) begin
            shift_register <= 8'b0;
        end else if(shift) begin
            shift_register <= {shift_register[6:0],serial_in};
        end
    end
    
    always @(*) begin
        parallel_out = shift_register;
    end
endmodule
