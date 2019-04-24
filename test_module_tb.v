//buttons_tb
`include "test_module.v"
module test_module;

	parameter BUTTONS_WIDTH = 8 ;
	parameter DELAY_ENGINE	= 10;
	parameter DELAY_DOOR 	= 10;
	reg 			clk			;
	reg 			reset		;
	reg 	[1:0] 	engine		;
	reg 	[1:0] 	door	    ;
	wire	[1:0]  	sensor_door ;
	wire	 		sensor_up	;
	wire  			sensor_down ;
	

 test_module test_module_inst(
		.clk		(clk		),
		.reset		(reset		),
		.engine		(engine		),
		.door	    (door	    ),
		.sensor_door(sensor_door),
		.sensor_up	(sensor_up	),
		.sensor_down(sensor_down)
		);   

	always
	begin
		#5 clk=!clk;
	end		
			
initial
	begin
	$dumpfile("test_module_tb.vcd");
	$dumpvars(0,clk,reset,engine,door,sensor_door,sensor_up,sensor_down);
	clk = 0;
	
	#5 reset 	= 0;
	#5 reset 	= 1;
	#10 engine	= 1;
	#60 engine	= 0;
	#120 engine	= 1;
       
       
	   
       
		
	   
		
		
		
		
		
		
		
		
		
		
		
		
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
	#60 reset 			= 0;
	#10 reset 			= 1;
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