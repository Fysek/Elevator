#####################################################################
#
# Innovus setup file
# Created by Genus(TM) Synthesis Solution on 06/25/2019 23:54:54
#
#
#####################################################################


# User Specified CPU usage for Innovus
######################################
setMultiCpuUsage -localCpu 8


# Design Import
###########################################################
source genus_invs_des/genus.globals
init_design

# Reading metrics file
######################
um::read_metric -id current genus_invs_des/genus.metrics.json 

read_activity_file -format TCF genus_invs_des/genus.tcf.gz


# Mode Setup
###########################################################
source genus_invs_des/genus.mode
set edi_pe::pegConsiderMacroLayersUnblocked 1 


# The following is partial list of suggested prototyping commands.
# These commands are provided for reference only.
# Please consult the Innovus documentation for more information.
#   Placement...
#     ecoPlace                     ;# legalizes placement including placing any cells that may not be placed
#     - or -
#     placeDesign -incremental     ;# adjusts existing placement
#     - or -
#     placeDesign                  ;# performs detailed placement discarding any existing placement
#   Optimization & Timing...
#     optDesign -preCTS            ;# performs trial route and optimization
#     timeDesign -preCTS           ;# performs timing analysis

