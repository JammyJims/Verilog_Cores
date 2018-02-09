`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:49 12/08/2017 
// Design Name: 
// Module Name:    LFSR_TOP 
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
`ifndef _LFSR_
`define _LFSR_
module LFSR_TOP(
	input clk,
	output reg [7:0] out_reg,
	output reg [7:0] Led
	);
	
	// feedback logic
	wire A = out_reg[7];
	wire B = out_reg[5];
	wire C = out_reg[4];
	wire D = out_reg[3];
	wire feedback = A^B^C^D;
	integer index;
	
	// initialisation
	wire [31:0]clk_div;
	initial begin
		out_reg = 8'b10101010;
		Led = out_reg;
		index = 0;
	end
	
	// instantiate a clock divider
	Clock_Divider alt_clk(
		.clk,
		.clk_div (clk_div)
	);
	
	// feedback and shift
	always @(posedge clk_div[27]) begin
		out_reg[0] = feedback;
		out_reg[7:1] = out_reg[6:0];
		Led[7:0] = out_reg[7:0];
	end
endmodule
`endif //_LFSR_