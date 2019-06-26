# ####################################################################

#  Created by Genus(TM) Synthesis Solution 16.12-s027_1 on Tue Jun 25 23:54:54 +0200 2019

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design elevator

create_clock -name "clock" -add -period 100000.0 -waveform {0.0 50000.0} [get_ports clk]
set_clock_transition 0.9 [get_clocks clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_down_out[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_up_out[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {btn_in[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {sensor_door[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {sensor_door[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports sensor_inside]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports sensor_down]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports sensor_up]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports bell]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports overload]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports close_btn]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports open_btn]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports buttons_block]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports an_reset]
set_input_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports clk]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {level_display[0]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {level_display[1]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {level_display[2]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {level_display[3]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports bell_out]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports direction]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {door[0]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {door[1]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {engine[0]}]
set_output_delay -clock [get_clocks clock] -add_delay 200.0 [get_ports {engine[1]}]
set_dont_use [get_lib_cells tt_g_1v20_25c/MXI2DX1M]
set_dont_use [get_lib_cells tt_g_1v20_25c/MXI2DX2M]
set_dont_use [get_lib_cells tt_g_1v20_25c/MXI2DX4M]
set_dont_use [get_lib_cells tt_g_1v20_25c/MXI2DX8M]
set_dont_use [get_lib_cells tt_g_1v20_25c/MXI2DXLM]
set_dont_use [get_lib_cells tt_g_1v20_25c/TIEHIM]
set_dont_use [get_lib_cells tt_g_1v20_25c/TIELOM]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/MXI2DX1MTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/MXI2DX2MTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/MXI2DX4MTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/MXI2DX8MTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/MXI2DXLMTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/TIEHIMTH]
set_dont_use [get_lib_cells tt_hvt_1v20_25c/TIELOMTH]
