`include "buttons_res.v"

module elevator
#(
parameter BUTTONS_WIDTH = 8, 
parameter DELAY_IDLE = 5000, //idle state time ~5s=5000
parameter DELAY_WAIT = 500, //wait to change dir time ~500ms 
parameter DELAY_OPEN = 6000  //wait after open ~6s
)
(
	input 							clk			,
	input 							an_reset		,
	input 							buttons_block	,
	input 							open_btn		,
	input 							close_btn		,
	input 							overload		,
	input 							bell			,
	input 							sensor_up		,	//0 - not reached 1 - reached | sensor inside elevator 
	input 							sensor_down 	,	//0 - not reached 1 - reached | to get the position
	input 							sensor_inside 	,	//0 - not covered 1 - covered | covered sensor, door must be open
	input 		[1:0] 				sensor_door 	,	//0 - between 1 - open 2 - close
	input 		[BUTTONS_WIDTH-1:0] btn_in 			,
	input 		[BUTTONS_WIDTH-2:0] btn_up_out		, 	//na zewnatrz do gory
	input 		[BUTTONS_WIDTH-1:1] btn_down_out	,	//na zewnatrz na dó³
	output reg 	[1:0] 				engine			,	//0 - idle 1 - down 2 - up
	output reg 	[1:0] 				door			, 	//0 - idle 1 - open 2 - close
	output reg 						direction		,	//0 - down, 1 - up
	output reg 						bell_out		,	//0 - off, 1 - on
	output reg 	[3:0] 				level_display	
	
);
    
	reg 		closing;			//special flag when doors are closing
	reg 		opening;			//special flag when doors are opening 
	reg 		waiting;			//special flag for wait when people are leaving	 
	reg 		letout;				//0 - down, 1 - up
	reg 		i_direction;		//0 - down, 1 - up
	reg [1:0]	i_engine;			//0 - idle 1 - down 2 - up saved state of engine, sent after door closed
	reg [15:0] 	counter;			//wait and idle counter
	wire 		reached;			//assign reached=sensor_down&&sensor_up;
	
	//buttons regs
	reg  [BUTTONS_WIDTH-1:0] inactivate_in_levels;
	reg  [BUTTONS_WIDTH-2:0] inactivate_out_up_levels;
	reg  [BUTTONS_WIDTH-1:1] inactivate_out_down_levels;
	wire [BUTTONS_WIDTH-1:0] active_in_levels;
	wire [BUTTONS_WIDTH-2:0] active_out_up_levels;
	wire [BUTTONS_WIDTH-1:1] active_out_down_levels;
	//end buttons regs
	
	reg[4:0] state, saved_state;
	
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
		.clk						(clk)							,
		.an_reset					(an_reset)						,
		.buttons_block				(buttons_block)					,
		.btn_in						(btn_in)						,
		.btn_up_out					(btn_up_out)					,
		.btn_down_out				(btn_down_out)					,
		.inactivate_in_levels		(inactivate_in_levels)			,
		.inactivate_out_up_levels	(inactivate_out_up_levels)		,
		.inactivate_out_down_levels	(inactivate_out_down_levels)	,
		.active_in_levels			(active_in_levels)				,
		.active_out_up_levels		(active_out_up_levels)			,
		.active_out_down_levels		(active_out_down_levels)
		);
		
	
	assign reached=sensor_down&&sensor_up;
	
	always@(posedge clk or negedge an_reset)
	begin
		if(!an_reset) begin
			bell_out<=0;
		end
		else begin
			if(bell)
				bell_out<=1;
			else
				bell_out<=0;
		end	
	end
	
	always@(posedge clk or negedge an_reset)
	begin
		if(!an_reset) begin
			engine 						<=0;
			i_direction					<=0;
			letout						<=0;
			door						<=0;
			counter						<=0;
			inactivate_in_levels 		<=0;
			inactivate_out_up_levels 	<=0;
			inactivate_out_down_levels	<=0;
			closing						<=0; 
			waiting						<=0;
			opening						<=0;
			direction   				<=0;										    
			state 						<=saved_state;
		end
		else if(buttons_block)begin
			door						<=0;
			engine						<=0; 
			inactivate_in_levels 		<=8'hFF;
			inactivate_out_up_levels 	<=7'h7F;
			inactivate_out_down_levels	<=7'h7F;
			level_display				=15;
		end
		else begin
			case(state)
				FLOOR0: begin
					level_display=0;	
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR0;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[0]			<=0;
						inactivate_out_up_levels[0]		<=0;
					end 
					else begin												
						if((active_in_levels>1)||(active_out_up_levels>0)||(active_out_down_levels>0)) begin 
							state		<=CLOSE;
							saved_state	<=FLOOR01;
							waiting		<=1;
							direction   <=1;
							i_engine	<=2;
						end	
						else 
							state	<=IDLE;
					end	
				end

				FLOOR01: begin
					letout		<=0;
					i_direction	<=direction;
					level_display=0;
					if(reached) begin	
						if(direction) begin //direction up
							if((active_in_levels[1]==1)||(active_out_up_levels[1]==1&&!overload)) begin
								state						<=FLOOR1;	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[1]		<=1;
								inactivate_out_up_levels[1] <=1;
							end	
							else if((active_out_down_levels[1]==1)&&(active_out_down_levels<2)&&(active_out_up_levels<2)&&(active_in_levels<4))begin
								state							<=FLOOR1;	//request z 1p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[1]			<=1;					
								inactivate_out_down_levels[1] 	<=1;
							end
							else begin
								state		<=FLOOR12;
								saved_state	<=FLOOR12;
								i_engine	<=2;
							end	
						end
						else begin	//	direction down
							state							<=FLOOR0;		//go down to the full floor
							engine							<=0;
							inactivate_in_levels[0]			<=1; 
							inactivate_out_up_levels[0]		<=1;										
						end
					end
					else begin
						state	<=FLOOR01;
						engine	<=i_engine;
					end	
				end
				
				FLOOR1: begin
					level_display=1;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR1;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[1]			<=0;
						inactivate_out_up_levels[1] 	<=0;
						inactivate_out_down_levels[1] 	<=0;
					end 
					else begin					
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>3)||(active_out_up_levels>3)||(active_out_down_levels>1))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR12;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state		<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[0]==1)||(active_out_up_levels[0]==1))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR01;
									waiting		<=1;
									i_engine	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>3)||(active_out_up_levels>3)||(active_out_down_levels>1))begin//up
								state		<=CLOSE;
								saved_state	<=FLOOR12;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[0]==1)||(active_out_up_levels[0]==1))begin//down
								state		<=CLOSE;
								saved_state	<=FLOOR01;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end
				
				FLOOR12: begin
					letout		<=0;
					i_direction	<=direction;
					level_display=1;
					if(reached) begin					
						if(direction) begin //direction up
							if((active_in_levels[2]==1)||(active_out_up_levels[2]==1&&!overload)) begin
								state						<=FLOOR2;	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[2]		<=1;
								inactivate_out_up_levels[2] <=1;
							end	
							else if((active_out_down_levels[2]==1)&&(active_out_down_levels<4)&&(active_out_up_levels<4)&&(active_in_levels<8))begin
								state							<=FLOOR2;//request z 2p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[2]			<=1;					
								inactivate_out_down_levels[2] 	<=1;
							end																	
							else begin
								state		<=FLOOR23;
								saved_state	<=FLOOR23;
								i_engine	<=2;
							end	
						end
						else begin//direction 0
							if((active_in_levels[1]==1)||(active_out_down_levels[1]==1&&!overload)) begin
								state							<=FLOOR1; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[1]			<=1;
								inactivate_out_down_levels[1] 	<=1;
							end	
							else if((active_out_up_levels[1]==1)&&(active_out_up_levels[0]==0)&&(active_in_levels[0]==0))begin
								state						<=FLOOR1;//request z 2p zeby jechac na 1p
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[1]		<=1;					
								inactivate_out_up_levels[1] <=1;
							end	
							else begin
								state		<=FLOOR01;
								saved_state	<=FLOOR01;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR12;
						engine	<=i_engine;
					end	
				end	
				
				FLOOR2: begin
					level_display=2;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR2;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[2]			<=0;
						inactivate_out_up_levels[2]		<=0;
						inactivate_out_down_levels[2]	<=0;							
					end 
					else begin
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up			
								if((active_in_levels>7)||(active_out_up_levels>7)||(active_out_down_levels>3))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR23;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[1:0]>0)||(active_out_up_levels[1:0]>0)||(active_out_down_levels[1]>0))begin
									state		<=CLOSE;
									saved_state	<=FLOOR12;
									waiting		<=1;
									i_engine	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>7)||(active_out_up_levels>7)||(active_out_down_levels>3))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR23;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[1:0]>0)||(active_out_up_levels[1:0]>0)||(active_out_down_levels[1]>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR12;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end//FLOOR2
					
				FLOOR23: begin
					letout		<=0;
					i_direction	<=direction;
					level_display=2;
					if(reached) begin
						if(direction) begin //direction up
							if((active_in_levels[3]==1)||(active_out_up_levels[3]==1&&!overload)) begin
								state						<=FLOOR3; 	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[3]		<=1;
								inactivate_out_up_levels[3] <=1;
							end	
							else if((active_out_down_levels[3]==1)&&(active_out_down_levels<8)&&(active_out_up_levels<8)&&(active_in_levels<16))begin
								state							<=FLOOR3;	//request z 3p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[3]			<=1;					
								inactivate_out_down_levels[3] 	<=1;
							end	
							else begin
								state		<=FLOOR34;
								saved_state	<=FLOOR34;
								i_engine	<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[2]==1)||(active_out_down_levels[2]==1&&!overload)) begin
								state							<=FLOOR2; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[2]			<=1;
								inactivate_out_down_levels[2] 	<=1;
							end	
							else if((active_out_up_levels[2]==1)&&(active_out_up_levels[1:0]==0)&&(active_out_down_levels[1]==0)&&(active_in_levels[1:0]==0))begin
								state						<=FLOOR2;	//request z 2p zeby jechac na 1p a potem gora
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[2]		<=1;					
								inactivate_out_up_levels[2] <=1;
							end	
							else begin
								state		<=FLOOR12;
								saved_state	<=FLOOR12;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR23;
						engine	<=i_engine;
					end	
				end
				
				FLOOR3: begin
					level_display=3;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR3;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[3]			<=0;
						inactivate_out_up_levels[3]		<=0;
						inactivate_out_down_levels[3]	<=0;															
					end 
					else begin
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>15)||(active_out_up_levels>15)||(active_out_down_levels>7))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR34;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[2:0]>0)||(active_out_up_levels[2:0]>0)||(active_out_down_levels[2:1]>0))begin//ale wieksze od 1 
									state		<=CLOSE;
									saved_state	<=FLOOR23;
									waiting		<=1;
									i_engine 	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>15)||(active_out_up_levels>15)||(active_out_down_levels>7))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR34;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[2:0]>0)||(active_out_up_levels[2:0]>0)||(active_out_down_levels[2:1]>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR23;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end//FLOOR3
				
				FLOOR34: begin	
					letout			<=0;
					i_direction		<=direction;
					level_display	=3;
					if(reached) begin
						if(direction) begin //direction up
							if((active_in_levels[4]==1)||(active_out_up_levels[4]==1&&!overload)) begin
								state						<=FLOOR4; 	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[4]		<=1;
								inactivate_out_up_levels[4] <=1;
							end	
							else if((active_out_down_levels[4]==1)&&(active_out_down_levels<16)&&(active_out_up_levels<16)&&(active_in_levels<32))begin
								state							<=FLOOR4;	//request z 3p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[4]			<=1;					
								inactivate_out_down_levels[4] 	<=1;
							end	
							else begin
								state		<=FLOOR45;
								saved_state	<=FLOOR45;
								i_engine	<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[3]==1)||(active_out_down_levels[3]==1&&!overload)) begin
								state							<=FLOOR3; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[3]			<=1;
								inactivate_out_down_levels[3] 	<=1;
							end	
							else if((active_out_up_levels[3]==1)&&(active_out_up_levels[2:0]==0)&&(active_out_down_levels[2:1]==0)&&(active_in_levels[2:0]==0))begin
								state						<=FLOOR3;	//request z 2p zeby jechac na 1p a potem gora
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[3]		<=1;					
								inactivate_out_up_levels[3] <=1;
							end				
							else begin
								state		<=FLOOR23;
								saved_state	<=FLOOR23;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR34;
						engine	<=i_engine;
					end	
				end
				
				FLOOR4: begin
					level_display=4;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR4;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[4]			<=0;
						inactivate_out_up_levels[4]		<=0;
						inactivate_out_down_levels[4]	<=0;								
					end 
					else begin
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>31)||(active_out_up_levels>31)||(active_out_down_levels>15))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR45;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[3:0]>0)||(active_out_up_levels[3:0]>0)||(active_out_down_levels[3:1]>0))begin
									state		<=CLOSE;
									saved_state	<=FLOOR34;
									waiting		<=1;
									i_engine	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>31)||(active_out_up_levels>31)||(active_out_down_levels>15))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR45;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[3:0]>0)||(active_out_up_levels[3:0]>0)||(active_out_down_levels[3:1]>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR34;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end//FLOOR4
				
				FLOOR45: begin	
					letout		<=0;
					i_direction	<=direction;
					level_display=4;
					if(reached) begin
						if(direction) begin //direction up
							if((active_in_levels[5]==1)||(active_out_up_levels[5]==1&&!overload)) begin
								state						<=FLOOR5; 	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[5]		<=1;							
								inactivate_out_up_levels[5] <=1;
							end
							else if((active_out_down_levels[5]==1)&&(active_out_down_levels<32)&&(active_out_up_levels<32)&&(active_in_levels<64))begin
								state							<=FLOOR5;	//request z 3p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[5]			<=1;					
								inactivate_out_down_levels[5] 	<=1;
							end							
							else begin
								state		<=FLOOR56;
								saved_state	<=FLOOR56;
								i_engine	<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[4]==1)||(active_out_down_levels[4]==1&&!overload)) begin
								state							<=FLOOR4; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[4]			<=1;					
								inactivate_out_down_levels[4] 	<=1;
							end	
							else if((active_out_up_levels[4]==1)&&(active_out_up_levels[3:0]==0)&&(active_out_down_levels[3:1]==0)&&(active_in_levels[3:0]==0))begin//todo
								state						<=FLOOR4;//request z 5p zeby jechac na 4p a potem gora
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[4]		<=1;					
								inactivate_out_up_levels[4] <=1;
							end						
							else begin
								state		<=FLOOR34;
								saved_state	<=FLOOR34;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR45;
						engine	<=i_engine;
					end		
				end
				
				FLOOR5: begin
					level_display=5;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR5;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[5]			<=0;
						inactivate_out_up_levels[5]		<=0;
						inactivate_out_down_levels[5]	<=0;											
					end 
					else begin
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>63)||(active_out_up_levels>63)||(active_out_down_levels>31))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR56;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[4:0]>0)||(active_out_up_levels[4:0]>0)||(active_out_down_levels[4:1]>0))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR45;
									waiting		<=1;
									i_engine	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>63)||(active_out_up_levels>63)||(active_out_down_levels>31))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR56;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[4:0]>0)||(active_out_up_levels[4:0]>0)||(active_out_down_levels[4:1]>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR45;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end//FLOOR5
				
				FLOOR56: begin	
					letout		<=0;
					i_direction	<=direction;
					level_display=5;
					if(reached) begin
						if(direction) begin //direction up
							if((active_in_levels[6]==1)||(active_out_up_levels[6]==1&&!overload)) begin
								state						<=FLOOR6; 	//go up to the full floor
								engine						<=0;
								inactivate_in_levels[6]		<=1;	
								inactivate_out_up_levels[6] <=1;
							end	
							else if((active_out_down_levels[6]==1)&&(active_out_down_levels<64)&&(active_out_up_levels<64)&&(active_in_levels<128))begin
								state							<=FLOOR6;	//request z 6p zeby jechac na dol
								engine							<=0;
								direction						<=0;
								inactivate_in_levels[6]			<=1;					
								inactivate_out_down_levels[6] 	<=1;
							end						
							else begin
								state		<=FLOOR67;
								saved_state	<=FLOOR67;
								i_engine	<=2;
							end	
						end
						else begin//direction down
							if((active_in_levels[5]==1)||(active_out_down_levels[5]==1&&!overload)) begin
								state							<=FLOOR5; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[5]			<=1;					
								inactivate_out_down_levels[5] 	<=1;							
							end	
							else if((active_out_up_levels[5]==1)&&(active_out_up_levels[4:0]==0)&&(active_out_down_levels[4:1]==0)&&(active_in_levels[4:0]==0))begin
								state						<=FLOOR5;	//request z 5p zeby jechac na 6p a potem gora
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[5]		<=1;					
								inactivate_out_up_levels[5] <=1;
							end						
							else begin
								state		<=FLOOR45;
								saved_state	<=FLOOR45;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR56;
						engine	<=i_engine;
					end					
				end
				
				FLOOR6: begin
					level_display=6;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR6;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[6]			<=0;
						inactivate_out_up_levels[6]		<=0;
						inactivate_out_down_levels[6]	<=0;																			
					end 
					else begin
						if(direction==i_direction) begin // continue the direction
							if(direction) begin	//direction up	
								if((active_in_levels>127)||(active_out_up_levels>127)||(active_out_down_levels>63))begin 
									state		<=CLOSE;
									saved_state	<=FLOOR67;
									waiting		<=1;
									i_engine	<=2;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
										state		<=saved_state;
										direction	<=!direction;
										counter		<=0;
									end
									else
										state	<=WAIT;
								end
							end 
							else begin//direction down
								if((active_in_levels[5:0]>0)||(active_out_up_levels[5:0]>0)||(active_out_down_levels[5:1]>0))begin
									state		<=CLOSE;
									saved_state <=FLOOR56;
									waiting		<=1;
									i_engine	<=1;
								end	
								else begin
									counter	<=counter+1;
									if(counter==DELAY_WAIT) begin
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
							if((active_in_levels>127)||(active_out_up_levels>127)||(active_out_down_levels>63))begin 
								state		<=CLOSE;
								saved_state	<=FLOOR67;
								waiting		<=1;
								direction	<=1;
								i_engine	<=2;
							end	
							else if((active_in_levels[5:0]>0)||(active_out_up_levels[5:0]>0)||(active_out_down_levels[5:1]>0))begin
								state		<=CLOSE;
								saved_state	<=FLOOR56;
								waiting		<=1;
								direction	<=0;
								i_engine	<=1;
							end
							else begin
								state	<=IDLE;
							end
						end		
					end		
				end//FLOOR6
				
				FLOOR67: begin	
					letout		<=0;
					i_direction	<=direction;
					level_display=6;
					if(reached) begin
						if(direction) begin //direction up
							state							<=FLOOR7; 	//go up to the full floor
							engine							<=0;
							inactivate_in_levels[7] 		<=1;
							inactivate_out_down_levels[7] 	<=1;
						end
						else begin//direction down
							if((active_in_levels[6]==1)||(active_out_down_levels[6]==1&&!overload)) begin
								state							<=FLOOR6; 	//go down to the full floor
								engine							<=0;
								inactivate_in_levels[6]			<=1;					
								inactivate_out_down_levels[6] 	<=1;
							end	
							else if((active_out_up_levels[6]==1)&&(active_out_up_levels[5:0]==0)&&(active_out_down_levels[5:1]==0)&&(active_in_levels[5:0]==0))begin
								state						<=FLOOR6;	//request z 7p zeby jechac na 6p a potem gora
								engine						<=0;
								direction					<=1;
								inactivate_in_levels[6]		<=1;					
								inactivate_out_up_levels[6] <=1;
							end
							else begin
								state		<=FLOOR56;
								saved_state	<=FLOOR56;
								i_engine	<=1;
							end	
						end
					end	
					else begin
						state	<=FLOOR67;
						engine	<=i_engine;
					end		
				end
				
				FLOOR7: begin
					level_display=7;
					if (!letout) begin
						state							<=OPEN;
						saved_state						<=FLOOR7;
						i_direction						<=direction;
						letout							<=1;
						opening							<=1;
						inactivate_in_levels[7]			<=0;
						inactivate_out_down_levels[7]	<=0;				
					end 
					else begin
						if((active_in_levels>0)||(active_out_down_levels>0)||(active_out_up_levels>0)) begin 
							state		<=CLOSE;
							saved_state	<=FLOOR67;
							waiting		<=1;
							direction   <=0;
							i_engine	<=1;
						end	
						else
							state	<=IDLE;
					end	
				end
			
				IDLE: begin
					if(counter==DELAY_IDLE) begin
						state	<=saved_state;
						counter	<=0;			 
					end	
					else begin
						state	<=IDLE;
						counter	<=counter+1;
					end 
				end
				
		
				OPEN: begin//+close button
					if(sensor_door==1)begin //1 means opened OPENED
						door <=0;
						if(closing==1) begin
							state<=CLOSE;
						end	
						else begin		
							state<=WAIT; //
						end
					end			
					else begin//NOT OPENED YET
						if(close_btn&&!opening) begin
							state<=CLOSE;
						end	
						else begin
							door <=1;
							state<=OPEN;
						end
					end			
				end
			
				CLOSE: begin
					if(waiting) begin	
						state	<=WAIT;	
					end
					else begin
						if((sensor_inside)||(overload)) begin//0 - not covered 1 - covered
							state	<=OPEN;
							closing	<=1;
						end	
						else begin
							if(sensor_door==2) begin //2 means closed 
								door 	<=0;
								state	<=WAIT;
								closing	<=0;
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
				end	
			
				WAIT: begin	
					if(waiting||opening) begin
						if(counter==DELAY_OPEN) begin
							counter	<=0;
							if(waiting) begin
								state	<=CLOSE;//wait before close
								waiting	<=0;
							end	
							else begin
								state	<=saved_state;//wait after open
								opening	<=0;							
							end				
						end		
						else begin
							state	<=WAIT;
							counter	<=counter+1;
						end
					end
					else begin 
						state <=saved_state;
					end	
				end
			
				default: 
					state<=FLOOR0;
					
			endcase
		end	
	end

endmodule 
//elevator