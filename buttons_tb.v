//buttons_tb
`include "buttons.v"
module buttons_tb;

	parameter BUTTONS_WIDTH = 8;
	reg clk;
	reg reset;
	reg [BUTTONS_WIDTH-1:0] btn_num_in; 
	reg [BUTTONS_WIDTH-1:0] btn_up_out; 
	reg [BUTTONS_WIDTH-1:0] btn_down_out;
	wire [BUTTONS_WIDTH-1:0] active_in_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_up_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_down_levels;

 buttons buttons_inst(
		.clk(clk),
		.reset(reset),
		.btn_num_in(btn_num_in),
		.btn_up_out(btn_up_out),
		.btn_down_out(btn_down_out),
		.active_in_levels(active_in_levels),
		.active_out_up_levels(active_out_up_levels),
		.active_out_down_levels(active_out_down_levels)
		);   

always
	begin
		#10 clk=!clk;
	end	
		
initial
	begin
	$dumpfile("buttons_tb.vcd");
	$dumpvars(0,clk,reset,btn_num_in,btn_up_out,btn_down_out,active_in_levels,active_out_up_levels,active_out_down_levels);
	clk = 1'b0;
	btn_num_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	#5 reset = 0;
	#5 reset = 1;
	#20 btn_up_out[4] = 1;	
	#10 btn_up_out[5] = 1;
	#10 btn_num_in[1] = 1;
	#10 btn_down_out[7] = 1;
	#10 btn_num_in[3] = 0;
	#10 btn_down_out[7] = 0;
		btn_up_out[5] = 0;
	#10 btn_up_out[4] = 0;
		btn_down_out[7] = 1;
		btn_num_in[1] = 0;
	#10 btn_num_in[2] = 1;
	#10 btn_down_out[7] = 0;
		btn_num_in[2] = 0;
	#10 reset = 0;
	#10 reset = 1;
	#10 btn_down_out[6] = 1;
		btn_up_out[5] = 1;
	#10 btn_up_out[2] = 1;
		btn_down_out[1] = 1;

	
	#50 $finish;
	end	

endmodule 
//buttons_tb