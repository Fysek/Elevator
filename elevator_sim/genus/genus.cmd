# Cadence Genus(TM) Synthesis Solution, Version 16.12-s027_1, built Oct  5 2016

# Date: Sun May 19 00:07:25 2019
# Host: lab513-pc1 (x86_64 w/Linux 3.10.0-693.21.1.el7.x86_64) (4cores*4cpus*Intel(R) Core(TM) i5-4690 CPU @ 3.50GHz 6144KB)
# OS:   Scientific Linux release 7.4 (Nitrogen)

source setup.tcl
read_hdl elevator.v
elaborate elevator.v
elaborate elevator
elaborate elevator
elaborate elevator
quit
