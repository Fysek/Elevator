######################################################################

# Created by Genus(TM) Synthesis Solution 16.12-s027_1 on Tue Jun 25 23:54:13 +0200 2019

# This file contains the RC script for /designs/elevator

######################################################################

::legacy::set_attribute -quiet init_lib_search_path {/tools/DesignKits/pssw/TIMING13 /tools/DesignKits/pssw/LEF} /
::legacy::set_attribute -quiet common_ui false /
::legacy::set_attribute -quiet design_mode_process 160.0 /
::legacy::set_attribute -quiet phys_assume_met_fill 0.0 /
::legacy::set_attribute -quiet phys_use_invs_extraction false /
::legacy::set_attribute -quiet phys_route_blockage_free false /
::legacy::set_attribute -quiet lp_power_unit mW /
::legacy::set_attribute -quiet runtime_by_stage { {to_generic 2 845 2 32}  {first_condense 4 850 4 37}  {reify 2 852 3 41}  {global_incr_map 0 852 0 41}  {incr_opt 0 853 0 41} } /
::legacy::set_attribute -quiet tinfo_tstamp_file .rs_dyrdol.tstamp /
::legacy::set_attribute -quiet hdl_track_filename_row_col true /
::legacy::set_attribute -quiet use_area_from_lef true /
::legacy::set_attribute -quiet super_thread_servers {localhost localhost localhost localhost   } /
::legacy::set_attribute -quiet flow_metrics_snapshot_uuid 185d83c2 /
::legacy::set_attribute -quiet phys_use_segment_parasitics true /
::legacy::set_attribute -quiet probabilistic_extraction true /
::legacy::set_attribute -quiet ple_correlation_factors {1.9000 2.0000} /
::legacy::set_attribute -quiet maximum_interval_of_vias inf /
::legacy::set_attribute -quiet ple_mode global /
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tt_g_1v20_25c/operating_conditions/tt_1v20_25c
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tt_g_1v20_25c/operating_conditions/_nominal_
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tt_hvt_1v20_25c/operating_conditions/tt_1v20_25c
::legacy::set_attribute -quiet tree_type balanced_tree /libraries/tt_hvt_1v20_25c/operating_conditions/_nominal_
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name clock -domain domain_1 -period 100000000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -design /designs/elevator /designs/elevator/ports_in/clk
::legacy::set_attribute -quiet slew {900.0 900.0 900.0 900.0} /designs/elevator/timing/clock_domains/domain_1/clock
external_delay -accumulate -input {200000.0 200000.0 200000.0 200000.0} -clock /designs/elevator/timing/clock_domains/domain_1/clock -name in_del_1 {{/designs/elevator/ports_in/btn_down_out[1]} {/designs/elevator/ports_in/btn_down_out[2]} {/designs/elevator/ports_in/btn_down_out[3]} {/designs/elevator/ports_in/btn_down_out[4]} {/designs/elevator/ports_in/btn_down_out[5]} {/designs/elevator/ports_in/btn_down_out[6]} {/designs/elevator/ports_in/btn_down_out[7]} {/designs/elevator/ports_in/btn_up_out[0]} {/designs/elevator/ports_in/btn_up_out[1]} {/designs/elevator/ports_in/btn_up_out[2]} {/designs/elevator/ports_in/btn_up_out[3]} {/designs/elevator/ports_in/btn_up_out[4]} {/designs/elevator/ports_in/btn_up_out[5]} {/designs/elevator/ports_in/btn_up_out[6]} {/designs/elevator/ports_in/btn_in[0]} {/designs/elevator/ports_in/btn_in[1]} {/designs/elevator/ports_in/btn_in[2]} {/designs/elevator/ports_in/btn_in[3]} {/designs/elevator/ports_in/btn_in[4]} {/designs/elevator/ports_in/btn_in[5]} {/designs/elevator/ports_in/btn_in[6]} {/designs/elevator/ports_in/btn_in[7]} {/designs/elevator/ports_in/sensor_door[0]} {/designs/elevator/ports_in/sensor_door[1]} /designs/elevator/ports_in/sensor_inside /designs/elevator/ports_in/sensor_down /designs/elevator/ports_in/sensor_up /designs/elevator/ports_in/bell /designs/elevator/ports_in/overload /designs/elevator/ports_in/close_btn /designs/elevator/ports_in/open_btn /designs/elevator/ports_in/buttons_block /designs/elevator/ports_in/an_reset /designs/elevator/ports_in/clk}
external_delay -accumulate -output {200000.0 200000.0 200000.0 200000.0} -clock /designs/elevator/timing/clock_domains/domain_1/clock -name ou_del_1 {{/designs/elevator/ports_out/level_display[0]} {/designs/elevator/ports_out/level_display[1]} {/designs/elevator/ports_out/level_display[2]} {/designs/elevator/ports_out/level_display[3]} /designs/elevator/ports_out/bell_out /designs/elevator/ports_out/direction {/designs/elevator/ports_out/door[0]} {/designs/elevator/ports_out/door[1]} {/designs/elevator/ports_out/engine[0]} {/designs/elevator/ports_out/engine[1]}}
# BEGIN DFT SECTION
::legacy::set_attribute -quiet dft_scan_style muxed_scan /
::legacy::set_attribute -quiet dft_scanbit_waveform_analysis false /
# END DFT SECTION
::legacy::set_attribute -quiet qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 34068} {cell_count 3603} {utilization  0.00} {runtime 2 845 2 32} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 14936} {cell_count 1357} {utilization  0.00} {runtime 4 850 4 37} }{reify {wns 99796959} {tns 0} {vep 0} {area 7292} {cell_count 766} {utilization  0.00} {runtime 2 852 3 41} }{global_incr_map {wns 99797002} {tns 0} {vep 0} {area 6807} {cell_count 763} {utilization  0.00} {runtime 0 852 0 41} }{incr_opt {wns 214748365} {tns 0} {vep 0} {area 6738} {cell_count 750} {utilization  0.00} {runtime 0 853 0 41} }} /designs/elevator
::legacy::set_attribute -quiet hdl_user_name elevator /designs/elevator
::legacy::set_attribute -quiet hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v} {/home/student/DYPLOM/dyrdol/magisterka/genus_2//RTL}}} /designs/elevator
::legacy::set_attribute -quiet verification_directory fv/elevator /designs/elevator
::legacy::set_attribute -quiet seq_reason_deleted {{{saved_state_reg[4]} {{constant 0}}} {{inactivate_out_up_levels_reg[0]} {{merged with inactivate_in_levels_reg[0]}}} {{inactivate_out_down_levels_reg[7]} {{merged with inactivate_in_levels_reg[7]}}} {{buttons_inst/buttons_state_reg[0]} {{inv merged with buttons_inst/active_in_levels_reg[0]}}} {{buttons_inst/buttons_state_reg[1]} {{inv merged with buttons_inst/active_in_levels_reg[1]}}} {{buttons_inst/buttons_state_reg[2]} {{inv merged with buttons_inst/active_in_levels_reg[2]}}} {{buttons_inst/buttons_state_reg[3]} {{inv merged with buttons_inst/active_in_levels_reg[3]}}} {{buttons_inst/buttons_state_reg[4]} {{inv merged with buttons_inst/active_in_levels_reg[4]}}} {{buttons_inst/buttons_state_reg[5]} {{inv merged with buttons_inst/active_in_levels_reg[5]}}} {{buttons_inst/buttons_state_reg[6]} {{inv merged with buttons_inst/active_in_levels_reg[6]}}} {{buttons_inst/buttons_state_reg[7]} {{inv merged with buttons_inst/active_in_levels_reg[7]}}}} /designs/elevator
::legacy::set_attribute -quiet arch_filename /home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v /designs/elevator
::legacy::set_attribute -quiet entity_filename /home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v /designs/elevator
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/clk
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/an_reset
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/buttons_block
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/open_btn
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/close_btn
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/overload
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/bell
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/sensor_up
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/sensor_down
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_in/sensor_inside
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/sensor_door[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/sensor_door[0]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[7]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[6]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[5]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[4]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[3]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[2]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_in[0]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[6]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[5]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[4]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[3]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[2]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_up_out[0]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[7]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[6]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[5]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[4]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[3]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[2]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_in/btn_down_out[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/engine[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/engine[0]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/door[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/door[0]}
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_out/direction
::legacy::set_attribute -quiet min_transition no_value /designs/elevator/ports_out/bell_out
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/level_display[3]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/level_display[2]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/level_display[1]}
::legacy::set_attribute -quiet min_transition no_value {/designs/elevator/ports_out/level_display[0]}
::legacy::set_attribute -quiet hdl_user_name buttons_res /designs/elevator/subdesigns/buttons_res
::legacy::set_attribute -quiet hdl_filelist {{default -v2001 {SYNTHESIS} {/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v} {/home/student/DYPLOM/dyrdol/magisterka/genus_2//RTL}}} /designs/elevator/subdesigns/buttons_res
::legacy::set_attribute -quiet arch_filename /home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v /designs/elevator/subdesigns/buttons_res
::legacy::set_attribute -quiet entity_filename /home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v /designs/elevator/subdesigns/buttons_res
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 903 63}} /designs/elevator/instances_hier/buttons_inst
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29397837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29407557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29417654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 34}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_btn_in_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 29 48}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/l_inactivate_in_levels_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29588867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29591377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29603717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g29614599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g2968
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_in_levels_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_down_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 57}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} {/designs/elevator/instances_hier/buttons_inst/instances_seq/active_out_up_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g37973779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g37982007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g37991237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38001297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38012006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38022833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38037547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38177765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38259867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38263377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38279719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38281591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38296789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38305927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38312001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38321122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38332005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38349771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38353457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38361279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38376179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38387837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38397557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38407654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38418867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38421377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38433717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38444599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38513779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38522007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38531237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38541297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38552006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38562833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38577547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38587765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38599867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38603377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38619719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38621591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38636789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38655927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38662001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38671122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38682005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38699771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38703457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38711279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38726179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38737837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38747557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38757654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38768867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g3877
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g21377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g33717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38784599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38793779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38802007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38811237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38821297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38832006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38842833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38857547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38867765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38879867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38883377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 67 1}} /designs/elevator/instances_hier/buttons_inst/instances_comb/g38899719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191571591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191586789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191595927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191602001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191611122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191622005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191639771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191643457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191651279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191666179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191677837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191687557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191697654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191708867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191711377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191723717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191734599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191743779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191752007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 91 29}} /designs/elevator/instances_seq/bell_out_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191771237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191781297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191792006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191802833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191817547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g191827765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 968 17}} /designs/elevator/instances_seq/closing_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 216 20}} {/designs/elevator/instances_seq/counter_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 954 16}} {/designs/elevator/instances_seq/counter_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[8]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[9]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[10]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[11]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 1017 17}} {/designs/elevator/instances_seq/counter_reg[12]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[13]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[15]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 31}} {/designs/elevator/instances_seq/door_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 31}} {/designs/elevator/instances_seq/door_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 33}} {/designs/elevator/instances_seq/engine_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 33}} {/designs/elevator/instances_seq/engine_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 21}} /designs/elevator/instances_seq/i_direction_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 16}} {/designs/elevator/instances_seq/i_engine_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 16}} {/designs/elevator/instances_seq/i_engine_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 27}} {/designs/elevator/instances_seq/inactivate_in_levels_reg[7]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 32}} {/designs/elevator/instances_seq/inactivate_out_down_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[5]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 30}} {/designs/elevator/instances_seq/inactivate_out_up_levels_reg[6]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 1}} {/designs/elevator/instances_seq/level_display_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 1}} {/designs/elevator/instances_seq/level_display_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 1}} {/designs/elevator/instances_seq/level_display_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 1}} {/designs/elevator/instances_seq/level_display_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} /designs/elevator/instances_seq/opening_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 15}} {/designs/elevator/instances_seq/saved_state_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 15}} {/designs/elevator/instances_seq/saved_state_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 15}} {/designs/elevator/instances_seq/saved_state_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 15}} {/designs/elevator/instances_seq/saved_state_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 9}} {/designs/elevator/instances_seq/state_reg[0]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 9}} {/designs/elevator/instances_seq/state_reg[1]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 9}} {/designs/elevator/instances_seq/state_reg[2]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 9}} {/designs/elevator/instances_seq/state_reg[3]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 9}} {/designs/elevator/instances_seq/state_reg[4]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 987 9}} /designs/elevator/instances_seq/waiting_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395909867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395923377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395949719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395951591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395966789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395975927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g395982001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396011122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396022005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396039771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396063457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396071279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396096179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396127837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396137557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396147654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396178867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396181377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396193717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396214599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396233779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396242007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396251237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396291297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396302006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396312833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396327547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396337765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396349867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396353377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396369719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396371591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396386789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396395927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396402001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396441122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396452005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396469771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396473457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396481279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396496179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39652
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39653
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396547837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396557557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396567654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396578867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396581377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396593717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39667
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396694599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396703779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396712007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396721237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396731297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396742006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396772833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396787547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396797765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396809867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396813377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396829719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396831591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396846789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396855927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396862001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396871122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396882005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396899771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396903457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396911279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396926179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396937837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396947557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396957654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396968867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396971377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g396983717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39699
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397004599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397013779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397022007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39703
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397041237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397051297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397062006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39707
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397082833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397097547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397107765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397119867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397123377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397139719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397141591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397166789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397175927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397182001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397201122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397222005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397239771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39724
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397253457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397281279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397306179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397317837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397327557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397337654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397348867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397351377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397363717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397374599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397383779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397392007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397401237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397411297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397422006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397432833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397447547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397467765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397479867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397483377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397499719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397501591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397516789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397525927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397532001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397571122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397582005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397599771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397603457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397611279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397626179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397637837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397647557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397657654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397668867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397691377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397703717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397724599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397733779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397742007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397751237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397761297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39777
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397782006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397792833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397807547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397817765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397829867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397833377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397849719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397851591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397876789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397885927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397902001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39792
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397931122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397942005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397959771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397963457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397971279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397986179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g397997837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398007557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398017654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398028867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398031377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398043717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398054599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398063779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398072007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398131237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398141297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398152006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398162833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398177547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398187765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398199867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398203377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398219719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398221591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398236789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398245927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398252001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398261122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398272005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398289771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39829
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398303457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398311279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398326179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398337837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398347557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398377654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398388867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398391377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398403717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398414599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398423779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398432007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398441237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398451297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398462006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398472833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398487547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398497765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398509867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398513377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398529719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398531591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398546789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39855
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39856
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398575927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398582001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398591122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398602005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398619771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398623457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398631279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398666179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398687837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398697557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398707654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398718867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398721377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398733717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398744599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398753779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398762007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398771237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398781297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398792006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398802833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398817547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398827765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398839867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398843377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398859719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398861591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39887
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398886789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398895927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398902001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398921122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398942005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39895
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398969771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398973457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398981279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g398996179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399007837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399017557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399027654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399038867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39904
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399051377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399063717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399074599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399083779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399112007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399121237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399131297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399142006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399152833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399167547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399177765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399189867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399193377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399209719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399211591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399226789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399235927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399242001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399251122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39926
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399272005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399289771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399313457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399321279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399336179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399347837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399357557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399367654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399378867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399381377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399393717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399404599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399413779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399422007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399431237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399441297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399452006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399462833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399477547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399487765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399499867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399503377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399519719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399521591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39953
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399546789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399555927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399562001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399571122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399582005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399599771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399603457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399611279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g39962
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399636179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399647837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399657557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399677654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399688867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399691377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399703717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399714599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399723779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399732007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399741237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399751297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399762006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399772833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399787547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399797765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399809867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399813377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399829719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399831591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399846789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399855927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399862001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399871122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399892005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399909771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399923457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399931279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399946179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399957837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399967557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g399977654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40000
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400018867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400021377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400033717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400044599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400053779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400062007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400071237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400081297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400092006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40010
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400112833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400127547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400137765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400149867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400153377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400169719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400171591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400186789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400195927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40020
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40021
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400232001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400241122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400252005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400269771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400283457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400291279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400306179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400317837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400327557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400337654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400348867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400351377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400363717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400374599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400383779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400392007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400401237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400411297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400422006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400432833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400447547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400457765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400479867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400483377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400499719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400501591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400516789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400525927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40053
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40054
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40055
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40056
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40057
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400582001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400591122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400602005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400619771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400643457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400651279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400666179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400677837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400687557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400697654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400708867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400711377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400723717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400734599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400743779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400752007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40076
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40077
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40078
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400791237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400801297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400812006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400822833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400837547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400847765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400859867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400863377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400879719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400881591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400896789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400905927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400912001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400921122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400932005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400949771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400953457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40096
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40097
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400981279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g400996179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401007837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401017557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401027654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401038867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401041377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401053717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401064599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401073779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401082007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401091237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401101297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401112006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401122833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401137547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401147765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401159867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401163377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401179719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401181591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40119
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40120
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40121
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40123
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401246789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401255927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401262001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401271122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401282005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401299771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401303457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401311279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401326179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401337837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401347557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401357654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401368867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401371377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401383717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401394599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401403779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401412007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401421237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401431297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401442006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401452833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40146
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40147
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40148
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40149
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401507547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401517765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401529867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401533377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401549719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401551591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401566789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401575927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401582001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401591122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401602005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401619771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401623457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401631279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401646179
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401657837
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401667557
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401677654
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401688867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40169
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40170
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40171
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40172
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40173
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401741377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401753717
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401764599
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401773779
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401782007
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401791237
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401801297
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401812006
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401822833
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401837547
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401847765
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401859867
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401863377
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401879719
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401881591
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401896789
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401905927
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401912001
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401921122
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g401932005
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40194
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40195
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40197
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40198
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40199
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40200
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40201
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40202
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40203
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g40204
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 104 18}} {/designs/elevator/instances_seq/counter_reg[14]}
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 987 9}} /designs/elevator/instances_comb/g29771
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 987 9}} /designs/elevator/instances_comb/g402073457
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g40216
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 130 9}} /designs/elevator/instances_comb/g40217
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/buttons_res.v 40 37}} /designs/elevator/instances_comb/g402181279
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 987 9}} /designs/elevator/instances_seq/direction_reg
::legacy::set_attribute -quiet file_row_col {{/home/student/DYPLOM/dyrdol/magisterka/genus_2/RTL/elevator.v 987 9}} /designs/elevator/instances_seq/letout_reg
