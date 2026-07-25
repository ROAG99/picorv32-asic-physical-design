#set_app_options -list {opt.common.user_instance_name_prefix {route}}

set_app_options -name route.global.timing_driven -value true

set_app_options -name route.global.crosstalk_driven -value false

set_app_options -name route.track.timing_driven -value true

set_app_options -name route.track.crosstalk_driven -value true

set_app_options -name route.detail.timing_driven -value true

set_app_options -name route.detail.force_max_number_iterations -value false

set_ignored_layers -min_routing_layer M2 -max_routing_layer M7

route_auto

check_routes > ../route_outputs/check_routes_route_auto.rpt

check_lvs > ../route_outputs/check_lvs_route_auto.rpt

report_timing -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../route_outputs/setup_route_auto.rpt

report_timing -delay_type min -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../route_outputs/hold_route_auto.rpt

report_qor -summary > ../route_outputs/qor_route_auto.rpt

#create_stdcell_fillers -lib_cells */DCAP

#remove_stdcell_fillers_with_violation

set fillers " *SHFILL128* *SHFILL64* *SHFILL3* *SHFILL2* *SHFILL1* "

create_stdcell_fillers -lib_cells $fillers

connect_pg_net -net VDD [get_pins -physical_context */VDD] 

connect_pg_net -net VSS [get_pins -physical_context */VSS] 

route_detail -incremental true

route_opt

write_verilog -top_module_first -exclude {pg_netlist physical_only_cells} picorv32.v

write_parasitics -corner fast -format spef -output ../pd_outputs/fast

write_parasitics -corner slow -format spef -output ../pd_outputs/slow

#set GDS_MAP_FILE "../gds/saed90nm.gdsout.map"

#set STD_CELL_GDS "../gds/saed90nm.gds ../gds/saed90nm_lvt.gds ../gds/saed90nm_hvt.gds

write_gds -view design -lib_cell_view frame -output_pin all -fill include -exclude_empty_block -long_names -keep_data_type ../pd_outputs/picorv32.gds

#gui_change_highlight -add -color red -collection [get_flat_cells place*]

#gui_change_highlight -add -color blue -collection [get_flat_cells "clock* *cts* "]

#gui_change_highlight -add -color green -collection [get_flat_cells *route*]

#gui_change_highlight -add -color blue -collection [get_cells *SHFILL*]
#gui_change_highlight -add -color red -collection [get_cells boundarycell!dcap!DCAP!*]
#gui_change_highlight -add -color yellow -collection [get_flat_cells place*]
#gui_change_highlight -add -color green -collection [get_flat_cells "clock* *cts*"]
#eco
connect_pg_net -net VDD [get_pins -physical_context */VDD] 
connect_pg_net -net VSS [get_pins -physical_context */VSS] 
#remove_cells *fil*
legalize_placement -incremental
route_eco -reroute modified_nets_first_then_others
save_block -as routing1 

