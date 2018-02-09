`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:27 12/12/2017 
// Design Name: 
// Module Name:    Clock_Divider 
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
`ifndef _CLOCK_DIVIDER_
`define _CLOCK_DIVIDER_
module Clock_Divider(
	input clk,
	output reg [31:0]clk_div
	);
	initial begin
		clk_div[31:0] = 0;
		clk_div[0] = clk;
	end
	always @* clk_div[0] = clk;
	genvar index;
	generate
		for (index=0; index<30; index=index+1) begin //: for_divide
			always @(posedge clk_div[index]) begin
				clk_div[index+1] = ~clk_div[index+1];
			end
		end
	endgenerate
endmodule 
`endif //_CLOCK_DIVIDER_