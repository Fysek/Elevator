//elevator

module elevator_tb();
reg clk,reset,inG,in1,in2,in3,in4,in5,in6,in7,inopen,inclose;
wire open,close,up,down;

reg[7:0] ins;
elevator DUT(clk,rst,inG,in1,in2,in3,in4,in5,in6,in7,inopen,inclose,open,close,up,down);