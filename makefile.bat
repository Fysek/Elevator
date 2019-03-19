iverilog -o elevator elevator.v 
iverilog -o elevator_tb elevator_tb.v
vvp elevator_tb
gtkwave elevator_tb.vcd