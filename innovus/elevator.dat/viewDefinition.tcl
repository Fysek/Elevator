if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name default_library_set\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/tt_g_1v20_25c.lib\
    ${::IMEX::libVar}/lib/typ/tt_hvt_1v20_25c.lib]
create_rc_corner -name _default_rc_corner_\
   -cap_table ${::IMEX::libVar}/mmmc/tsmc13fsg.capTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name _default_delay_corner_\
   -library_set default_library_set\
   -opcond_library tt_g_1v20_25c\
   -opcond tt_1v20_25c\
   -rc_corner _default_rc_corner_
create_constraint_mode -name _default_constraint_mode_\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/_default_constraint_mode_/_default_constraint_mode_.sdc]
create_analysis_view -name _default_view_ -constraint_mode _default_constraint_mode_ -delay_corner _default_delay_corner_ -latency_file ${::IMEX::dataVar}/mmmc/views/_default_view_/latency.sdc
set_analysis_view -setup [list _default_view_] -hold [list _default_view_]
