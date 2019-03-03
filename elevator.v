//elevator

module elevator
#(
parameter BUTTONS_WIDTH = 6

)
(
	input clk,
	input reset,
	//input service,
	//input fan,
	input open_btn,
	input close_btn,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg engine_up,
	output reg engine_down,
	output reg open_door,
	output reg close_door,
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	reg [BUTTONS_WIDTH-1:0] current_level;
	reg [BUTTONS_WIDTH-1:0] active_levels;// te które są wcisnete
	reg reached,overload=0;
	
	reg[2:0] state, next_state;
	parameter IDLE=3'b000, OPEN=3'b001, CLOSE=3'b010, UP=3'b011,DOWN=3'b100,WAIT=3'b101;
	
	reg[2:0] floor, next_floor;
	parameter GROUND=3'b000,FLOOR1=3'b001,FLOOR2=3'b010,FLOOR3=3'b011,FLOOR4=3'b100,FLOOR5=3'b101,FLOOR6=3'b110,FLOOR7=3'b111;
	
	
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset) 
			begin
				floor			= GROUND;
				next_floor  = GROUND;
				state 		= IDLE;
				engine_up	=0;
				engine_down =0;
				open_door	=0;
				close_door	=0;
			end
		else
			begin
				state=next_state;
				floor=next_floor;
			end
			
			
	end
	
	
	always@(*)
	begin
		
		case(state)
		IDLE:
		begin
			if(open_btn)
				next_state=OPEN;
			else if(floor<next_floor)
				next_state=UP;
			else if(floor>next_floor)
				next_state=DOWN;
			//else
				//begin
					//if(floor==next_floor)
					//	next_state=OPEN;
					///else 
					//	next_state=IDLE;
				//end		
		end

		OPEN:
		begin
			if(close_btn)
				next_state=CLOSE;
			else 
				next_state=WAIT;
		end
	
		CLOSE:
		begin
			if(open_btn)
				next_state=OPEN;
			else 
				next_state=IDLE;
		end
		
		UP:
		begin
			if(reached)
				next_state=OPEN;
			else 
				next_state=UP;
		end
	
		DOWN:
		begin
			if(reached)
				next_state=OPEN;
			else 
				next_state=DOWN;
		end
	
		WAIT:
		begin
			if(overload)
				next_state=WAIT;
			else 
				next_state=CLOSE;
		end
	
		default: 
			next_state=IDLE;
			
		endcase
	end
	
	
	

endmodule 
//elevator