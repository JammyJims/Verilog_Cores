`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:44:56 12/13/2017
// Design Name:   LFSR_TOP
// Module Name:   U:/Xilinx/LFSR/LFSR_TOP_TEST.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LFSR_TOP_TEST;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] out_reg;
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	LFSR_TOP uut (
		.clk(clk), 
		.out_reg(out_reg), 
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always begin
		# 1 clk = ~clk;
	end
endmodule

