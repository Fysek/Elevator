//elevator
//iverilog -o elevator elevator.v 
//iverilog -o elevator_tb elevator_tb.v
//vvp elevator_tb
//gtkwave elevator_tb.vcd
`include "elevator.v"
`include "test_module.v"

module elevator_tb;
 //inputs
 parameter BUTTONS_WIDTH = 8;
 reg clk;
 reg reset;
 reg open_btn;
 reg close_btn;
 reg overload;
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
 wire [2:0] level_display;
 /*
 Testy
 1. Start w poziomie 0, req z F0 na F7, winda jedzie na F7 i tam zostaje
 2. Osoba req z F7 na F0, winda jedzie na F0
 3. Osoba req z F7 na dol, winda z F0 jedzie na F7 i jedzie na wybrane pietro (F4)
 
 */
 
 
elevator elevator_inst( 
		.clk(clk),
		.reset(reset),
		.open_btn(open_btn),
		.close_btn(close_btn),
		.overload(overload),
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
		.level_display(level_display)
		);
		
test_module test_module_inst(	
		.clk			(clk			),
		.reset			(reset			),
		.engine			(engine			),
		.door			(door			),
		.sensor_door 	(sensor_door 	),
		.sensor_up		(sensor_up		),
		.sensor_down 	(sensor_down 	)
		); 		
		
always
	begin
		#5 clk=!clk;
	end	
		
initial
	begin
		$dumpfile("elevator_tb.vcd");
	  	$dumpvars(0,clk,reset,open_btn,btn_in,btn_up_out,btn_down_out,engine,door,level_display);
		//$monitor($time,": clk=%b reset=%b open_btn=%b close_btn=%b btn_in=%d btn_up_out=%d btn_down_out=%d | engine_up=%b engine_down=%b open_door=%b close_door=%b level_display=%b"
		//,clk,reset,open_btn,close_btn,btn_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,close_door,level_display);
	
	clk = 1'b0;
	open_btn = 0;
	btn_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	overload = 0;  
	/* test 1. btn_in test */ 
	#5 reset = 0;
	#95 reset = 1;
	#200 btn_in[0] = 1;	
	#10  btn_in[0] = 0;	
	#200 btn_in[1] = 1;	
	#10  btn_in[1] = 0;	
	#600 btn_in[2] = 1;	
	#10  btn_in[2] = 0;	
	#600 btn_in[3] = 1;	
	#10  btn_in[3] = 0;		
	#600 btn_in[4] = 1;	
	#10  btn_in[4] = 0;		
	#600 btn_in[5] = 1;	
	#10  btn_in[5] = 0;		
	#600 btn_in[6] = 1;	
	#10  btn_in[6] = 0;	
	#600 btn_in[7] = 1;	
	#10  btn_in[7] = 0;
	#600 btn_in[6] = 1;	
	#10  btn_in[6] = 0;	
	#600 btn_in[5] = 1;	
	#10  btn_in[5] = 0;		
	#600 btn_in[4] = 1;	
	#10  btn_in[4] = 0;	
	#600 btn_in[3] = 1;	
	#10  btn_in[3] = 0;
	#600 btn_in[2] = 1;	
	#10  btn_in[2] = 0;
	#600 btn_in[1] = 1;	
	#10  btn_in[1] = 0;
	#2500  btn_in[0] = 0;//wait	
	/* test 2. all btn_in at once*/ 
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
	#6000  btn_in[0] = 0;//wait		  
		/* test 1. go to 6 a back to 0, stop at lev 1*/ 
	#5 reset = 0;
	#5 reset = 1;
	#200 btn_in[6] = 1;	
	#10 btn_in[6] = 0;	
	#300 btn_up_out[0] = 1;	
	#10 btn_up_out[0] = 0;
	#300 btn_down_out[1] = 1;	
	#10 btn_down_out[1] = 0; 
	#2500 btn_up_out[0] = 0;//wait 
	#500 btn_up_out[0] = 0;//wait 
	
	
	/* test 4. go to 7 a back to 0*/ 
	#5 reset = 0;
	#95 reset = 1;
	#100 btn_up_out[6] = 1;	
	#10 btn_up_out[6] = 0;
	#300 btn_up_out[0] = 1;	
	#10 btn_up_out[0] = 0;
	#100 btn_up_out[1] = 1;	
	#10 btn_up_out[1] = 0;	 
	#100 btn_up_out[2] = 1;	
	#10 btn_up_out[2] = 0;	
	#100 btn_up_out[3] = 1;	
	#10 btn_up_out[3] = 0;	
	#100 btn_up_out[4] = 1;	
	#10 btn_up_out[4] = 0;
	#100 btn_up_out[5] = 1;	
	#10 btn_up_out[5] = 0;	  
	#3500 reset = 0;
	#100 reset = 1;
 	/* test 3. all btn_in at once*/  
	#100 btn_up_out[4] = 1;	
	#10 btn_up_out[4] = 0;
	#300 btn_up_out[0] = 1;	
	#10 btn_up_out[0] = 0;
	#100 btn_up_out[1] = 1;	
	#10 btn_up_out[1] = 0;	 
	#100 btn_up_out[2] = 1;	
	#10 btn_up_out[2] = 0;
	#100 btn_up_out[3] = 1;	
	#10 btn_up_out[3] = 0;
	#100 btn_up_out[4] = 1;	
	#10 btn_up_out[4] = 0;
	#2000 reset = 0;
	#100 reset = 1;
	#20 btn_in[3] = 1;	
	#20 btn_in[3] = 0;	
	#800 btn_down_out[7] = 1;
	#10	btn_down_out[7] = 0;
	#5 reset = 0;
	#5 reset = 1;
	/* test 1. go to 7 a back to 0*/
	#20 btn_in[7] = 1;	
	#20 btn_in[7] = 0;	
	#800 btn_down_out[7] = 1;
	#10	btn_down_out[7] = 0;
	/*test 1. done*/	
	$display("done first test");
	#300 btn_in[5] = 1;	
	#10 btn_in[5] = 0; 
	#800 btn_down_out[3] = 1;
	#10	btn_down_out[3] = 0; /*
	$display("done second test");
	#600 btn_up_out[0] = 1;		  
	#10 btn_up_out[0] = 0;	
	$display("done third test");	 */
	#3000 $finish;
	end

endmodule
