//elevator
module elevator
#(
parameter BUTTONS_WIDTH = 6

)
(
	input CLK,
	input RESET,
	input OPEN,
	input CLOSE,
	input SERVICE,
	input WEIGHT_CHECK,
	input FAN,
	input [BUTTONS_WIDTH-1:0] BTN_NUM_IN, // wewnatrz windy
	input [BUTTONS_WIDTH-1:0] BTN_UP_OUT, //na zewnatrz do gory
	input [BUTTONS_WIDTH-1:0] BTN_DOWN_OUT,//na zewnatrz na dół
	output reg [1:0] ENGINE_UP,
	output reg [1:0] ENGINE_DOWN,
	output reg [BUTTONS_WIDTH-1:0] LEVEL_DISPLAY
);
    
	reg [BUTTONS_WIDTH-1:0] CURRENT_LEVEL;
	reg [BUTTONS_WIDTH-1:0] ACTIVE_LEVELS;
	
	
    always @(posedge CLK or RESET)
        if(RESET)
            begin      
				ENGINE_UP <= 2b'00;
				ENGINE_DOWN <= 2b'00;
            end
		else
			begin	
			
			
			
			
			
			end


endmodule //elevator