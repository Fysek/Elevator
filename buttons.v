//buttons
module buttons
#(
parameter BUTTONS_WIDTH = 8

)
(
	input clk,
	input reset,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg [BUTTONS_WIDTH-1:0] active_in_levels,
	output reg [BUTTONS_WIDTH-1:0] active_out_up_levels,
	output reg [BUTTONS_WIDTH-1:0] active_out_down_levels
);

	reg [BUTTONS_WIDTH-1:0] reg_active_in_levels;// te które są wcisnete wewnatrz
	reg [BUTTONS_WIDTH-1:0] reg_active_out_up_levels;// te które są wcisnete na zew
	reg [BUTTONS_WIDTH-1:0] reg_active_out_down_levels;// te które są wcisnete na zew

	
	always @(*) 
	begin
		if(!reset) begin
			reg_active_in_levels=0;
			reg_active_out_up_levels=0;
			reg_active_out_down_levels=0;
		end
	
	    for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
			if(btn_num_in[index] == 1) begin
				reg_active_in_levels[index] = 1;
			end
		end
		
		for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
			if(btn_up_out[index] == 1) begin
				reg_active_out_up_levels[index] = 1;
			end
		end
		
		for(index=0; index<BUTTONS_WIDTH; index=index+1) begin
			if(btn_down_out[index] == 1) begin
				reg_active_out_down_levels[index] = 1;
			end
		end
		
		active_in_levels = reg_active_in_levels;
		active_out_up_levels = reg_active_out_up_levels;
		active_out_down_levels = reg_active_out_down_levels;
		
		
	end	

endmodule 
//buttons