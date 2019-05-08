//buttons_res_tb
`include "buttons_res.v"
module buttons_res_tb;

	parameter BUTTONS_WIDTH = 8;
	reg 						clk;
	reg 						reset;
	reg 	[BUTTONS_WIDTH-1:0] btn_in; 
	reg 	[BUTTONS_WIDTH-2:0] btn_up_out; 
	reg 	[BUTTONS_WIDTH-1:1] btn_down_out;
	reg 	[BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg 	[BUTTONS_WIDTH-2:0] inactivate_out_up_levels;
	reg 	[BUTTONS_WIDTH-1:1] inactivate_out_down_levels;
	wire	[BUTTONS_WIDTH-1:0] active_in_levels;
	wire	[BUTTONS_WIDTH-2:0] active_out_up_levels;
	wire	[BUTTONS_WIDTH-1:1] active_out_down_levels;

/*
testy 
1 - kasowanie on/off
2 - kasowanie rejestrami
*/

 buttons_res buttons_inst(
		.clk(clk),
		.reset(reset),
		.btn_in(btn_in),
		.btn_up_out(btn_up_out),
		.btn_down_out(btn_down_out),
		.inactivate_in_levels(inactivate_in_levels),
		.inactivate_out_up_levels(inactivate_out_up_levels),
		.inactivate_out_down_levels(inactivate_out_down_levels),
		.active_in_levels(active_in_levels),
		.active_out_up_levels(active_out_up_levels),
		.active_out_down_levels(active_out_down_levels)
		);   
always
	begin
		#5 clk=!clk;
	end	
			
initial
	begin
	$dumpfile("buttons_tb.vcd");
	$dumpvars(0,clk,reset,btn_in,inactivate_in_levels,active_in_levels,btn_up_out,active_out_up_levels,inactivate_out_up_levels,btn_down_out,active_out_down_levels,inactivate_out_down_levels);
	clk 		= 0;
	btn_in 		= 0;
	btn_up_out 	= 0;
	btn_down_out = 0;
	inactivate_in_levels = 0;
	inactivate_out_up_levels 	= 0;
	inactivate_out_down_levels 	= 0;
	#10 reset 					= 0;
	#10 reset 					= 1;
	$display("First test started");
	#10 btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
	#10 btn_in[7]				= 0;
		btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
	#10 btn_in[7]				= 0;
		btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
	#10 btn_in[7]				= 0;
		btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
	#10 btn_in[7]				= 0;		
	$display("First test finished");
	#10 reset 					= 0;
	#10 reset 					= 1;
	$display("Second test started");	
	#10 btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
		inactivate_in_levels [0] = 1;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
		inactivate_in_levels [0] = 0;
		inactivate_in_levels [1] = 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
		inactivate_in_levels [1] = 0;
		inactivate_in_levels [2] = 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
		inactivate_in_levels [2] = 0;
		inactivate_in_levels [3] = 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
		inactivate_in_levels [3] = 0;
		inactivate_in_levels [4] = 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
		inactivate_in_levels [4] = 0;
		inactivate_in_levels [5] = 1;
	#10 btn_in[7]				= 0;
		btn_in[0]				= 1;
		inactivate_in_levels [5] = 0;
		inactivate_in_levels [6] = 1;
	#10 btn_in[0]				= 0;
		btn_in[1]				= 1;
		inactivate_in_levels [6] = 0;
		inactivate_in_levels [7] = 1;
	#10 btn_in[1]				= 0;
		btn_in[2]				= 1;
		inactivate_in_levels [7] = 0;
	#10 btn_in[2]				= 0;
		btn_in[3]				= 1;
	#10 btn_in[3]				= 0;
		btn_in[4]				= 1;
	#10 btn_in[4]				= 0;
		btn_in[5]				= 1;
	#10 btn_in[5]				= 0;
		btn_in[6]				= 1;
	#10 btn_in[6]				= 0;
		btn_in[7]				= 1;
	#10 btn_in[7]				= 0;
		btn_in[0]				= 1;
	#10 btn_in[0]				= 0;
	$display("Second test finished");
	#10 reset 					= 0;
	#10 reset 					= 1;
	$display("Third test started");
	#10 btn_up_out[0]					= 1;
	#10 btn_up_out[0]			 		= 0;
		btn_up_out[1]			 		= 1;
	#10 btn_up_out[1]			 		= 0;
		btn_up_out[2]			 		= 1;
		inactivate_out_up_levels [0]	= 1;
	#10 btn_up_out[2]		 			= 0;	
		btn_up_out[3]					= 1;	
		inactivate_out_up_levels [0]	= 0;
		inactivate_out_up_levels [1]	= 1;
	#10 btn_up_out[3]					= 0;	
		btn_up_out[4]					= 1;	
		inactivate_out_up_levels [1]	= 0;
		inactivate_out_up_levels [2]	= 1;
	#10 btn_up_out[4]					= 0;	
		btn_up_out[5]					= 1;	
		inactivate_out_up_levels [2]	= 0;
		inactivate_out_up_levels [3]	= 1;
	#10 btn_up_out[5]					= 0;	
		btn_up_out[6]					= 1;	
		inactivate_out_up_levels [3]	= 0;
		inactivate_out_up_levels [4]	= 1;
	#10 btn_up_out[6]					= 0;	
		btn_up_out[0]					= 1;	
		inactivate_out_up_levels [4]	= 0;
		inactivate_out_up_levels [5]	= 1;
	#10 btn_up_out[0]					= 0;	
		btn_up_out[1]					= 1;	
		inactivate_out_up_levels [5]	= 0;
		inactivate_out_up_levels [6]	= 1;
	#10 btn_up_out[1]					= 0;	
		btn_up_out[2]					= 1;	
		inactivate_out_up_levels [6]	= 0;
	#10 btn_up_out[2]					= 0;
		btn_up_out[3]					= 1;
	#10 btn_up_out[3]					= 0;
		btn_up_out[4]					= 1;
	#10 btn_up_out[4]					= 0;
		btn_up_out[5]					= 1;
	#10 btn_up_out[5]					= 0;
		btn_up_out[6]					= 1;
	#10 btn_up_out[6]					= 0;
		inactivate_out_up_levels [0] 	= 1;
	#10 inactivate_out_up_levels [0] 	= 0;
		inactivate_out_up_levels [1] 	= 1;
	#10 inactivate_out_up_levels [1] 	= 0;
		inactivate_out_up_levels [2] 	= 1;	
	#10 inactivate_out_up_levels [2] 	= 0;
		inactivate_out_up_levels [3] 	= 1;
	#10 inactivate_out_up_levels [3] 	= 0;
		inactivate_out_up_levels [4] 	= 1;
	#10 inactivate_out_up_levels [4] 	= 0;
		inactivate_out_up_levels [5] 	= 1;	
	#10 inactivate_out_up_levels [5] 	= 0;
		inactivate_out_up_levels [6] 	= 1;
	#10 inactivate_out_up_levels [6] 	= 0;
	$display("Third test finished");
	#10 reset 					= 0;
	#10 reset 					= 1;
	$display("Fourth test started");
	#10 btn_down_out[1]					= 1;
	#10 btn_down_out[1]					= 0;
		btn_down_out[2]					= 1;
	#10 btn_down_out[2]					= 0;
		btn_down_out[3]					= 1;
		inactivate_out_down_levels [1] 	= 1;
	#10 btn_down_out[3]		 			= 0;
		btn_down_out[4]					= 1;
		inactivate_out_down_levels [1]	= 0;
		inactivate_out_down_levels [2]	= 1;
	#10 btn_down_out[4]					= 0;
		btn_down_out[5]					= 1;
		inactivate_out_down_levels [2]	= 0;
		inactivate_out_down_levels [3]	= 1;
	#10 btn_down_out[5]					= 0;
		btn_down_out[6]					= 1;
		inactivate_out_down_levels [3] 	= 0;
		inactivate_out_down_levels [4] 	= 1;
	#10 btn_down_out[6]					= 0;
		btn_down_out[7]					= 1;
		inactivate_out_down_levels [4] 	= 0;
		inactivate_out_down_levels [5] 	= 1;
	#10 btn_down_out[7]					= 0;
		btn_down_out[1]					= 1;
		inactivate_out_down_levels [5] 	= 0;
		inactivate_out_down_levels [6] 	= 1;
	#10 btn_down_out[1]					= 0;
		btn_down_out[2]					= 1;
		inactivate_out_down_levels [6] 	= 0;
		inactivate_out_down_levels [7] 	= 1;
	#10 btn_down_out[2]					= 0;
		btn_down_out[3]					= 1;
		inactivate_out_down_levels [7] 	= 0;
	#10 btn_down_out[3]					= 0;
		btn_down_out[4]					= 1;
	#10 btn_down_out[4]					= 0;
		btn_down_out[5]					= 1;
	#10 btn_down_out[5]					= 0;
		btn_down_out[6]					= 1;
	#10 btn_down_out[6]					= 0;
		btn_down_out[7]					= 1;
	#10 btn_down_out[7]					= 0;
		inactivate_out_down_levels [1] 	= 1;
	#10 inactivate_out_down_levels [1] 	= 0;
		inactivate_out_down_levels [2] 	= 1;
	#10 inactivate_out_down_levels [2] 	= 0;
		inactivate_out_down_levels [3] 	= 1;	
	#10 inactivate_out_down_levels [3] 	= 0;
		inactivate_out_down_levels [4] 	= 1;
	#10 inactivate_out_down_levels [4] 	= 0;
		inactivate_out_down_levels [5] 	= 1;
	#10 inactivate_out_down_levels [5] 	= 0;
		inactivate_out_down_levels [6] 	= 1;	
	#10 inactivate_out_down_levels [6] 	= 0;
		inactivate_out_down_levels [7] 	= 1;
	#10 inactivate_out_down_levels [7] 	= 0;
	$display("Fourth test finished");
	#10 $finish;
	end	

endmodule 
//buttons_tb