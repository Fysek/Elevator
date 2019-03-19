//buttons
module buttons
#(
parameter BUTTONS_WIDTH = 8

)
(
	input							reset,
	input		[4:0]			    buttons_blocked,
	input 		[BUTTONS_WIDTH-1:0] btn_in, // wewnatrz windy
	input 		[BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input 		[BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	input 		[BUTTONS_WIDTH-1:0] inactivate_in_levels, 
	input 		[BUTTONS_WIDTH-1:0] inactivate_out_up_levels,
	input 		[BUTTONS_WIDTH-1:0] inactivate_out_down_levels,
	output reg 	[BUTTONS_WIDTH-1:0] active_in_levels,
    output reg 	[BUTTONS_WIDTH-1:0] active_out_up_levels,
	output reg 	[BUTTONS_WIDTH-1:0] active_out_down_levels,
	output reg 	[BUTTONS_WIDTH-1:0] enable
);
	reg [3:0] index;
	//reg [BUTTONS_WIDTH-1:0] enable;
	
	always @(*) 
	begin
		if(!reset) begin
			active_in_levels		=0;
			active_out_up_levels	=0;
			active_out_down_levels	=0;
			enable					=8'hFF;
		end
		else begin
			for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
				//in
				if(buttons_blocked!=index+1) begin
					if(btn_in[index] == 1) begin
						if(posedge enable[index]) //reakcja na zbocze
							active_in_levels[index] = 1;			
						else 
							active_in_levels[index] = 0;
						enable[index]=!enable[index];						
					end
				end	
				
				if (inactivate_in_levels[index] == 1) begin
					active_in_levels[index] = 0;
				end
					
				//up
				if(btn_up_out[index] == 1) begin
					active_out_up_levels[index] = 1;
				end else if (inactivate_out_up_levels[index] == 1) begin
					active_out_up_levels[index] = 0;
				end
				//down
				if(btn_down_out[index] == 1) begin
					active_out_down_levels[index] = 1;
				end else if (inactivate_out_down_levels[index] == 1) begin
					active_out_down_levels[index] = 0;
				end
			end
			
		end
	end	
endmodule 
//buttons