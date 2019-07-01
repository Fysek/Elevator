# ####################################################################

#  Created by Genus(TM) Synthesis Solution 16.12-s027_1 on Sat Jun 29 23:39:03 +0200 2019

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design elevator

create_clock -name "clk" -add -period 100000.0 -waveform {0.0 50000.0} [get_ports clock]
set_clock_transition 0.9 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_down_out[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_up_out[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {btn_in[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {sensor_door[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {sensor_door[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports sensor_inside]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports sensor_down]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports sensor_up]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports bell]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports overload]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports close_btn]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports open_btn]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports buttons_block]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports an_reset]
set_input_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports clock]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {level_display[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {level_display[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {level_display[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {level_display[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports bell_out]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports direction]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {door[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {door[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {engine[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 200.0 [get_ports {engine[1]}]
set_wire_load_selection_group "foo" -library "UofU_Digital_v1_2"
