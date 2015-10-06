`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:22 09/02/2015 
// Design Name: 
// Module Name:    state_start_pause 
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
module state_start_pause(button,button_out,clk,rst_n
    );
	input button;
	input clk,rst_n;
	output button_out;
	reg button_out;
	reg state;
	reg temp_state;
	reg temp;
	
	always@(*)
		if(button==1'b1)
			case(state)
				1'b0 :
					begin
						temp=1'b1;
						temp_state=1'b1;
					end
				1'b1 :
					begin
						temp=1'b0;
						temp_state=1'b0;
					end
			endcase
		else
			begin
				temp=button_out;
				temp_state=state;
			end
	
	always@(posedge clk or negedge rst_n)
		if(~rst_n)
			begin
				button_out<=1'b0;
				state<=1'b0;
			end
		else
			begin
				button_out<=temp;
				state<=temp_state;
			end
	

endmodule
