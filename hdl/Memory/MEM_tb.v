`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:09:36 01/31/2018
// Design Name:   Memory
// Module Name:   C:/Users/root/Desktop/USB_Research/inout/MEM_tb.v
// Project Name:  inout
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEM_tb;

	// Inputs
	reg clk_i;
	reg rst_i;
	reg tx_oe;

	// Bidirs
	wire [7:0] data_io;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.clk_i(clk_i), 
		.rst_i(rst_i), 
		.data_io(data_io), 
		.tx_oe(tx_oe)
	);
	reg [7:0] data_line_o; // buffer for data to be sent out
	assign data_io = ~tx_oe ? data_line_o : 8'bZZ; // send data when tx_oe == 0
	initial begin
		// Initialize Inputs
		clk_i = 0;
		rst_i = 0;
		tx_oe = 0;
		data_line_o = 8'h00;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		tx_oe = 0;
		data_line_o = 8'h00;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hAA;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hBB;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hCC;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hDD;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hEE;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'hFF;
		// ************************************** //
		#10;
		tx_oe = 0;
		data_line_o = 8'h00;
		// ************************************** //
		#10;
		tx_oe = 1;
		data_line_o = 8'h00;
		// ************************************** //
		
	end
	always @(posedge clk_i) begin
		#5 clk_i = ~clk_i;
	end
endmodule

