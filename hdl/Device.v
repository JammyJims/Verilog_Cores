`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:48 01/25/2018 
// Design Name: 
// Module Name:    Device 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Device (
	input clk_i,
	input rst_i,
	input tx_oe,
	inout [7:0] data_io
	);

	// module instantiations
	// Instantiate the module
	Physical_Interface PHY (
		 .clk_i(clk_i), 
		 .rst_i(rst_i), 
		 .tx_oe(tx_oe), 
		 .data_line_io(data_io)
		 );

	// Instantiate the module
	Memory MEM (
		 .clk_i(clk_i), 
		 .rst_i(rst_i), 
		 .data_io(data_io), 
		 .tx_oe(tx_oe)
		 );
	
	


endmodule
