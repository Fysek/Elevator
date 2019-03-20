//buttons
module buttons
#(
parameter BUTTONS_WIDTH = 8

)
(
	input							reset,
	input		[3:0]			    buttons_blocked, //F - all unblocked
	input 		[BUTTONS_WIDTH-1:0] btn_in, // wewnatrz windy
	input 		[BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input 		[BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	input 		[BUTTONS_WIDTH-1:0] inactivate_in_levels, 
	input 		[BUTTONS_WIDTH-1:0] inactivate_out_up_levels,
	input 		[BUTTONS_WIDTH-1:0] inactivate_out_down_levels,
	output reg 	[BUTTONS_WIDTH-1:0] active_in_levels,
    output reg 	[BUTTONS_WIDTH-1:0] active_out_up_levels,
	output reg 	[BUTTONS_WIDTH-1:0] active_out_down_levels
);
	reg [3:0] index;
	reg [BUTTONS_WIDTH-1:0] enable;

	always @(posedge btn_in[0] or posedge btn_in[1] or posedge btn_in[2] or posedge btn_in[3] or posedge btn_in[4] or posedge btn_in[5] 
	or posedge btn_in[6] or posedge btn_in[7] or negedge reset) begin
		if(!reset) begin
			active_in_levels		=0;
			active_out_up_levels	=0;
			active_out_down_levels	=0;
			enable					=8'hFF;
		end
		else begin
			for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
				//in
				if(buttons_blocked!=index) begin
					if(btn_in[index] == 1) begin
						if(enable[index]) //reakcja na zbocze
							active_in_levels[index] = 1;	
						else 
							active_in_levels[index] = 0;
						enable[index]=!enable[index];								
					end
				end	
			end	
		end	
	end	
	
	always @(posedge inactivate_in_levels[0] or posedge inactivate_in_levels[1] or posedge inactivate_in_levels[2] or posedge inactivate_in_levels[3] 
	or posedge inactivate_in_levels[4] or posedge inactivate_in_levels[5] or posedge inactivate_in_levels[6] or posedge inactivate_in_levels[7] ) begin
		for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
			if (inactivate_in_levels[index] == 1) begin
				active_in_levels[index] = 0;
				enable[index]=!enable[index];
			end		
		end		
	end	
	
	always @(*) 
	begin
		for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
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
endmodule 
//buttons