//elevator
`include "buttons_res.v"

module elevator
#(
parameter BUTTONS_WIDTH = 8
parameter DELAY = 8
parameter BUTTONS_WIDTH = 8

)
(
	input 							clk				,
	input 							reset			,
	output reg 						sensor_up		,	//0 - not reached 1 - reached | sensor inside elevator 
	output reg 						sensor_down 	,	//0 - not reached 1 - reached | to get the position
	output reg 						sensor_inside 	,	//0 - not covered 1 - covered | covered sensor, door must be open
	output reg						sensor_door 		//0 - opened 1 - closed sensor on door state

);
    
	reg reached;
	reg closing;			//special flag when doors are closing
	reg move;				//0 - not moving, 1 - moving
	reg letout;				//0 - down, 1 - up
	reg direction;			//0 - down, 1 - up
	reg last_direction;		//0 - down, 1 - up
	reg [3:0] buttons_blocked;	//numer - floor blocked 0 - unblocked, 1 - F0, 2 - F1
	reg [3:0] counter;

	//buttons regs
	reg  [BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_up_levels;
	reg  [BUTTONS_WIDTH-1:0] inactivate_out_down_levels;
	wire [BUTTONS_WIDTH-1:0] active_in_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_up_levels;
	wire [BUTTONS_WIDTH-1:0] active_out_down_levels;

	//end buttons regs
	
	reg[4:0] state, saved_state, move_state;
	
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
	
	buttons_res buttons_inst(

		.clk(clk)												,
		.reset(reset)											,
		.buttons_blocked(buttons_blocked)						,
		.btn_in(btn_in)											,
		.btn_up_out(btn_up_out)									,
		.btn_down_out(btn_down_out)								,
		.inactivate_in_levels(inactivate_in_levels)				,
		.inactivate_out_up_levels(inactivate_out_up_levels)		,
		.inactivate_out_down_levels(inactivate_out_down_levels)	,
		.active_in_levels(active_in_levels)						,
		.active_out_up_levels(active_out_up_levels)				,
		.active_out_down_levels(active_out_down_levels)
		);
	
	/*
	-direction zmieniamy tylko na pe³nych poziomach
	-na pe³nych poziomach czyscimy rejestry buttonów
	-pierwsze wejscie na pe³ny poziom to FLOOR0->OPEN->CLOSE->FLOOR0
	-zmiana direction mzoe byc tylko jezeli jest w wait 5 razy
	active_out_down_levels[1] does not exist
	inactivate_out_down_levels[1] does not exist
	active_out_up_levels[7] does not exist
	inactivate_out_up_levels[7] does not exist
	beda na 6 pietrze nie da sie wcisnac przycisku 6

	*/
	/*
	TO_DO
	-dodac kasowanie przycisków - done
	-dodac fotokomorke
	-blokowanie przycisków
	-flaga move 
	*/
	
	
	//assign reached=sensor_down&&sensor_up;
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			engine 						<=0;
			letout						<=0;
			door						<=0;
			counter						<=0;
			buttons_blocked				<=0;
			inactivate_in_levels 		<=0;
			inactivate_out_up_levels 	<=0;
			inactivate_out_down_levels	<=0;
			level_display	 			 =0;
			move						<=0;
			closing						<=0;
			if(level_display==0) begin
				state 		<=FLOOR0;
				direction   <=1;
			end	
			else begin
				state 		<=OPEN;
				direction   <=0;
			end			
		end
		else begin
			case(state)
				FLOOR0: begin
					level_display					 =0;	
					inactivate_in_levels[0]			<=1;
					inactivate_out_up_levels[0] 	<=1;
					inactivate_out_down_levels[1] 	<=0;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR0;
						letout							<=1;
					end 
					else begin												
						if((active_in_levels>1)||(active_out_up_levels>0)||(active_out_down_levels>1)) begin 
							state		<=FLOOR01;
							move_state	<=FLOOR01;
							direction   <=1;
							engine		<=2;
							letout		<=0;
							inactivate_in_levels[0] 		<=0;
							inactivate_out_up_levels[0] 	<=0;
						end	
						else if(open_btn)	
							state<=OPEN;
					end	
				end

				FLOOR01: begin
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin	
						if(direction) begin //direction up
							if((active_in_levels[1] == 1)||(active_out_up_levels[1] == 1)) begin
								state	<=FLOOR1;	//go up to the full floor
								engine	<=0;
								inactivate_in_levels[1]		<=1;
								inactivate_out_up_levels[1] <=1;
							end	
							else if((active_out_down_levels[1]==1)&&(active_out_up_levels[1]!=1)&&(active_in_levels<4))begin
								state		<=FLOOR1;	//request z 1p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[1]			<=1;					
								inactivate_out_down_levels[1] 	<=1;
							end
							else begin
								state	<=FLOOR12;
								engine	<=2;
							end	
						end
						else begin	//	direction down
							state	<=FLOOR0;		//go down to the full floor
							engine	<=0;
							inactivate_in_levels[0]			<=1;
							inactivate_out_down_levels[1] 	<=1;						
						end
					end
					else begin
						state<=FLOOR01;
					end	
				end
				
				FLOOR1: begin
					level_display=1;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR1;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[1]			<=0;
						inactivate_out_up_levels[1] 	<=0;
						inactivate_out_down_levels[1] 	<=0;
					end 
					else begin					
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>2)||(active_out_up_levels>2))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR12;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state		<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels==1)||(active_out_up_levels==1))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR01;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin
							if((active_in_levels>2)||(active_out_up_levels>2))begin//up
								state		<=CLOSE;
								saved_state	<=FLOOR12;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels==1)||(active_out_up_levels==1))begin//down ||(active_out_down_levels==1) no sense
								state		<=CLOSE;
								saved_state	<=FLOOR01;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end
				
				FLOOR12: begin
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin					
						if(direction) begin //direction up
							if((active_in_levels[2] == 1)||(active_out_up_levels[2] == 1)) begin
								state	<=FLOOR2;	//go up to the full floor
								engine	<=0;
								inactivate_in_levels[2]		<=1;
								inactivate_out_up_levels[2] <=1;
							end	
							else if((active_out_down_levels[2]==1)&&(active_out_up_levels[2]!=1)&&(active_in_levels<8))begin
								state		<=FLOOR2;	//request z 2p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[2]			<=1;					
								inactivate_out_down_levels[2] 	<=1;
							end																	
							else begin
								state<=FLOOR23;
								engine<=2;
							end	
						end
						else begin//direction 0
							if((active_in_levels[1] == 1)||(active_out_down_levels[1] == 1)) begin
								state	<=FLOOR1; 	//go down to the full floor
								engine	<=0;
								inactivate_in_levels[1]			<=1;
								inactivate_out_down_levels[1] 	<=1;
							end	
							else if((active_out_up_levels[1]==1)&&(active_out_down_levels[1]!=1)&&(active_in_levels>8))begin
								state		<=FLOOR1;	//request z 2p zeby jechac na 1p a potem gora
								engine		<=0;
								direction	<=1;
								inactivate_in_levels[1]		<=1;					
								inactivate_out_up_levels[1] <=1;
							end	
							else begin
								state	<=FLOOR01;
								engine	<=2;
							end	
						end
					end	
					else begin
						state<=FLOOR12;
					end	
				end	
				
				FLOOR2: begin
					level_display=2;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR2;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[2]			<=0;							
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up			
								if((active_in_levels>4)||(active_out_up_levels>4)||(active_out_down_levels>4))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR23;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								inactivate_out_down_levels[2] <=0;
								if((active_in_levels<4)||(active_out_up_levels<4)||(active_out_down_levels<4))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR12;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin//diff dir
							if((active_in_levels>4)||(active_out_up_levels>4)||(active_out_down_levels>4))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR23;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels<4)||(active_out_up_levels<4)||(active_out_down_levels<4))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR12;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end//FLOOR2
					
				FLOOR23: begin
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin
						if(direction) begin //direction up
							if((active_in_levels[3] == 1)||(active_out_up_levels[3] == 1)) begin
								state<=FLOOR3; 	//go up to the full floor
								engine<=0;
								inactivate_in_levels[3]		<=1;
								inactivate_out_up_levels[3] <=1;
							end	
							else if((active_out_down_levels[3]==1)&&(active_out_up_levels[3]!=1)&&(active_in_levels<16))begin
								state		<=FLOOR3;	//request z 3p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[3]			<=1;					
								inactivate_out_down_levels[3] 	<=1;
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
								inactivate_in_levels[2]			<=1;
								inactivate_out_down_levels[2] 	<=1;
							end	
							else if((active_out_up_levels[2]==1)&&(active_out_down_levels[2]!=1)&&(active_in_levels>16))begin
								state		<=FLOOR2;	//request z 2p zeby jechac na 1p a potem gora
								engine		<=0;
								direction	<=1;
								inactivate_in_levels[2]		<=1;					
								inactivate_out_up_levels[2] <=1;
							end	
							else begin
								state<=FLOOR12;
								engine<=2;
							end	
						end
					end	
					else begin
						state<=FLOOR23;
					end	
				end
				
				FLOOR3: begin
					level_display=3;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR3;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[3]			<=0;																
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>8)||(active_out_up_levels>8)||(active_out_down_levels>8))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR34;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels<8&&active_in_levels>0)||(active_out_up_levels<8&&active_out_up_levels>0)||(active_out_down_levels<8&&active_out_down_levels>0))begin//ale wieksze od 1 
									state		<=CLOSE;
									saved_state	<=FLOOR23;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin//diff dir
							if((active_in_levels>8)||(active_out_up_levels>=8)||(active_out_down_levels>8))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR34;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels<8&&active_in_levels>0)||(active_out_up_levels<8&&active_out_up_levels>0)||(active_out_down_levels<=8&&active_out_down_levels>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR23;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end//FLOOR3
				
				FLOOR34: begin	
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin
						if(direction) begin //direction up
							if((active_in_levels[4] == 1)||(active_out_up_levels[4] == 1)) begin
								state	<=FLOOR4; 	//go up to the full floor
								engine	<=0;
								inactivate_in_levels[4]		<=1;
								inactivate_out_up_levels[4] <=1;
							end	
							else if((active_out_down_levels[4]==1)&&(active_out_up_levels[4]!=1)&&(active_in_levels<32))begin
								state		<=FLOOR4;	//request z 3p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[4]			<=1;					
								inactivate_out_down_levels[4] 	<=1;
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
								inactivate_in_levels[3]			<=1;
								inactivate_out_down_levels[3] 	<=1;
							end	
							else if((active_out_up_levels[3]==1)&&(active_out_down_levels[3]!=1)&&(active_in_levels>32))begin
								state		<=FLOOR3;	//request z 2p zeby jechac na 1p a potem gora
								engine		<=0;
								direction	<=1;
								inactivate_in_levels[3]		<=1;					
								inactivate_out_up_levels[3] <=1;
							end				
							else begin
								state<=FLOOR23;
								engine<=2;
							end	
						end
					end	
					else begin
						state<=FLOOR34;
					end	
				end
				
				FLOOR4: begin
					level_display=4;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR4;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[4]			<=0;
						inactivate_out_up_levels[4]		 =1;
						inactivate_out_down_levels[4]	 =1;								
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>16)||(active_out_up_levels>16)||(active_out_down_levels>16))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR45;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels<16)||(active_out_up_levels<16)||(active_out_down_levels<16))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR34;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin//diff dir
							if((active_in_levels>16)||(active_out_up_levels>16)||(active_out_down_levels>16))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR45;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels<16)||(active_out_up_levels<16)||(active_out_down_levels<16))begin //todo
								state		<=CLOSE;
								saved_state	<=FLOOR34;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end//FLOOR4
				
				FLOOR45: begin	
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin
						if(direction) begin //direction up
							if((active_in_levels[5] == 1)||(active_out_up_levels[5] == 1)) begin
								state	<=FLOOR5; 	//go up to the full floor
								engine	<=0;
								inactivate_in_levels[5]		<=1;							
								inactivate_out_up_levels[5] <=1;
							end
							else if((active_out_down_levels[5]==1)&&(active_out_up_levels[5]!=1)&&(active_in_levels<64))begin
								state		<=FLOOR5;	//request z 3p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[5]			<=1;					
								inactivate_out_down_levels[5] 	<=1;
							end							
							else begin
								state<=FLOOR56;
								engine<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[4] == 1)||(active_out_down_levels[4] == 1)) begin
								state	<=FLOOR4; 	//go down to the full floor
								engine	<=0;
								inactivate_in_levels[4]			<=1;					
								inactivate_out_down_levels[4] 	<=1;
							end	
							else if((active_out_up_levels[4]==1)&&(active_out_down_levels[4]!=1)&&(active_in_levels>64))begin
								state		<=FLOOR4;	//request z 2p zeby jechac na 1p a potem gora
								engine		<=0;
								direction	<=1;
								inactivate_in_levels[4]		<=1;					
								inactivate_out_up_levels[4] <=1;
							end						
							else begin
								state<=FLOOR34;
								engine<=2;
							end	
						end
					end	
					else begin
						state<=FLOOR45;
					end		
				end
				
				FLOOR5: begin
					level_display=5;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR5;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[5]			<=0;
						inactivate_out_up_levels[5]		 =1;
						inactivate_out_down_levels[5]	 =1;											
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>32)||(active_out_up_levels>32)||(active_out_down_levels>32))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR56;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels<32)||(active_out_up_levels<32)||(active_out_down_levels<32))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR45;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin//diff dir
							if((active_in_levels>32)||(active_out_up_levels>32)||(active_out_down_levels>32))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR56;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels<32)||(active_out_up_levels<32)||(active_out_down_levels<32))begin //todo
								state		<=CLOSE;
								saved_state	<=FLOOR45;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end//FLOOR5
				
				FLOOR56: begin	
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin
						if(direction) begin //direction up
							if((active_in_levels[6] == 1)||(active_out_up_levels[6] == 1)) begin
								state<=FLOOR6; 	//go up to the full floor
								engine<=0;
								inactivate_in_levels[6]		<=1;	
								inactivate_out_up_levels[6] <=1;
							end	
							else if((active_out_down_levels[6]==1)&&(active_out_up_levels[6]!=1)&&(active_in_levels<128))begin
								state		<=FLOOR6;	//request z 3p zeby jechac na dol
								engine		<=0;
								direction	<=0;
								inactivate_in_levels[6]			<=1;					
								inactivate_out_down_levels[6] 	<=1;
							end						
							else begin
								state<=FLOOR67;
								engine<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[5] == 1)||(active_out_down_levels[5] == 1)) begin
								state	<=FLOOR5; 	//go down to the full floor
								engine	<=0;
								inactivate_in_levels[5]			<=1;					
								inactivate_out_down_levels[5] 	<=1;							
							end	
							else if((active_out_up_levels[5]==1)&&(active_out_down_levels[5]!=1)&&(active_in_levels>128))begin
								state		<=FLOOR5;	//request z 2p zeby jechac na 1p a potem gora
								engine		<=0;
								direction	<=1;
								inactivate_in_levels[5]		<=1;					
								inactivate_out_up_levels[5] <=1;
							end						
							else begin
								state<=FLOOR45;
								engine<=2;
							end	
						end
					end	
					else begin
						state<=FLOOR56;
					end					
				end
				
				FLOOR6: begin
					level_display=6;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR6;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[6]			<=0;
						inactivate_out_up_levels[6]		<=0;
						inactivate_out_down_levels[6]	<=0;																			
					end 
					else begin
						if(direction==last_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>64)||(active_out_up_levels>64)||(active_out_down_levels>64))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR67;
									engine		<=2;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels<64)||(active_out_up_levels<64)||(active_out_down_levels<64))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR56;
									engine		<=1;
								end	
								else begin
									counter	<=counter+1;
									engine	<=0;
									if(counter==4) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end	
									else
										state	<=WAIT;
								end
							end
						end 
						else begin//diff dir
							if((active_in_levels>64)||(active_out_up_levels>64)||(active_out_down_levels>64))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR67;
								direction	<=1;
								engine		<=2;
							end	
							else if((active_in_levels<64)||(active_out_up_levels<64)||(active_out_down_levels<64))begin //todo
								state		<=CLOSE;
								saved_state	<=FLOOR56;
								direction	<=0;
								engine		<=1;
							end
							else begin
								state	<=IDLE;
								counter	<=0;
							end
						end		
					end		
				end//FLOOR6
				
				FLOOR67: begin	
					letout			<=0;
					last_direction	<=direction;
					if(sensor_up&&sensor_down) begin
						if(direction) begin //direction up
							state<=FLOOR7; 	//go up to the full floor
							engine<=0;
							inactivate_in_levels[7] 		<=1;
							inactivate_out_up_levels[7] 	<=1;
							inactivate_out_down_levels[7] 	<=1;
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
					else begin
						state<=FLOOR67;
					end		
				end
				
				FLOOR7: begin
					level_display=7;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR7;
						last_direction					<=direction;
						letout							<=1;
						inactivate_in_levels[7]			<=0;
						inactivate_out_up_levels[7]		<=0; //no up, last floor
						inactivate_out_down_levels[7]	<=0;				
					end 
					else begin
						if((active_in_levels>0)||(active_out_down_levels>0)||(active_out_up_levels>0)) begin 
							state		<=FLOOR67;
							direction   <=0;
							engine		<=2;
							letout		<=0;
						end	
						else if(open_btn)	
							state<=OPEN;
					end	
				end
			
				IDLE: begin
					if(counter==9)
						state<=saved_state;
					else begin
						state<=IDLE;
						counter	<=counter+1;
					end 
				end
				
		
				OPEN: begin
					if(!sensor_door)begin //0 means opened OPENED
						door <=0;
						if(closing==1) begin
							state<=CLOSE;
						end	
						else begin		
							state<=WAIT; //
						end
					end			
					else begin//NOT OPENED YET	
						door <=1;
						state<=OPEN;
					end			
				end
			
				CLOSE: begin
					if((sensor_inside)||(overload)) begin//0 - not covered 1 - covered
						state<=OPEN;
						closing<=1;
					end	
					else begin
						if(sensor_door) begin //1 means closed 
							door <=0;
							state<=WAIT;
							closing<=0;
						end
						else begin
							closing<=1;
							if(open_btn) begin
								state<=OPEN;
							end	
							else begin
								door <=2;
								state<=CLOSE;
							end	
						end
					end	
				end	
			
				WAIT: begin
					state<= saved_state;

				end
			
				default: 
					state<=FLOOR0;
					
			endcase
		end	
	end

endmodule 
//elevator