# *********************************************************
# * Script Name  : Genus Legacy mode initialization script
# *********************************************************

set LOCAL_DIR "[exec pwd]/"
set LIB_PATH	"$LOCAL_DIR/NangateOpenCellLibrary/Front_End/Liberty/NLDM $LOCAL_DIR/NangateOpenCellLibrary/Back_End/lef"
set RTL_PATH	"$LOCAL_DIR/RTL"
set basename elevator
set myClk clock 
set myPeriod_ms 1 
set runname RTL 

# Baseline Libraries
set LIB_LIST { 
NangateOpenCellLibrary_typical.lib \
}

set LEF_LIST { \
NangateOpenCellLibrary.lef \
NangateOpenCellLibrary.macro.lef \
NangateOpenCellLibrary.tech.lef \
}


set_attribute init_lib_search_path $LIB_PATH /
set_attribute init_hdl_search_path $RTL_PATH /

set_attribute library $LIB_LIST
# PLE
set_attribute lef_library $LEF_LIST /


