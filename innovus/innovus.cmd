#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Jun 26 15:53:14 2019                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_gnd_net VSS
set init_lef_file {/tools/DesignKits/pssw/LEF/tsmc13fsg_8lm_tech.lef /tools/DesignKits/pssw/LEF/tsmc13g_m_macros.lef /tools/DesignKits/pssw/LEF/tsmc13hvt_m_macros.lef}
set init_verilog ../genus_2/elevator_RTL.v
set init_mmmc_file ../genus_2/genus_invs_des/genus.mmode.tcl
set init_top_cell elevator
set init_pwr_net VDD
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site TSM130NMMETROSITE -r 0.989053314413 0.699989 30.0 30.0 30.0 30.0
uiSetTool select
getIoFlowFlag
fit
globalNetConnect VDD -type pgpin -pin VDD -all
globalNetConnect VSS -type pgpin -pin VSS -all
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL8 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VSS VDD} -type core_rings -follow core -layer {top METAL1 bottom METAL1 left METAL2 right METAL2} -width {top 9.9 bottom 9.9 left 9.9 right 9.9} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { METAL1(1) METAL8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL8(8) } -nets { VSS VDD } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { METAL1(1) METAL8(8) }
setPlaceMode -fp false
placeDesign
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -preCTS
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
setDelayCalMode -engine default -siAware true
optDesign -postRoute
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
setDelayCalMode -engine default -siAware true
optDesign -postRoute
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
getFillerMode -quiet
addFiller -cell FILL1M FILL2M FILL4M FILL8M FILL16M -prefix FILLER
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 -1
panPage 0 1
verifyConnectivity -type all -error 1000 -warning 50
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report elevator.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
fit
saveDesign elevator
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set dbgLefDefOutVersion 5.8
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing elevator.def
set dbgLefDefOutVersion 5.8
set dbgLefDefOutVersion 5.8
saveNetlist elevator.v
reset_parasitics
extractRC
rcOut -setload elevator.setload -rc_corner _default_rc_corner_
rcOut -setres elevator.setres -rc_corner _default_rc_corner_
rcOut -spf elevator.spf -rc_corner _default_rc_corner_
rcOut -spef elevator.spef -rc_corner _default_rc_corner_
saveIoFile -locations elevator.save.io
saveDesign elevator
saveDesign -cellview {elevator elevator layout}
saveFPlan elevator.fp
setEdit -layer_horizontal METAL1
setEdit -layer_vertical METAL1
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf  -ideal_clock_network elevator.sdf
