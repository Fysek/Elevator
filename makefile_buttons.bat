iverilog -o buttons buttons.v 
iverilog -o buttons_tb buttons_tb.v
vvp buttons_tb
gtkwave buttons_tb.vcd