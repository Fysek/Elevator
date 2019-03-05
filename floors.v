//floors

module floors
#(
parameter BUTTONS_WIDTH = 6

)
(
	input clk,
	input reset,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	//reg [BUTTONS_WIDTH-1:0] current_level;
	//reg [BUTTONS_WIDTH-1:0] active_in_levels;// te które są wcisnete wewnatrz
	//reg [BUTTONS_WIDTH-1:0] active_out_levels;// te które są wcisnete na zew
	//reg reached,overload=0;
	
	reg[2:0] floor;

	
	
	always@(posedge clk or negedge reset)
	
/*	
	always @(posedge clk or negedge reset) 
	begin
	
		next_floor?
		active_in_levels
		active_out_levels
	end
*/	

/*		
	always @(*) 
	begin

	btn_num_in
	btn_up_out
	btn_down_out
	end
*/	

endmodule 
//floors