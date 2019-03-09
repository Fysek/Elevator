//buttons
module buttons
#(
parameter BUTTONS_WIDTH = 8

)
(
	input clk,
	input reset,
	input [BUTTONS_WIDTH-1:0] btn_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	input [BUTTONS_WIDTH-1:0] inactive_in_levels, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] inactive_out_up_levels, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] inactive_out_down_levels,//na zewnatrz na dół
	output reg [BUTTONS_WIDTH-1:0] active_in_levels,
	output reg [BUTTONS_WIDTH-1:0] active_out_up_levels,
	output reg [BUTTONS_WIDTH-1:0] active_out_down_levels
);

	integer index;
	
	always @(posedge clk or negedge reset) 
	begin
		if(!reset) begin
			active_in_levels<=0;
			active_out_up_levels<=0;
			active_out_down_levels<=0;
		end
		else begin
			for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
				//in
				if(btn_in[index] == 1) begin
					active_in_levels[index] <= 1;
				end
				else if (inactive_in_levels[index] == 1) begin
					active_in_levels[index] <= 0;
				end
				//up
				if(btn_up_out[index] == 1) begin
					active_out_up_levels[index] <= 1;
				end else if (inactive_out_up_levels[index] == 1) begin
					active_out_up_levels[index] <= 0;
				end
				//down
				if(btn_down_out[index] == 1) begin
					active_out_down_levels[index] <= 1;
				end else if (inactive_out_down_levels[index] == 1) begin
					active_out_down_levels[index] <= 0;
				end
			end				
		end
	end	
endmodule 
//buttons