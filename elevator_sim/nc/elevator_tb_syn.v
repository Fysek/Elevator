/*
Testy dla parametrow:
parameter BUTTONS_WIDTH = 8, 
parameter DELAY_IDLE = 5000, 
parameter DELAY_WAIT = 500,  
parameter DELAY_OPEN = 6000  
*/
`include "elevator_syn.v"
`include "test_module.v"

module elevator_tb_syn;
 //inputs
 parameter BUTTONS_WIDTH = 8;
 reg clock;
 reg reset;
 reg open_btn;
 reg close_btn;
 reg overload;
 reg bell;
 reg sensor_inside;
 reg [BUTTONS_WIDTH-1:0] btn_in; // wewnatrz windy
 reg [BUTTONS_WIDTH-2:0] btn_up_out; //na zewnatrz do gory
 reg [BUTTONS_WIDTH-1:1] btn_down_out;
 wire sensor_up;
 wire sensor_down;
 wire [1:0] sensor_door;
 //outputs
 wire [1:0] engine;
 wire [1:0] door;
 wire 		direction;
 wire 		bell_out;
 wire [2:0] level_display;	
 
 reg waits; //only for testing
 

elevator elevator_inst( 
		.clock(clock),
		.reset(reset),
		.open_btn(open_btn),
		.close_btn(close_btn),
		.overload(overload),
		.bell(bell),
		.sensor_up(sensor_up),
		.sensor_down(sensor_down),
		.sensor_inside(sensor_inside),
		.sensor_door(sensor_door),
		.btn_in(btn_in),
		.btn_up_out(btn_up_out),
		.btn_down_out(btn_down_out),
		.engine(engine),
		.door(door),
		.direction(direction),
		.bell_out(bell_out),
		.level_display(level_display)
		);
		
test_module test_module_inst(	
		.clock			(clock			),
		.reset			(reset			),
		.engine			(engine			),
		.door			(door			),
		.sensor_door 	(sensor_door 	),
		.sensor_up		(sensor_up		),
		.sensor_down 	(sensor_down 	)
		); 		
		
always
	begin
		#1 clock=!clock;
	end	
		
initial
	begin
		$dumpfile("elevator_tb.vcd");
	  	$dumpvars(0,clock,reset,open_btn,btn_in,btn_up_out,btn_down_out,engine,door,level_display);
		//$monitor($time,": clock=%b reset=%b open_btn=%b close_btn=%b btn_in=%d btn_up_out=%d btn_down_out=%d | engine_up=%b engine_down=%b open_door=%b close_door=%b level_display=%b"
		//,clock,reset,open_btn,close_btn,btn_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,close_door,level_display);
	
	clock = 1'b0;
	open_btn = 0;
	close_btn = 0;
	btn_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	overload = 0;  
	sensor_inside = 0;
	bell = 0;
	/*test 1. reset test full floor*/
	#5 reset = 0;
	#95 reset = 1;
	#200  btn_in[6] = 1;
	#10  btn_in[6] = 0;
	#10000 waits = 0;//wait
	#10000 waits = 0;//wait
	#4000 waits = 0;//wait
	#20 reset = 0;
	#500   reset = 1;
	#500 waits = 0;//wait
	/*test 2. reset test half floor*/
	#5 reset = 0;
	#95 reset = 1;
	#200  btn_in[0] = 1;
	#10  btn_in[0] = 0;	 
	#10000 waits = 0;//wait
	#10000 waits = 0;//wait
	#3000 waits = 0;//wait
	#900 reset = 0;
	#200   reset = 1;
	#700 waits = 0;//wait
	/* test 3. btn_in test */ 
	#5 reset = 0;
	#95 reset = 1; 
	#200 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	
	#200 btn_in[1] = 1;	
	#10  btn_in[1] = 0;	
	#15000 waits = 0;//wait	
	#10000 waits = 0;//wait	
	#600 btn_in[2] = 1;	
		 btn_in[1] = 1;	
	#10  btn_in[2] = 0;
		 btn_in[1] = 0;	
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait	
	#600 btn_in[3] = 1;	
		 btn_in[2] = 1;
	#10  btn_in[3] = 0;	
		 btn_in[2] = 0;	
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait	
	#700 btn_in[4] = 1;
		 btn_in[3] = 1;
	#10  btn_in[4] = 0;
		 btn_in[3] = 0;	
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait	
	#700 btn_in[5] = 1;
		 btn_in[4] = 1;
	#10  btn_in[5] = 0;	
		 btn_in[4] = 0;	
	#15000 waits = 0;//wait	
	#8000 waits = 0;//wait	
	#700 btn_in[6] = 1;	
		 btn_in[5] = 1;
	#10  btn_in[6] = 0;	
		 btn_in[5] = 0;
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait		 
	#700 btn_in[7] = 1;	
		btn_in[6] = 1;	
	#10  btn_in[7] = 0;
		 btn_in[6] = 0;	
	#50000 waits = 0;//wait	
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait
	/* test 4. all btn_in at once*/ 
	#5 reset = 0;
	#95 reset = 1;
	#200 btn_in[0] = 1;
		 btn_in[1] = 1;		
		 btn_in[2] = 1;		
		 btn_in[3] = 1;		
		 btn_in[4] = 1;		
		 btn_in[5] = 1;		
		 btn_in[6] = 1;	
		 btn_in[7] = 1;			 
	#10  btn_in[0] = 0;	
		 btn_in[1] = 0;	
		 btn_in[2] = 0;	
		 btn_in[3] = 0;	
		 btn_in[4] = 0;	
		 btn_in[5] = 0;	
		 btn_in[6] = 0;	
		 btn_in[7] = 0;	
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait
	#50000  waits = 0;//wait		  
	/* test 5. btn_up_out test*/ 
	#5 reset = 0;
	#95 reset = 1;	
	#200 btn_up_out[0] = 1;	
	#10  btn_up_out[0] = 0;	
	#200 btn_up_out[1] = 1;	
	#10  btn_up_out[1] = 0;
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait	
	#600 btn_up_out[2] = 1;	
		 btn_up_out[1] = 1;	
	#10  btn_up_out[2] = 0;
		 btn_up_out[1] = 0;
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait	
	#600 btn_up_out[3] = 1;	
		 btn_up_out[2] = 1;
	#10  btn_up_out[3] = 0;	
		 btn_up_out[2] = 0;
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait		 
	#700 btn_up_out[4] = 1;
		 btn_up_out[3] = 1;
	#10  btn_up_out[4] = 0;
		 btn_up_out[3] = 0;
	#15000 waits = 0;//wait	
	#9000 waits = 0;//wait		 
	#700 btn_up_out[5] = 1;
		 btn_up_out[4] = 1;
	#10  btn_up_out[5] = 0;	
		 btn_up_out[4] = 0;	
	#15000 waits = 0;//wait	
	#8000 waits = 0;//wait		  
	#700 btn_up_out[6] = 1;	
		 btn_up_out[5] = 1;
	#10  btn_up_out[6] = 0;	
		 btn_up_out[5] = 0;	
	#100 btn_up_out[6] = 1;	
	#10  btn_up_out[6] = 0;	
	/*postcondition: go to floor 0*/	 
	#50000  waits = 0;//wait	
	#100   btn_in[0] = 1;
	#10	   btn_in[0] = 0;
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait
	#30000  waits = 0;//wait
	/* test 6. all btn_up_out at once*/ 
	#5   reset = 0;
	#95  reset = 1;	   
	#200 waits = 0;//wait
	#200 btn_up_out[0] = 1;
		 btn_up_out[1] = 1;		
		 btn_up_out[2] = 1;		
		 btn_up_out[3] = 1;		
		 btn_up_out[4] = 1;		
		 btn_up_out[5] = 1;		
		 btn_up_out[6] = 1;					 
	#10  btn_up_out[0] = 0;	
		 btn_up_out[1] = 0;	
		 btn_up_out[2] = 0;	
		 btn_up_out[3] = 0;	
		 btn_up_out[4] = 0;	
		 btn_up_out[5] = 0;	
		 btn_up_out[6] = 0;			 
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#45000  waits = 0;//wait   
	/* test 7. btn_down_out test*/ 
	#5 reset = 0;
	#95 reset = 1;		
	#200 btn_down_out[1] = 1;	
	#10  btn_down_out[1] = 0;
	#15000 waits = 0;//wait	
	#7000 waits = 0;//wait		
	#400 btn_down_out[2] = 1;		 	
	#10  btn_down_out[2] = 0;	
	#100 btn_down_out[3] = 1;		
	#10  btn_down_out[3] = 0;		
	#100 btn_down_out[4] = 1;
	#10  btn_down_out[4] = 0;	
	#100 btn_down_out[5] = 1;
	#10  btn_down_out[5] = 0;		
	#100 btn_down_out[6] = 1;	
	#10  btn_down_out[6] = 0;		
	#100 btn_down_out[7] = 1;	 	
	#10  btn_down_out[7] = 0;		 
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#10000  waits = 0;//wait
	/* test 8. all btn_down_out at once*/ 
	#5 reset = 0;
	#95 reset = 1;	   
	#200 waits = 0;//wait
	#200 btn_down_out[1] = 1;		
		 btn_down_out[2] = 1;		
		 btn_down_out[3] = 1;		
		 btn_down_out[4] = 1;		
		 btn_down_out[5] = 1;		
		 btn_down_out[6] = 1;	
		 btn_down_out[7] = 1;			 
	#10  btn_down_out[1] = 0;	
		 btn_down_out[2] = 0;	
		 btn_down_out[3] = 0;	
		 btn_down_out[4] = 0;	
		 btn_down_out[5] = 0;	
		 btn_down_out[6] = 0;	
		 btn_down_out[7] = 0;	
	#50000  waits = 0;//wait	
	#50000  waits = 0;//wait	  
	#50000  waits = 0;//wait	
	#30000  waits = 0;//wait
	/* test 9. start-up-in-down-in*/ 
	#5 reset = 0;
	#95 reset = 1;	   
	#200 waits = 0;//wait
	#200 btn_up_out[3] = 1;					 
	#10  btn_up_out[3] = 0;	
	#20000  waits = 0;//wait
	#1200 btn_in[6] = 1;	
	#10  btn_in[6] = 0;	
	#800 btn_down_out[4] = 1;	
	#10  btn_down_out[4] = 0;	
	#20000  waits = 0;//wait
	#20000  waits = 0;//wait
	#600 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	
	#50000  waits = 0;//wait
	/* test 10. start-down-in-up-in(same dir)-in(other dir)*/ 
	#5 reset = 0;
	#95 reset = 1;	   
	#200 waits = 0;//wait
	#200 btn_down_out[5] = 1;					 
	#10  btn_down_out[5] = 0;
	#40000  waits = 0;//wait
	#1200 btn_in[2] = 1;	
	#10  btn_in[2] = 0;	 
	#20000  waits = 0;//wait
	#800 btn_up_out[4] = 1;	
	#10  btn_up_out[4] = 0;	 
	#20000  waits = 0;//wait
	#900 btn_in[6] = 1;	
	 	 btn_in[0] = 1;
	#10  btn_in[6] = 0;
		 btn_in[0] = 0;
	#50000  waits = 0;//wait
	#20000  waits = 0;//wait
	/* test 11. start-up-in-down-in(same dir)-in(other dir)*/ 
	#5 reset = 0;
	#95 reset = 1;	   
	#200 waits = 0;//wait
	#200 btn_up_out[2] = 1;					 
	#10  btn_up_out[2] = 0;
	#27000  waits = 0;//wait
	#700 btn_in[7] = 1;	
	#10  btn_in[7] = 0;	
	#32000  waits = 0;//wait
	#800 btn_down_out[4] = 1;	
	#10  btn_down_out[4] = 0;
	#22000  waits = 0;//wait
	#1100 btn_in[5] = 1;	
	 	 btn_in[1] = 1;
	#10  btn_in[5] = 0;
		 btn_in[1] = 0;	 
	#50000  waits = 0;//wait
	#20000  waits = 0;//wait
	/*postcondition: go to floor 0*/
	#1500  waits = 0;//wait		
	#100 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	 
	#30000  waits = 0;//wait	
	/* test 12. open button */ 
	#5 reset = 0;
	#95 reset = 1;
	#200 waits = 0;//wait
	#200 btn_up_out[2] = 1;					 
	#10  btn_up_out[2] = 0;
	#20000  waits = 0;//wait
	#700 btn_in[5] = 1;	
	#10  btn_in[5] = 0;
	#20000  waits = 0;//wait
	#1000 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	
	#300 open_btn = 1;	
	#40000 open_btn = 0;
	#1000 waits = 0;//wait	
	/* test 13. close button*/ 
	#5 reset = 0;
	#95 reset = 1; 
	#10 close_btn = 1;	
	#100 close_btn = 0;
	#20000 waits = 0;//wait
	#200 btn_down_out[4] = 1;					 
	#10  btn_down_out[4] = 0;
	#700 btn_in[2] = 1;	
	#10  btn_in[2] = 0;	 
	#100 close_btn = 1;	
	#50000 close_btn = 0;	 
	#100 open_btn = 1;	
	#300 open_btn = 0;	
		 close_btn = 1;	
	#200 close_btn = 0;
	#100 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	
	#1200 waits = 0;//wait	
	/* test 14. blocking buttons*/ 
	#5 reset = 0;
	#95 reset = 1; 
	#100 btn_in[5] = 1;	
	#10  btn_in[5] = 0;
	#700 btn_in[5] = 1;	
	#10  btn_in[5] = 0;		
	#1000 btn_in[1] = 1;	
	#10  btn_in[1] = 0;
	#800 btn_in[1] = 1;	
	#10  btn_in[1] = 0;
	#400 waits = 0;//wait
	/* test 15. bell button*/ 
	#5 reset = 0;
	#95 reset = 1; 
	#100 bell = 1;	
	#300 bell = 0;
	#300 waits = 0;//wait
	#200 bell = 1;	
	#500 bell = 0;
	#500 waits = 0;//wait
	#100 bell = 1;	
	#600 bell = 0;
	#200 waits = 0;//wait
	#100 bell = 1;	
	#500 bell = 0;
	#400 waits = 0;//wait
	/* test 16. overload */
	#5 reset = 0;
	#95 reset = 1; 
	#200 btn_in[4] = 1;	
	#10  btn_in[4] = 0;
	#10	 overload = 1;
	#1000 overload = 0;
	#400 overload = 1;
	#200 overload = 0; 
	#300 overload = 1;
	#700 overload = 0;
	#100 waits = 0;//wait
	/* test 17. sensor_inside */ 
	#5 reset = 0;
	#95 reset = 1; 
	#200 btn_in[5] = 1;	
	#10  btn_in[5] = 0;
	#10	 sensor_inside = 1;
	#1000 sensor_inside = 0;
	#400 sensor_inside = 1;		
	#200 sensor_inside = 0; 
	#300 sensor_inside = 1;
	#700 sensor_inside = 0;
	#100 waits = 0;//wait	   
	/**********************/  
	#500 $finish;
	end

endmodule

