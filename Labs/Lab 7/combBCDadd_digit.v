`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ohm Patel
// 
// Create Date: 11/09/2025 10:13:44 PM
// Design Name: combBCDadd_digit
// Assign Name: ECE 310 Lab 7
// Description: A verilog implementation of a
//              BCD adder
// 
//////////////////////////////////////////////////////////////////////////////////


module combBCDadd_digit (
	input [3:0] A, B,
	input cin,
	output cout,
	output [3:0] F );

	// Your code goes here
	wire [4:0] sum;
	assign sum = A + B + cin;

	wire correction;
	assign correction = (sum > 9);

	wire [4:0] bcd_corrected;
	assign bcd_corrected = sum + (correction ? 5'b00110 : 5'b00000);

	assign F = bcd_corrected[3:0];
	assign cout = bcd_corrected[4];
	
endmodule
