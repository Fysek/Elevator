alog -O2 -protect 0 -msg 5 -sve "$dsn/src/elevator.v"
alog -O2 -protect 0 -msg 5 -sve "$dsn/src/buttons_res.v"
alog -O2 -protect 0 -msg 5 -sve "$dsn/src/elevator_tb.v"
asim +access +r elevator_tb
wave 
add wave -noreg {/elevator_tb/clk}
add wave -noreg {/elevator_tb/reset}
add wave -noreg {/elevator_tb/elevator_inst/state}
#add wave -noreg {/elevator_tb/elevator_inst/saved_state}
add wave -noreg {/elevator_tb/elevator_inst/direction}
#add wave -noreg {/elevator_tb/elevator_inst/last_direction}	
add wave -noreg {/elevator_tb/elevator_inst/letout}	
add wave -noreg {/elevator_tb/elevator_inst/counter}	
add wave -noreg {/elevator_tb/elevator_inst/active_in_levels} 
add wave -noreg {/elevator_tb/elevator_inst/active_out_up_levels}
add wave -noreg {/elevator_tb/elevator_inst/active_out_down_levels}
add wave -noreg {/elevator_tb/door}		 
add wave -noreg {/elevator_tb/engine}
#add wave -noreg {/elevator_tb/btn_in} 
#add wave -noreg {/elevator_tb/elevator_inst/inactivate_in_levels}
#add wave -noreg {/elevator_tb/btn_up_out} 
#add wave -noreg {/elevator_tb/elevator_inst/inactivate_out_up_levels}  
#add wave -noreg {/elevator_tb/btn_down_out}	
#add wave -noreg {/elevator_tb/elevator_inst/inactivate_out_down_levels}	


run	-all													   
														   
														   