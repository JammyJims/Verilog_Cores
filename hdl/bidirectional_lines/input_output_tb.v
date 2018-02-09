`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:44 01/24/2018
// Design Name:   input_output_example
// Module Name:   C:/Users/root/Desktop/USB_Research/inout/input_output_tb.v
// Project Name:  inout
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: input_output_example
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module input_output_tb;

	// Inputs
	reg clk_i;
	reg rst_i;
	reg [7:0] a_i;
	reg tx_oe;

	// Outputs
	wire [7:0] b_o;

	// Bidirs
	wire [7:0] data_line_io;

	// Instantiate the Unit Under Test (UUT)
	input_output_example uut (
		.clk_i(clk_i), 
		.rst_i(rst_i), 
		.a_i(a_i), 
		.tx_oe(tx_oe), 
		.b_o(b_o), 
		.data_line_io(data_line_io)
	);

	initial begin
		// Initialize Inputs
		clk_i = 0;
		rst_i = 0;
		a_i = 0;
		tx_oe = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// ************************************** //
		#10;
		a_i = 8'b1111_1111;
		tx_oe = 0;
		// ************************************** //
		#10;
		a_i = 8'b0000_1111;
		tx_oe = 0;
		// ************************************** //
		#10;
		a_i = 8'b1111_0000;
		tx_oe = 0;
		// ************************************** //
		#10;
		a_i = 8'b1100_0011;
		tx_oe = 1;
		// ************************************** //
		#10;
		a_i = 8'b1010_1010;
		tx_oe = 1;
		// ************************************** //
		#10;
		a_i = 8'b0101_0101;
		tx_oe = 1;
		// ************************************** //
		#10;
		a_i = 8'b0011_1100;
		tx_oe = 1;
		// ************************************** //
		#10;
		a_i = 8'b1110_0111;
		tx_oe = 0;
		// ************************************** //
	end
	always begin
		#5 clk_i = ~clk_i;
	end
endmodule

