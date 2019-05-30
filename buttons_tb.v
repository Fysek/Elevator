//buttons_tb
`include "buttons.v"
module buttons_tb;

	parameter BUTTONS_WIDTH = 8;
	reg 						an_reset;
	reg 						buttons_block;
	reg 	[BUTTONS_WIDTH-1:0] btn_in; 
	reg 	[BUTTONS_WIDTH-1:0] btn_up_out; 
	reg 	[BUTTONS_WIDTH-1:0] btn_down_out;
	reg 	[BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg 	[BUTTONS_WIDTH-2:0] inactivate_out_up_levels;
	reg 	[BUTTONS_WIDTH-1:1] inactivate_out_down_levels;
	wire	[BUTTONS_WIDTH-1:0] active_in_levels;
	wire	[BUTTONS_WIDTH-2:0] active_out_up_levels;
	wire	[BUTTONS_WIDTH-1:1] active_out_down_levels;

 buttons buttons_inst(
		.an_reset(an_reset),
		.buttons_block(buttons_block),
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

initial
	begin
	$dumpfile("buttons_tb.vcd");
	$dumpvars(0,an_reset,btn_in,btn_up_out,btn_down_out,inactivate_in_levels,inactivate_out_up_levels,inactivate_out_down_levels,active_in_levels,active_out_up_levels,active_out_down_levels);
	btn_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	inactivate_in_levels = 0;
	inactivate_out_up_levels = 0;
	inactivate_out_down_levels 	=0;
	buttons_block 				=0;
	#5 an_reset = 0;
	#5 an_reset = 1;
	#10 btn_in[0]		= 1;
		btn_in[1]		= 1;
		btn_in[2]		= 1;
		btn_in[3]		= 1;
		btn_in[4]		= 1;
		btn_in[7]		= 1;    
		btn_up_out[0] 	= 1; 
		btn_up_out[1] 	= 1; 
		btn_up_out[2] 	= 1; 
		btn_up_out[4] 	= 1;
		btn_down_out[0] = 1;
		btn_down_out[1] = 1;
		btn_down_out[5] = 1;
		btn_down_out[6] = 1;
	#10 btn_in[0]		= 0; 
        btn_in[1]		= 0;
        btn_in[2]		= 0;
	    btn_in[3]		= 0;
        btn_in[4]		= 0;
		btn_in[5]		= 1;
	    btn_in[7]		= 0;
		btn_up_out[0]	= 0;
		btn_up_out[1]	= 0;
		btn_up_out[2]	= 0;
		btn_up_out[3]	= 1;
		btn_up_out[4]	= 0;
		btn_up_out[5]	= 1;
		btn_down_out[0] = 0;
		btn_down_out[1] = 0;
		btn_down_out[2] = 1;
		btn_down_out[3] = 1;
		btn_down_out[5] = 0;
		btn_down_out[6] = 0;
	#10 btn_in[5]		= 0;
		btn_up_out[3]	= 0;
		btn_up_out[5]	= 0;
		btn_down_out[2] = 0;
		btn_down_out[3] = 0;
		////////////////////////////////////
	#60	inactivate_in_levels[2] 		= 1;
		inactivate_in_levels[3] 		= 1;
		inactivate_out_up_levels[0] 	= 1;
		inactivate_out_up_levels[4] 	= 1;
        inactivate_out_down_levels[3] 	= 1;
        inactivate_out_down_levels[5] 	= 1;		
	#10 inactivate_in_levels[2] 		= 0;
	    inactivate_in_levels[3] 		= 0;
	    inactivate_out_up_levels[0] 	= 0;
	    inactivate_out_up_levels[4] 	= 0;
	    inactivate_out_down_levels[3] 	= 0;
	    inactivate_out_down_levels[5] 	= 0;
		////////////////////////////////////		
	#40 btn_in[1]		= 1;
	    btn_in[2]		= 1;
	    btn_in[3]		= 1;
	    btn_in[4]		= 1;
		btn_up_out[0]	= 1;
	    btn_up_out[4]	= 1;
	    btn_up_out[5]	= 1;
	    btn_down_out[3] = 1;
	    btn_down_out[6] = 1;
	#20	btn_in[1]		= 0;
	    btn_in[2]		= 0;
	    btn_in[3]		= 0;
	    btn_in[4]		= 0;
	    btn_up_out[0]	= 0;
	    btn_up_out[4]	= 0;
	    btn_up_out[5]	= 0;
	    btn_down_out[3] = 0;
	    btn_down_out[6] = 0;
		////////////////////
	#60 an_reset 			= 0;
	#10 an_reset 			= 1;
		////////////////////
	#40	btn_in[2]		= 1;
		btn_in[3]		= 1;
		btn_in[6]		= 1;
		btn_up_out[0] 	= 1;
		btn_up_out[2] 	= 1;
		btn_down_out[0] = 1;
		btn_down_out[1] = 1;
	#40	btn_in[2]		= 0;
		btn_in[3]		= 0;
		btn_in[6]		= 0;
		btn_up_out[0] 	= 0;
		btn_up_out[2] 	= 0;
		btn_down_out[0] = 0;
		btn_down_out[1] = 0;
	#60 $finish;
	end	

endmodule 
//buttons_tb