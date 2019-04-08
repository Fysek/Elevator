iverilog -o buttons buttons_res.v 
iverilog -o buttons_tb buttons_res_tb.v
vvp buttons_tb
gtkwave buttons_tb.vcd