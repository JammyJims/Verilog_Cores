`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:17 01/24/2018 
// Design Name: 
// Module Name:    inout 
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
module Physical_Interface (
	input clk_i,
	input rst_i,
	input tx_oe,
	inout [7:0] data_line_io
	);
	
	wire data_line_i;
	reg [7:0] data_line_o;
	assign data_line_io = tx_oe ? data_line_o : 8'bZ;
	assign data_line_i = data_line_io;
	
	// clocked behaviour
	integer state = 0;
	always @(posedge clk_i) begin
		if (rst_i) begin // reset pushed
			data_line_o <= 8'h00;
		end else begin // normal operation condition
			if (state == 0) begin
				data_line_o <= 8'h3A;
				state = 1;
			end else begin
				data_line_o <= 8'hFF;
				state = 0;
			end
		end
	end
	
endmodule
