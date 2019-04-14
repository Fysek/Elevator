													  //elevator
//iverilog -o ALU ALU.v 
//iverilog -o ALU_tb ALU_tb.v
//vvp ALU_tb
//gtkwave ALU_tb.vcd
`include "elevator.v"

module elevator_tb;
 //inputs
 parameter BUTTONS_WIDTH = 8;
 reg clk;
 reg reset;
 reg open_btn;
 reg close_btn;
 reg overload;
 reg sensor_up;
 reg sensor_down;
 reg sensor_inside;
 reg [BUTTONS_WIDTH-1:0] btn_in; // wewnatrz windy
 reg [BUTTONS_WIDTH-1:0] btn_up_out; //na zewnatrz do gory
 reg [BUTTONS_WIDTH-1:0] btn_down_out;
 //outputs
 wire [1:0] engine;
 wire [1:0] door;
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
		.btn_in(btn_in),
		.btn_up_out(btn_up_out),
		.btn_down_out(btn_down_out),
		.engine(engine),
		.door(door),
		.level_display(level_display)
		);

always
	begin
		#10 clk=!clk;
	end	
		
initial
	begin
		//$dumpfile("elevator_tb.vcd");
	  	//$dumpvars(0,clk,reset,open_btn,close_btn,btn_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,level_display);
		//$monitor($time,": clk=%b reset=%b open_btn=%b close_btn=%b btn_in=%d btn_up_out=%d btn_down_out=%d | engine_up=%b engine_down=%b open_door=%b close_door=%b level_display=%b"
		//,clk,reset,open_btn,close_btn,btn_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,close_door,level_display);
	
	clk = 1'b0;
	open_btn = 0;
	close_btn = 0;
	btn_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	#5 reset = 0;
	#5 reset = 1;
	/* test 1. go to 7 a back to 0*/
	#10 btn_in[7] = 1;	
	#10 btn_in[7] = 0;	
	#80	btn_down_out[7] = 1;
	#10	btn_down_out[7] = 0;
	#100 btn_up_out[0] = 1;		
	#10 btn_up_out[0] = 0;	
	/*test 1. done*/
	#400 btn_in[7] = 0;
	$display("done first test");
	#10 btn_in[5] = 1;	
	#10 btn_in[5] = 0;
	#180 btn_down_out[3] = 1;
	#10	btn_down_out[3] = 0;
	$display("done second test");
	#600 btn_up_out[0] = 1;		
	#10 btn_up_out[0] = 0;	
	$display("done third test");	
	#600 $finish;
	end

endmodule
