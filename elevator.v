//elevator
`include "buttons.v"

module elevator
#(
parameter BUTTONS_WIDTH = 8

)
(
	input clk,
	input reset,
	input open_btn,
	input close_btn,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg [1:0] engine,				//0-idle 1-down, 2-up
	output reg [1:0] door, 					//0-idle 1-open, 2-close
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	reg [BUTTONS_WIDTH-1:0] current_level;
	reg [BUTTONS_WIDTH-1:0] active_in_levels;// te które są wcisnete wewnatrz
	reg [BUTTONS_WIDTH-1:0] active_out_up_levels;// te które są wcisnete na zew
	reg [BUTTONS_WIDTH-1:0] active_out_down_levels;// te które są wcisnete na zew
	reg reached,overload=0;
	
	reg[2:0] state;
	parameter IDLE=3'b000, OPEN=3'b001, CLOSE=3'b010, UP=3'b011,DOWN=3'b100,WAIT=3'b101;
	
	reg[2:0] floor;
	parameter GROUND=3'b000,FLOOR1=3'b001,FLOOR2=3'b010,FLOOR3=3'b011,FLOOR4=3'b100,FLOOR5=3'b101,FLOOR6=3'b110,FLOOR7=3'b111;
	
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
	
	
	
	
	
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			floor		<= GROUND;
			state 		<= IDLE;
			engine 		<=0;
			door		<=0;
		end
		else begin
			case(state)
				IDLE: begin
					if(floor<next_floor)
						state<=UP;
					else if(floor>next_floor)
						state<=DOWN;
					else 
						state<=OPEN;
				end
		
				OPEN: begin
					if(close_btn)
						state<=CLOSE;
					else 
						state<=WAIT;
				end
			
				CLOSE: begin
					if(open_btn)
						state<=OPEN;
					else 
						state<=IDLE;
				end
				
				UP: begin
					if(reached)
						state<=OPEN;
					else 
						state<=UP;
				end
			
				DOWN: begin
					if(reached)
						state<=OPEN;
					else 
						state<=DOWN;
				end
			
				WAIT: begin
					if(overload)
						state<=WAIT;
					else 
						state<=CLOSE;////tutaj musi byc cos o nacisnieciach
				end
			
				default: 
					state<=IDLE;
					
			endcase
		end	
	end
/*	
	always @(posedge clk or negedge reset) 
	begin
	
		next_floor?
		active_in_levels
		active_out_levels
	end
*/	

/*		
	always @(*) 
	begin

	btn_num_in
	btn_up_out
	btn_down_out
	end
*/	

endmodule 
//elevator