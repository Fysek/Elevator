//test_module

module test_module
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

	reg[4:0] state, saved_state, move_state;
	
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
			
			
		end	
	end

endmodule 
//test_module