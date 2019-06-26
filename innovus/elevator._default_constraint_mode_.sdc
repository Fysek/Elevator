# ####################################################################

#  Created by Genus(TM) Synthesis Solution 16.12-s027_1 on Sun Jun 16 00:25:37 +0200 2019

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1.0fF
set_units -time 1000.0ps

# Set the current design
current_design elevator

create_clock -name "clock" -add -period 0.001 -waveform {0.0 0.0005} [get_ports clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_down_out[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_up_out[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {btn_in[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {sensor_door[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports {sensor_door[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports sensor_inside]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports sensor_down]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports sensor_up]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports bell]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports overload]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports close_btn]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports open_btn]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports buttons_block]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports an_reset]
set_input_delay -clock [get_clocks clock] -add_delay 0.02 [get_ports clock]
set_dont_use [get_lib_cells NangateOpenCellLibrary/ANTENNA_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X2]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X4]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X8]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X16]
set_dont_use [get_lib_cells NangateOpenCellLibrary/FILLCELL_X32]
set_dont_use [get_lib_cells NangateOpenCellLibrary/LOGIC0_X1]
set_dont_use [get_lib_cells NangateOpenCellLibrary/LOGIC1_X1]
