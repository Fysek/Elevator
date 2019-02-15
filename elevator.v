//elevator

module elevator
#(
parameter BUTTONS_WIDTH = 6

)
(
	input clk,
	input reset,
	input open,
	input close,
	input service,
	input weight_check,
	input fan,
	input [BUTTONS_WIDTH-1:0] btn_num_in, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] btn_up_out, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] btn_down_out,//na zewnatrz na dół
	output reg [1:0] engine_up,
	output reg [1:0] engine_down,
	output reg [BUTTONS_WIDTH-1:0] level_display
);
    
	reg [BUTTONS_WIDTH-1:0] current_level;
	reg [BUTTONS_WIDTH-1:0] active_levels;// te które są wcisnete
	
	reg[2:0] state, next_state;
	parameter IDLE=3'b000, OPEN=3'b001, CLOSE=3'd010, UP=3'b011,DOWN=3'b100,WAIT=3'b101;
	
	reg[2:0] floor,nfloor;
	parameter G=3'b000,F1=3'b001,F2=3'b010,F3=3'b011,F4=3'b100,F5=3'b101,F6=3'b110,F7=3'b111;
	
	always@(posedge clk or negedge rst)
		begin
			state<=rst?nstate:IDLE;
			if(!rst) 
				pfloor=G;
			else if(state==OPEN)
				floor=next_floor;
		end
	
	

	
    always @(posedge clk or reset)
        if(reset)
            begin      
				engine_up <= 2'b00;
				engine_down <= 2'b00;
            end
		else
			begin	
			
			
			
			
			
			end
endmodule //elevator