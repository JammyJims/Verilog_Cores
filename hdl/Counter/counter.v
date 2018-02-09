`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Adelaide
// Engineer: Jimmy Tang
// 
// Create Date:    11:26:07 11/30/2017 
// Design Name: project0 counter
// Module Name:    counter 
// Project Name: 
// Target Devices: XC6LX16-CS324
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
module counter(
    input clk,
    input BTND,
    output [3:0]Led
);
	reg [3:0]Led;
   reg  [31:0]count_int;
   always @(posedge clk)begin
      if (BTND)begin
         count_int <= count_int + 1'd1;
      end else begin
			count_int <= count_int - 1'd1;
		end
	end
	always @ (posedge clk)begin
		Led[3:0] <= count_int[31:28];
	end
	
endmodule
