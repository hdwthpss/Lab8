`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:01 09/02/2015 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(clk,rst_n,button_start_pause,display,wh_light,button_lap_rst
    );
	 
	input clk,rst_n;
	input button_start_pause;
	input button_lap_rst;
	output [14:0] display;
	output [3:0] wh_light;
 
	wire clk_out;
	wire [1:0] clk_ctl;
	wire [6:0] cnt_h;
	wire [3:0] value_0,value_1,value_2,value_3;
	wire [3:0] lap_0,lap_1,lap_2,lap_3;
	wire [3:0] real_0,real_1,real_2,real_3;
   wire [3:0] bcd;
	
	wire [4:0] in0,in1,in2,in3;
	
	wire debounce_start_out;
	wire one_pulse_start_out;
	wire state_start_out;
	
	wire debounce_lap_out;
	wire one_pulse_lap_out;
	wire state_lap;
	
	

	wire rst_q;
	
	rst rs(
	.d(debounce_lap_out),
	.clk(clk_out),
	.rst_n(rst_n),
	.rst_q(rst_q)
	);
	
	
	state_value stv(
	.value_0(value_0),
	.value_1(value_1),
	.value_2(value_2),
	.value_3(value_3),
	.lap_0(lap_0),
	.lap_1(lap_1),
	.lap_2(lap_2),
	.lap_3(lap_3),
	.real_0(real_0),
	.real_1(real_1),
	.real_2(real_2),
	.real_3(real_3),
	.state_start(state_start_out),
	.state_lap(state_lap),
	.clk(clk),
	.rst_n(rst_q)
	);
	
	lap_function la(
	.lap(one_pulse_lap_out),///
	.state_start(state_start_out),
	.value_0(value_0),
	.value_1(value_1),
	.value_2(value_2),
	.value_3(value_3),
	.clk(clk),
	.rst_n(rst_q),
	.lap_0(lap_0),
	.lap_1(lap_1),
	.lap_2(lap_2),
	.lap_3(lap_3)
	);
	
	state_lap stl(
	.button(one_pulse_lap_out),
	.button_out(state_lap),
	.state_start(state_start_out),
	.clk(clk),
	.rst_n(rst_q)
	);
	
	state_start_pause st(
	.button(one_pulse_start_out),
	.button_out(state_start_out),
	.clk(clk),
	.rst_n(rst_q)
	);
	
	one_pulse o(
	.clk(clk),
	.rst_n(rst_n),
	.debounce_in(debounce_start_out),
	.one_pulse_out(one_pulse_start_out),
	.debounce_lap_in(debounce_lap_out),
	.one_pulse_lap_out(one_pulse_lap_out)
	);
	
	debounce de(
	.clk(cnt_h[0]),
	.rst_n(rst_n),
	.debounce_start_in(button_start_pause),
	.debounce_start_out(debounce_start_out),
	.debounce_lap_in(button_lap_rst),
	.debounce_lap_out(debounce_lap_out)
	);
	 
	scan s(
	.freq_ctl(clk_ctl),
	.in0(real_0),
	.in1(real_1),
	.in2(real_2),
	.in3(real_3),
	.wh_light(wh_light),
	.light_num(bcd)
	);
	 
	freq_div f(
	.clk(clk),
	.rst_n(rst_n),
	.clk_ctl(clk_ctl),
	.clk_out(clk_out),
	.cnt_h(cnt_h)
	);
	 
	 
   bcd_seg b(
	.bcd(bcd),
	.display(display)
	);
	 
	 
	digit d(
	.start(state_start_out),
	.value_0(value_0),
	.value_1(value_1),
	.value_2(value_2),
	.value_3(value_3),
	.clk(clk_out),
	.rst_n(rst_q)
	);

endmodule
