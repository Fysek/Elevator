
//buttons
module buttons_res
#(
parameter BUTTONS_WIDTH = 8

)
(
	input							clock,
	input							an_reset,
	input 		[BUTTONS_WIDTH-1:0] btn_in, 				//wewnatrz windy
	input 		[BUTTONS_WIDTH-2:0] btn_up_out, 			//na zewnatrz do gory
	input 		[BUTTONS_WIDTH-1:1] btn_down_out,			//na zewnatrz na dół
	input 		[BUTTONS_WIDTH-1:0] inactivate_in_levels, 
	input 		[BUTTONS_WIDTH-2:0] inactivate_out_up_levels,
	input 		[BUTTONS_WIDTH-1:1] inactivate_out_down_levels,
	output reg 	[BUTTONS_WIDTH-1:0] active_in_levels,
    output reg 	[BUTTONS_WIDTH-2:0] active_out_up_levels,
	output reg 	[BUTTONS_WIDTH-1:1] active_out_down_levels
);
	reg [3:0] 				index;
	reg [BUTTONS_WIDTH-1:0] buttons_state;			//oznacza rejestr ostatniego stanu przycisków
	reg [BUTTONS_WIDTH-1:0] l_btn_in;				//rejestr z poprzednim stanem
	reg [BUTTONS_WIDTH-1:0] l_inactivate_in_levels;	//rejestr z poprzednim stanem
	wire [BUTTONS_WIDTH-1:0] l_active_in_levels;	//rejestr z poprzednim stanem
		
	assign 	l_active_in_levels=active_in_levels;
		
	always @(posedge clock or negedge an_reset) begin
		if(!an_reset) begin
			l_btn_in 				=0;
			l_inactivate_in_levels 	=0;
			active_in_levels 		=0;
			buttons_state			=8'hFF;
		end
		else begin
			for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
				if (inactivate_in_levels[index] == 1) begin
					if (l_inactivate_in_levels[index] == 0) begin
						if (l_active_in_levels[index] == 1) begin
							active_in_levels[index] = 0;
							buttons_state[index]=!buttons_state[index];
						end	
					end	
				end	
				else begin 	
					if(btn_in[index] == 1) begin
						if(l_btn_in[index] == 0) begin				
							if(buttons_state[index]) begin
								active_in_levels[index] = 1;
							end		
							else begin 
								active_in_levels[index] = 0;
							end	
							buttons_state[index]=!buttons_state[index];								
						end	
					end	
				end	
				l_btn_in[index] = btn_in[index];
				l_inactivate_in_levels[index] = inactivate_in_levels[index];
			end	
		end	
	end		

	always @(*) begin
		if(!an_reset) begin
			active_out_up_levels	=0;
			active_out_down_levels	=0;
		end
		else begin
			for(index=0; index<BUTTONS_WIDTH-1; index=index+1) begin
				//up
				if(btn_up_out[index] == 1) begin
					active_out_up_levels[index] = 1;
				end else if (inactivate_out_up_levels[index] == 1) begin
					active_out_up_levels[index] = 0;
				end
			end	
			for(index=1; index<BUTTONS_WIDTH; index=index+1) begin	
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