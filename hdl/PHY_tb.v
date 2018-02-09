`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:44:39 01/31/2018
// Design Name:   Physical_Interface
// Module Name:   C:/Users/root/Desktop/USB_Research/inout/PHY_tb.v
// Project Name:  inout
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Physical_Interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PHY_tb;

	// Inputs
	reg clk_i;
	reg rst_i;
	reg tx_oe;

	// Bidirs
	wire [7:0] data_line_io;

	// Instantiate the Unit Under Test (UUT)
	Physical_Interface uut (
		.clk_i(clk_i), 
		.rst_i(rst_i), 
		.tx_oe(tx_oe), 
		.data_line_io(data_line_io)
	);
	
	// data to be sent out from the test bench when tx_oe == 0
	// remember that tx_oe is with respect to the device. usually it shouldn't be visible
	// from the outside i.e. from the test bench. The reason it is
	// in this current scenario is more easily test the operation.
	// usually what would happen in USB protocol is that an IN packet would be sent
	// from the host to device and then the USB device will respond accordingly by
	// driving the tx_oe pin and sending data along the bi-directional data lines
	reg [7:0] data_line_o; // buffer for data to be sent out
	assign data_line_io = ~tx_oe ? data_line_o : 8'bZZ; // send data when tx_oe == 0
	
	// test bench stimulus
	initial begin
		// Initialize Inputs
		clk_i = 0;
		rst_i = 0;
		tx_oe = 0;
		data_line_o = 8'b0000_0000;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		data_line_o = 8'hAA;
		tx_oe = 1;
		// ************************************** //
		#10;
		data_line_o = 8'hBB;
		tx_oe = 1;
		// ************************************** //
		#10;
		data_line_o = 8'hCC;
		tx_oe = 1;
		// ************************************** //
		#10;
		data_line_o = 8'hDD;
		tx_oe = 1;
		// ************************************** //
		#10;
		data_line_o = 8'hAB;
		tx_oe = 0;
		// ************************************** //
		#10;
		data_line_o = 8'hAC;
		tx_oe = 0;
		// ************************************** //
		#10;
		data_line_o = 8'hAD;
		tx_oe = 0;
		// ************************************** //
		
	end
	always begin
		#5 clk_i = ~clk_i;
	end
endmodule

