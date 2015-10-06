`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:19 09/02/2015 
// Design Name: 
// Module Name:    digit 
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
module digit(clk,rst_n,value_0,value_1,value_2,value_3,start
    );
	input clk,rst_n;
	input start;
	output [3:0] value_0,value_1,value_2,value_3;
	
	reg count;
	
	wire cout_0,cout_1,cout_2,cout_3;
	
	
	always@(*)
		if(start==1'b1)
			count=1'b1;
		else
			count=1'b0;
	
	
	
	upcounter_dig0 d0(
	.value(value_0),
	.increase(count),
	.clk(clk),
	.rst_n(rst_n),
	.carry(cout_0)
	);
	
	upcounter_dig1 d1(
	.value(value_1),
	.increase(cout_0),
	.clk(clk),
	.rst_n(rst_n),
	.carry(cout_1)
	);
	
	upcounter_dig2 d2(
	.value(value_2),
	.increase(cout_1),
	.clk(clk),
	.rst_n(rst_n),
	.carry(cout_2)
	);
	
	upcounter_dig3 d3(
	.value(value_3),
	.increase(cout_2),
	.clk(clk),
	.rst_n(rst_n),
	.carry(cout_3)
	);

endmodule
