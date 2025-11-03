`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ohm Patel
// 
// Create Date: 11/02/2025 10:37:52 PM
// Design Name: SIPO_8bit_tb
// Assign Name: ECE 310 Lab 6
// Description: A testbench for a
//              Serial In Parallel Out Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module SIPO_8bit_tb;
    reg serial_in, clk, rst, shift;
    wire [7:0] parallel_out;

    SIPO_8bit dut (serial_in, clk, rst, shift, parallel_out);

    // Clock generation (period = 10 ns)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0; rst = 0; shift = 0; serial_in = 0;
        #10;

        // Reset system
        rst = 1; #10; rst = 0;
        #10;

        // --- First serial sequence ---
        // Sequence = 8'b10110110
        shift = 1;
        serial_in = 0; #10;  // bit 0
        serial_in = 1; #10;  // bit 1
        serial_in = 1; #10;  // bit 2
        serial_in = 0; #10;  // bit 3
        serial_in = 1; #10;  // bit 4
        serial_in = 1; #10;  // bit 5
        serial_in = 0; #10;  // bit 6
        serial_in = 1; #10;  // bit 7
        shift = 0;
        #30;

        // --- Second serial sequence ---
        // Sequence = 8'b01101101
        #30; 
        shift = 1;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        shift = 0;
        #20;

        $stop;
    end

endmodule
