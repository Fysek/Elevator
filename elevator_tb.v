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
 reg [BUTTONS_WIDTH-1:0] btn_num_in; // wewnatrz windy
 reg [BUTTONS_WIDTH-1:0] btn_up_out; //na zewnatrz do gory
 reg [BUTTONS_WIDTH-1:0] btn_down_out;
 //outputs
 wire [1:0] engine;
 wire [1:0] door;
 wire [BUTTONS_WIDTH-1:0] level_display;
 
 
 
elevator elevator_inst(
		.clk(clk),
		.reset(reset),
		.open_btn(open_btn),
		.close_btn(close_btn),
		.btn_num_in(btn_num_in),
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
	  	//$dumpvars(0,clk,reset,open_btn,close_btn,btn_num_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,level_display);
		//$monitor($time,": clk=%b reset=%b open_btn=%b close_btn=%b btn_num_in=%d btn_up_out=%d btn_down_out=%d | engine_up=%b engine_down=%b open_door=%b close_door=%b level_display=%b"
		//,clk,reset,open_btn,close_btn,btn_num_in,btn_up_out,btn_down_out,engine_up,engine_down,open_door,close_door,level_display);
	
	clk = 1'b0;
	open_btn = 0;
	close_btn = 0;
	btn_num_in = 0;
	btn_up_out = 0;
	btn_down_out = 0;
	#5 reset = 0;
	#5 reset = 1;
	#60 open_btn = 1;	
	#10 open_btn = 0;
	//#60	
		
		
	#100 $finish;
	end

endmodule
