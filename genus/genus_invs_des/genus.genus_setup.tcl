#####################################################################
#
# Genus(TM) Synthesis Solution setup file
# Created by Genus(TM) Synthesis Solution 16.12-s027_1
#   on 06/25/2019 23:54:54
#
#
#####################################################################


# This script is intended for use with Genus(TM) Synthesis Solution version 16.12-s027_1


# Remove Existing Design
###########################################################
if {[::legacy::find -design /designs/elevator] ne ""} {
  puts "** A design with the same name is already loaded. It will be removed. **"
  delete_obj /designs/elevator
}


# Libraries
###########################################################
::legacy::set_attribute library {/tools/DesignKits/pssw/TIMING13/tt_g_1v20_25c.lib /tools/DesignKits/pssw/TIMING13/tt_hvt_1v20_25c.lib {}} /

::legacy::set_attribute lef_library {/tools/DesignKits/pssw/LEF/tsmc13fsg_8lm_tech.lef /tools/DesignKits/pssw/LEF/tsmc13g_m_macros.lef /tools/DesignKits/pssw/LEF/tsmc13hvt_m_macros.lef} /
::legacy::set_attribute cap_table_file /tools/DesignKits/pssw/tsmc13fsg.capTbl /


# Design
###########################################################
read_netlist -top elevator genus_invs_des/genus.v.gz
read_metric -id current genus_invs_des/genus.metrics.json

source genus_invs_des/genus.g.gz
puts "\n** Restoration Completed **\n"


# Data Integrity Check
###########################################################
# program version
if {"[string_representation [::legacy::get_attribute program_version /]]" != "16.12-s027_1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden program_version: 16.12-s027_1  current program_version: [string_representation [::legacy::get_attribute program_version /]]"
}
# license
if {"[string_representation [::legacy::get_attribute startup_license /]]" != "Genus_Synthesis"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden license: Genus_Synthesis  current license: [string_representation [::legacy::get_attribute startup_license /]]"
}
# slack
set _slk_ [::legacy::get_attribute slack /designs/elevator]
if {[regexp {^-?[0-9.]+$} $_slk_]} {
  set _slk_ [format %.1f $_slk_]
}
if {$_slk_ != "99796985.7"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack: 99796985.7,  current slack: $_slk_"
}
unset _slk_
# multi-mode slack
# tns
set _tns_ [::legacy::get_attribute tns /designs/elevator]
if {[regexp {^-?[0-9.]+$} $_tns_]} {
  set _tns_ [format %.0f $_tns_]
}
if {$_tns_ != "0"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden tns: 0,  current tns: $_tns_"
}
unset _tns_
# cell area
set _cell_area_ [::legacy::get_attribute cell_area /designs/elevator]
if {[regexp {^-?[0-9.]+$} $_cell_area_]} {
  set _cell_area_ [format %.0f $_cell_area_]
}
if {$_cell_area_ != "6739"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden cell area: 6739,  current cell area: $_cell_area_"
}
unset _cell_area_
# net area
set _net_area_ [::legacy::get_attribute net_area /designs/elevator]
if {[regexp {^-?[0-9.]+$} $_net_area_]} {
  set _net_area_ [format %.0f $_net_area_]
}
if {$_net_area_ != "4223"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden net area: 4223,  current net area: $_net_area_"
}
unset _net_area_
