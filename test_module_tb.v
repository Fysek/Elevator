//buttons_tb
`include "test_module.v"
module test_module_tb;

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
	door = 0;
	engine = 0;
	#5 reset 	= 0;
	#5 reset 	= 1;
	#10 engine	= 1;
	#60 engine	= 0;
	#120 engine	= 1;
	#200 door	= 1;
	#200 $finish;
	end	

endmodule 
//buttons_tb