`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:32:43 09/02/2015 
// Design Name: 
// Module Name:    lap_function 
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
module lap_function(lap,value_0,value_1,value_2,value_3,lap_0,lap_1,lap_2,lap_3,clk,rst_n,state_start
    );
	input lap;
	input state_start;
	input clk,rst_n;
	input [3:0] value_0,value_1,value_2,value_3;
	output [3:0] lap_0,lap_1,lap_2,lap_3;
	reg [3:0] lap_0,lap_1,lap_2,lap_3;
	reg [3:0] temp_value_0,temp_value_1,temp_value_2,temp_value_3;


	always@(*)
		if(lap==1'b1 && state_start==1'b1)
			begin
				temp_value_0=value_0;
				temp_value_1=value_1;
				temp_value_2=value_2;
				temp_value_3=value_3;
			end
		else
			begin
				temp_value_0=lap_0;
				temp_value_1=lap_1;
				temp_value_2=lap_2;
				temp_value_3=lap_3;
			end
	
	always@(posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				lap_0<=4'b0000;
				lap_1<=4'b0000;
				lap_2<=4'b0000;
				lap_3<=4'b0000;
			end
		else
			begin
				lap_0<=temp_value_0;
				lap_1<=temp_value_1;
				lap_2<=temp_value_2;
				lap_3<=temp_value_3;
			end
	
endmodule
