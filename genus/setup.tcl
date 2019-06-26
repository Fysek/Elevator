# *********************************************************
# * Script Name  : Genus Legacy mode initialization script
# *********************************************************
date

set LOCAL_DIR "[exec pwd]/"
set LIB_PATH	"/tools/DesignKits/pssw/TIMING13 /tools/DesignKits/pssw/LEF"
set RTL_PATH	"$LOCAL_DIR/RTL"
set MSGS_TO_BE_SUPRESSED {LBR-58 LBR-40 LBR-41 VLOGPT-35}

# Baseline Libraries
set LIB_LIST { \
tt_g_1v20_25c.lib \
tt_hvt_1v20_25c.lib \
}

set LEF_LIST { \
tsmc13fsg_8lm_tech.lef \
tsmc13g_m_macros.lef \
tsmc13hvt_m_macros.lef \
}

set CAP_TABLE_FILE /tools/DesignKits/pssw/tsmc13fsg.capTbl
suppress_messages {LBR-30 LBR-31 LBR-40 LBR-41 LBR-72 LBR-77 LBR-162}
set_attribute hdl_track_filename_row_col true /
set_attribute lp_power_unit mW /
set_attribute init_lib_search_path $LIB_PATH /
set_attribute init_hdl_search_path $RTL_PATH /

set_attribute library $LIB_LIST
# PLE
set_attribute lef_library $LEF_LIST /
set_attribute cap_table_file $CAP_TABLE_FILE /

