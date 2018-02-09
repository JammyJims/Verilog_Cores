`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:03:06 01/25/2018
// Design Name:   Device
// Module Name:   C:/Users/root/Desktop/USB_Research/inout/Device_tb.v
// Project Name:  inout
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Device
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Device_tb;

	// Inputs
	reg clk_i;
	reg rst_i;
	reg tx_oe;

	// Bidirs
	wire [7:0] data_io;

	// Instantiate the Unit Under Test (UUT)
	Device uut (
		.clk_i(clk_i), 
		.rst_i(rst_i), 
		.tx_oe(tx_oe), 
		.data_io(data_io)
	);
	
	wire [7:0] rx;
	reg [7:0] tx;
	assign data_io = tx_oe ? 8'bzzzz_zzzz : tx;
	assign rx = data_io;
	//assign data_io = tx_oe ? rx : tx ;
	initial begin
		// Initialize Inputs
		clk_i = 0;
		rst_i = 1;
		tx_oe = 0;
		tx = 8'b0000_0000;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b1111_1111;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_1111;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0001;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0010;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0100;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_1000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0001_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0010_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0100_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b1000_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 0;
		tx = 8'b0000_0000;
		// *************************************** //
		#10;
		rst_i = 0;
		tx_oe = 1;
		tx = 8'b0000_0000;
		// *************************************** //
		#500;
	end
	always begin
		#5 clk_i = ~clk_i;
	end
endmodule

