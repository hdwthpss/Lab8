`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:57:22 08/18/2015 
// Design Name: 
// Module Name:    rst 
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
module rst(d,clk,rst_n,rst_q
    );
	input d;
	input clk;
	input rst_n;
	reg [1:0] q;
	output rst_q;
	reg rst_q;
	reg [1:0] temp_q;
	reg temp_rst_q;
	
	
	always@(*)
			begin
				temp_q[0]=d;
				temp_q[1]=q[0];
				temp_rst_q=(temp_q[0] & temp_q[1]);
			end
	
	always@(posedge clk or negedge rst_n)
		if(~rst_n)
			q=2'b00;
		else
			begin
				q[0]=temp_q[0];
				q[1]=temp_q[1];
				rst_q=~temp_rst_q;
			end
	

	

endmodule
