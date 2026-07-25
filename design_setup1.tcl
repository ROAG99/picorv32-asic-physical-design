set TECH_FILE "/home/gtu18/project_tawhid/vlsi/VLSI_in/ref/tech/saed32nm_1p9m.tf"

set REFERENCE_LIBRARY [join "/home/gtu18/project_tawhid/vlsi/VLSI_in/ref/CLIBs/saed32_hvt.ndm /home/gtu18/project_tawhid/vlsi/VLSI_in/ref/CLIBs/saed32_lvt.ndm /home/gtu18/project_tawhid/vlsi/VLSI_in/ref/CLIBs/saed32_rvt.ndm /home/gtu18/project_tawhid/vlsi/VLSI_in/ref/CLIBs/saed32_sram_lp.ndm" ]

set PARASITCS_WORST "/home/gtu18/project_tawhid/vlsi/VLSI_in/ref/tech/saed32nm_1p9m_Cmax.lv.tluplus.gz"

set PARASITCS_BEST "/home/gtu18/project_tawhid/vlsi/VLSI_in/ref/tech/saed32nm_1p9m_Cmin.lv.tluplus.gz"

set MAP_FILE "/home/gtu18/project_tawhid//vlsi/VLSI_in/ref/tech/saed32nm_tf_itf_tluplus.map"

set netlist "/home/gtu18/project_tawhid/vlsi/VLSI_in/output/picorv32.vg" 

set TOP "picorv32"

create_lib -technology $TECH_FILE -ref_libs $REFERENCE_LIBRARY picorv32.lib

report_ref_libs

report_lib saed32_rvt
report_lib saed32_hvt
report_lib saed32_lvt

read_verilog -top $TOP $netlist

read_parasitic_tech -layermap $MAP_FILE -tlup $PARASITCS_WORST -name maxTLU

read_parasitic_tech -layermap $MAP_FILE -tlup $PARASITCS_BEST -name minTLU

get_parasitic_techs

set_attribute [get_site_defs unit] symmetry Y

set_attribute [get_site_defs unit] is_default true

set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction vertical

set_attribute [get_layers {M2 M4 M6 M8}] routing_direction horizontal

set_ignored_layers -min_routing_layer M2 -max_routing_layer M7

#load_upf /home/jayesh.munjani/FDP/Day_2/i2c/scripts/i2c_master_top.upf

#commit_upf

set_app_options -list {place.coarse.continue_on_missing_scandef {true}}

source /home/gtu18/project_tawhid/vlsi/VLSI_in/mcmm/mcmm_setup1.tcl

#rename_block -to_block design_setup

#check_mv_design

save_block -as design_setup1
