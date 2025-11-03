`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ohm Patel
// 
// Create Date: 11/02/2025 10:37:52 PM
// Design Name: PISO_8bit_tb
// Assign Name: ECE 310 Lab 6
// Description: A testbench for a
//              Parallel In Serial Out Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////

module PISO_8bit_tb;
    reg [7:0] parallel_in;
    reg clk, rst, shift, load;
    wire serial_out;

    PISO_8bit dut (parallel_in, clk, rst, shift, load, serial_out);

    // Clock generation (period = 10 ns)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0; rst = 0; shift = 0; load = 0; parallel_in = 8'b0;
        #10;

        // Reset the system
        rst = 1; #10; rst = 0;
        #10;

        // --- First test vector ---
        parallel_in = 8'b10110110; 
        load = 1; #10; load = 0;  
        #10;
        shift = 1;
        repeat (8) #10;
        shift = 0;
        #20;

        // --- Second test vector ---
        parallel_in = 8'b01101101;
        load = 1; #10; load = 0;
        #20; 

        shift = 1;
        repeat (8) #10;
        shift = 0;
        #20;

        $stop;
    end

endmodule
