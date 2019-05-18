//test_module

module test_module
#(
parameter BUTTONS_WIDTH = 8,
parameter DELAY_ENGINE = 10,
parameter DELAY_DOOR = 10
)
(
	input 				clk				,
	input 				reset			,	
	input  		[1:0] 	engine			,	//0 - idle 1 - down 2 - up
	input 	 	[1:0] 	door			,	//0 - idle 1 - open 2 - close
	output reg	[1:0] 	sensor_door 	,	//0 - between 1 - open 2 - close
	output reg 			sensor_up		,	//0 - not reached 1 - reached | sensor inside elevator 
	output reg 			sensor_down 		//0 - not reached 1 - reached | to get the position


);
    
	reg [1:0] last_engine;
	reg [1:0] last_door;
	
	integer counter_engine;
	integer counter_door;
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset) begin
			counter_door 	<=0;
			counter_engine 	<=0;
			last_engine		<=0;
			last_door   	<=0;
			sensor_up		<=0;
			sensor_down		<=0;
			sensor_door		<=0;
		end	
		else begin
			//engine
			if(engine>0)begin
				if(engine==last_engine) begin
					if(counter_engine==DELAY_ENGINE) begin
						sensor_up		<=1;
						sensor_down		<=1;
						counter_engine	<=0;
					end
					else begin
						sensor_up		<=0;
						sensor_down		<=0;
						counter_engine	<=counter_engine+1;
					end	
				end	
			end	
			else begin 
				counter_engine	<=0;
			end	
			//door
			if(door>0)begin		
				if(door==last_door) begin	
					if(counter_door==DELAY_DOOR) begin
						sensor_door		<=door;
						counter_door	<=0;
					end
					else begin
						sensor_door		<=0;
						counter_door	<=counter_door+1;
					end	
				end	
			end	
			else begin 
				sensor_door		<=0;
				counter_door	<=0;
			end
			//last
			last_engine<=engine;
			last_door<=door;
		end	
	end

endmodule 
//test_module
