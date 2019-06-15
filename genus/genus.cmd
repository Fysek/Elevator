# Cadence Genus(TM) Synthesis Solution, Version 16.12-s027_1, built Oct  5 2016

# Date: Sat Jun 15 15:55:29 2019
# Host: lab513-pc1 (x86_64 w/Linux 3.10.0-693.21.1.el7.x86_64) (4cores*4cpus*Intel(R) Core(TM) i5-4690 CPU @ 3.50GHz 6144KB)
# OS:   Scientific Linux release 7.4 (Nitrogen)

source setup.tcl
read_hdl elevator.v
elaborate elevator
set clock [define_clock -period ${myPeriod_ms} -name ${myClk} [clock_ports]]set clock [define_clock -period ${myPeriod_ms} -name ${myClk} [clock_ports]]
check_design -unresolved
report timing -lint
synthesize -to_mapped
set runname RTL 
set basename elevator
report timing > ${basename}_${runname}_timing.rep
report gates > ${basename}_${runname}_cell.rep
report power > ${basename}_${runname}_power.repreport power > ${basename}_${runname}_power.rep
report power > ${basename}_${runname}_power.rep
write_hdl -mapped > ${basename}_${runname}.v
gui_show
