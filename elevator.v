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
	reg letout;//0 - down, 1 - up
	reg direction;//0 - down, 1 - up
	
	
	//buttons regs
	reg  [BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_up_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_down_levels;
	wire [BUTTONS_WIDTH-1:0] active_in_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_up_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_down_levels;

	//end buttons regs
	
	reg[4:0] state, last_state;
	
	parameter 	FLOOR0  = 0 ,
				FLOOR1  = 1 ,
				FLOOR2  = 2 ,
				FLOOR3  = 3 ,
				FLOOR4  = 4 ,
				FLOOR5  = 5 ,
				FLOOR6  = 6 ,
				FLOOR7  = 7 ,
				FLOOR01 = 8 ,
				FLOOR12 = 9 ,
				FLOOR23 = 10,
				FLOOR34 = 11,
				FLOOR45 = 12,
				FLOOR56 = 13,
				FLOOR67 = 14,
				IDLE    = 15,
				OPEN    = 16,
				CLOSE   = 17,
				WAIT    = 18;
	
	
	
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
	
	/*
	-direction zmieniamy tylko na pełnych poziomach
	-na pełnych poziomach czyscimy rejestry buttonów
	-pierwsze wejscie na pełny poziom to FLOOR0->OPEN->CLOSE->FLOOR0
	*/
	
	
	

	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			engine 		<= 0;
			letout		<= 0;
			door		<= 0;
			if(current_level==0) begin
				state 		<= FLOOR0;
				direction   <= 1;
			end	
			else begin
				state 		<= OPEN;
				direction   <= 0;
			end			
		end
		else begin
			case(state)
				FLOOR0: begin
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR0;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state		<=FLOOR01;
							direction   <=1;
							engine		<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end	
				end

				FLOOR01: begin	
					if(direction) begin //direction up
						if((active_in_levels[1] == 1)||(active_out_up_levels[1] == 1)) begin
							state<=FLOOR1;	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR12;
							engine<=2;
						end	
					end
					else begin//direction 0
						state<=FLOOR0;		//go down to the full floor
						engine<=0;
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
					if(direction) begin //direction up
						if((active_in_levels[2] == 1)||(active_out_up_levels[2] == 1)) begin
							state<=FLOOR2; 	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR23;
							engine<=2;
						end	
					end
					else begin//direction 0
						if((active_in_levels[1] == 1)||(active_out_down_levels[1] == 1)) begin
							state<=FLOOR1; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR01;
							engine<=2;
						end	
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
					if(direction) begin //direction up
						if((active_in_levels[3] == 1)||(active_out_up_levels[3] == 1)) begin
							state<=FLOOR3; 	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR34;
							engine<=2;
						end	
					end
					else begin//direction down
						if((active_in_levels[2] == 1)||(active_out_down_levels[2] == 1)) begin
							state<=FLOOR2; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR12;
							engine<=2;
						end	
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
					if(direction) begin //direction up
						if((active_in_levels[4] == 1)||(active_out_up_levels[4] == 1)) begin
							state<=FLOOR4; 	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR45;
							engine<=2;
						end	
					end
					else begin//direction down
						if((active_in_levels[3] == 1)||(active_out_down_levels[3] == 1)) begin
							state<=FLOOR3; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR23;
							engine<=2;
						end	
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
					if(direction) begin //direction up
						if((active_in_levels[5] == 1)||(active_out_up_levels[5] == 1)) begin
							state<=FLOOR5; 	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR56;
							engine<=2;
						end	
					end
					else begin//direction down
						if((active_in_levels[4] == 1)||(active_out_down_levels[4] == 1)) begin
							state<=FLOOR4; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR34;
							engine<=2;
						end	
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
					if(direction) begin //direction up
						if((active_in_levels[6] == 1)||(active_out_up_levels[6] == 1)) begin
							state<=FLOOR6; 	//go up to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR67;
							engine<=2;
						end	
					end
					else begin//direction down
						if((active_in_levels[5] == 1)||(active_out_down_levels[5] == 1)) begin
							state<=FLOOR5; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR45;
							engine<=2;
						end	
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
					if(direction) begin //direction up
						state<=FLOOR6; 	//go up to the full floor
						engine<=0;
					end
					else begin//direction down
						if((active_in_levels[6] == 1)||(active_out_down_levels[6] == 1)) begin
							state<=FLOOR6; 	//go down to the full floor
							engine<=0;
						end	
						else begin
							state<=FLOOR56;
							engine<=2;
						end	
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
				/*in progress*/
				IDLE: begin
					if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin
						if(direction==1)
							state<=OPEN;
						else
							state<=CLOSE;
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
						state<=last_state;
				end
			
				WAIT: begin
					if(overload)
						state<=WAIT;
					else 
						state<=CLOSE;
				end
			
				default: 
					state<=IDLE;
					
			endcase
		end	
	end

endmodule 
//elevator