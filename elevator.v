//elevator

module elevator
#(
parameter BUTTONS_WIDTH = 6

)
(
	input clk,
	input reset,
	input service,
	input weight_check,
	input fan,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg [1:0] engine_up,
	output reg [1:0] engine_down,
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	reg [BUTTONS_WIDTH-1:0] current_level;
	reg [BUTTONS_WIDTH-1:0] active_levels;// te które są wcisnete
	
	reg[2:0] state, next_state;
	parameter IDLE=3'b000, OPEN=3'b001, CLOSE=3'b010, UP=3'b011,DOWN=3'b100,WAIT=3'b101;
	
	reg[2:0] floor, ;
	parameter GROUND=3'b000,FLOOR1=3'b001,FLOOR2=3'b010,FLOOR3=3'b011,FLOOR4=3'b100,FLOOR5=3'b101,FLOOR6=3'b110,FLOOR7=3'b111;
	
	
	
	always@(posedge clk or reset)
	begin
		state<=reset?next_state:IDLE;
		
		if(!reset) 
			floor=GROUND;
		else if(state==OPEN)
			floor=next_floor;
	end
	
	
	always@(*)
	begin
		next_state=IDLE;
		case(state)
	
		IDLE:
		begin
			if(inopen)
				next_state=OPEN;
			else if(floor<next_floor)
				next_state=UP;
			else if(floor>next_floor)
				next_state=DOWN;
			else 
				if(floor==next_floor)
				begin
					if(inG|in1|in2|in3|in4|in5|in6|in7)
						next_state=OPEN;
				end
				else 
					next_state=IDLE;
		end

		OPEN:
		begin
			if(inclose)
				next_state=CLOSE;
			else 
				next_state=WAIT;
		end
	
		CLOSE:
		begin
			if(inopen)
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
	
	
	
	
	
	
	
	
	
	
	/*
    always @(posedge clk or reset)
        if(reset)
            begin      
				engine_up <= 2'b00;
				engine_down <= 2'b00;
            end
		else
			begin	
			
			
			
			
			
			end*/
endmodule //elevator