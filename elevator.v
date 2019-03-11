//elevator
`include "buttons.v"
`include "macros.v"

module elevator
#(
parameter BUTTONS_WIDTH = 8

)
(
	input clk,
	input reset,
	input open_btn,
	input close_btn,
	input [BUTTONS_WIDTH-1:0] btn_in, 		// wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, 	//na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,	//na zewnatrz na dół
	output reg [1:0] engine,				//0-idle 1-down, 2-up
	output reg [1:0] door, 					//0-idle 1-open, 2-close
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	reg [BUTTONS_WIDTH-1:0] current_level;
	reg reached,overload=0;
	reg direction;//0 - down, 1 - up
	
	
	//buttons regs
	reg  [BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_up_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_down_levels;
	wire [BUTTONS_WIDTH-1:0] active_in_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_up_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_down_levels;

	//end buttons regs
	
	reg[4:0] state;
	
	buttons buttons_inst(
		.clk(clk),
		.reset(reset),
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
	

	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			engine 		<= 0;
			door		<= 0;
			if(current_level==0)
				state 		<= FLOOR0;
				direction   <= 1;
			else
				state 		<= OPEN;
				direction   <= 0;
			
		end
		else begin
			case(state)
				FLOOR0: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR01: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR1: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR12: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				FLOOR2: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR23: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR3: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR34: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR4: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR45: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR5: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR56: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR6: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
				FLOOR67: begin	
					if(active_in_levels[1] == 1 or active_out_up_levels[1] == 1) begin
						state<=FLOOR1;
						engine<=0;
					end	
					else begin
						state<=FLOOR12;
						engine<=2;
					end
				end
				
				FLOOR7: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
						state<=FLOOR01;
						engine<=2;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
				end
				
			
			
			
				IDLE: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin
						if(direction==1)
							state<=UP;
						else
							state<=DOWN;
					end	
					else if(open_btn)	
						state<=OPEN;
					else	
						state<=IDLE;
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

endmodule 
//elevator