# *********************************************************
# * Script Name  : Genus Legacy mode initialization script
# *********************************************************
date

set LOCAL_DIR "[exec pwd]/"
set LIB_PATH	"/home/student/DYPLOM/dyrdol/UofU/UofU_Digital_v1_2 /home/student/DYPLOM/dyrdol/UofU/UofU_Digital_v1_2"
set RTL_PATH	"$LOCAL_DIR/RTL"
#set MSGS_TO_BE_SUPRESSED {LBR-58 LBR-40 LBR-41 VLOGPT-35}
set myFiles [list $LOCAL_DIR/RTL/elevator.v $LOCAL_DIR/RTL/buttons_res.v] 	;# All your HDL files
set basename elevator		;# name of top level module
set myClk clk 				;# clock name
set myPeriod_ps 100000000 		;# Clock period in ps 10kHz
set myInDelay_ps 200000 		;# delay from clock to inputs valid 2us
set myOutDelay_ps 200000 		;# delay from clock to output valid 2us
set runname RTL 			;# name appended to output files


# Baseline Libraries
set LIB_LIST { \
UofU_Digital_v1_2.lib \
}

set LEF_LIST { \
UofU_Digital_v1_2.lef\
}

#set CAP_TABLE_FILE /tools/DesignKits/pssw/tsmc13fsg.capTbl
#suppress_messages {LBR-30 LBR-31 LBR-40 LBR-41 LBR-72 LBR-77 LBR-162}
set_attribute hdl_track_filename_row_col true /
set_attribute lp_power_unit mW /
set_attribute init_lib_search_path $LIB_PATH /
set_attribute init_hdl_search_path $RTL_PATH /
set_attribute library $LIB_LIST /
set_attribute lef_library $LEF_LIST /

# Analyze and Elaborate the HDL files
read_hdl elevator.v
elaborate elevator

# Apply Constraints and generate clocks
set clock [define_clock -period ${myPeriod_ps} -name ${myClk} [clock_ports]]
external_delay -input $myInDelay_ps -clock ${myClk} [find / -port ports_in/*]
external_delay -output $myOutDelay_ps -clock ${myClk} [find / -port ports_out/*]

# Sets transition to default values for Synopsys SDC format,
# fall/rise 00ps
dc::set_clock_transition .9 $myClk

# check that the design is OK so far
check_design -unresolved
report timing -lint

# Synthesize the design to the target library
synthesize -to_mapped 

# Write out the reports
report timing > ${basename}_${runname}_timing.rep
report gates > ${basename}_${runname}_cell.rep
report power > ${basename}_${runname}_power.rep

# Write out the structural Verilog and sdc files
write_hdl -mapped > ${basename}_${runname}.v
write_sdc > ${basename}_${runname}.sdc
write_design ${basename} -gzip_files -innovus -tcf