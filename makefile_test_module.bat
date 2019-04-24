iverilog -o test_module test_module.v 
iverilog -o test_module_tb test_module_tb.v
vvp test_module_tb
gtkwave test_module_tb.vcd