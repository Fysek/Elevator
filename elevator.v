//elevator
//`include "buttons.v"

module elevator
#(
parameter BUTTONS_WIDTH = 8

)
(
	input 							clk			,
	input 							reset		,
	input 							open_btn	,
	input 							close_btn	,
	input 		[BUTTONS_WIDTH-1:0] btn_in		, 	// wewnatrz windy
	input 		[BUTTONS_WIDTH-1:0] btn_up_out	, 	//na zewnatrz do gory
	input 		[BUTTONS_WIDTH-1:0] btn_down_out,	//na zewnatrz na dół
	output reg 	[1:0] 				engine		,	//0-idle 1-down, 2-up
	output reg 	[1:0] 				door		, 	//0-idle 1-open, 2-close
	output reg 	[2:0] 				level_display
);
    
	reg reached,overload=0;
	reg letout;//0 - down, 1 - up
	reg direction;//0 - down, 1 - up
	reg last_direction;//0 - down, 1 - up
	
	
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
	-zmiana direction mzoe byc tylko jezeli jest w wait 5 razy
	*/
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			engine 						<=0;
			letout						<=0;
			door						<=0;
			level_display	 			 =0;
			inactivate_in_levels 		 =0;
			inactivate_out_up_levels 	 =0;
			inactivate_out_down_levels	 =0;
			if(level_display==0) begin
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
					level_display=0;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR0;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels>1)||(active_out_up_levels>0)) begin 
							state		<=FLOOR01;
							direction   <=1;
							engine		<=2;
							letout		<=0;
						end	
						else if(open_btn)	
							state<=OPEN;
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
					else begin//direction down
						state<=FLOOR0;		//go down to the full floor
						engine<=0;
					end
				end
				
				FLOOR1: begin
					level_display=1;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR1;
						letout		<= 1;
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>2)||(active_out_up_levels>2))begin 
									state<=FLOOR12;
									engine<=2;
								end	
								else begin
									state<=WAIT;
									engine<=0;
								end
							end 
							else begin//direction down
								if((active_in_levels>2)||(active_out_down_levels>2))begin //todo
									state<=FLOOR01;
									engine<=1;
								end	
								else begin
									state<=WAIT;
									engine<=0;
								end
								
								
							end
						end 
						else begin//zmiana kierunku
							
							
							
					
						end		
					end		
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
					level_display=2;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR2;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state<=FLOOR01;
							engine<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end		
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
					level_display=3;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR3;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state<=FLOOR01;
							engine<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end		
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
					level_display=4;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR4;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state<=FLOOR01;
							engine<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end		
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
					level_display=5;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR5;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state<=FLOOR01;
							engine<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end		
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
					level_display=6;
					if (!letout) begin
						state		<= OPEN;
						last_state	<= FLOOR6;
						letout		<= 1;
					end 
					else begin
						if(active_in_levels|active_out_up_levels|active_out_down_levels < 0) begin 
							state<=FLOOR01;
							engine<=2;
						end	
						else if(open_btn)	
							state<=OPEN;
						else	
							state<=IDLE;
					end		
				end
				
				FLOOR67: begin	
					if(direction) begin //direction up
						state<=FLOOR7; 	//go up to the full floor
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
					level_display=7;
					if (!letout) begin
						state							<= OPEN;
						last_state						<= FLOOR7;
						letout							<= 1;
						inactivate_in_levels[7]			=1;
						//inactivate_out_up_levels[7]		=1; no up, last floor
						inactivate_out_down_levels[7]	=1;				
					end 
					else begin
						inactivate_in_levels[7]			=0;
						//inactivate_out_up_levels[7]		=0;
						inactivate_out_down_levels[7]	=0;
						if(active_in_levels>0)||(active_out_down_levels>0)) begin 
							state		<=FLOOR67;
							direction   <=0;
							engine		<=2;
							letout		<=0;
						end	
						else if(open_btn)	
							state<=OPEN;
					end	
				end
				/*in progress*/
				/*IDLE: begin

				end*/
				
		
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
					state<=OPEN;
					
			endcase
		end	
	end

endmodule 
//elevator