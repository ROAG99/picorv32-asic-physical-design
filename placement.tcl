reset_placement

#set DCAP_CELL {*DCAP*}

#set_boundary_cell_rules  -prefix dcap  -insert_into_blocks -at_va_boundary -left_boundary_cell $DCAP_CELL -right_boundary_cell $DCAP_CELL -top_boundary_cell $DCAP_CELL -bottom_boundary_cell $DCAP_CELL

#compile_boundary_cells

#connect_pg_net

report_utilization > ../place_outputs/utilization_initial_placement.rpt

gui_change_highlight -add -color purple -collection [get_flat_cells]

set_app_options -list {opt.common.user_instance_name_prefix {place}}

#reset_placement

save_block

set_max_transition 0.2 [current_design]

report_net_fanout -threshold 25

set_app_options -list {opt.common.max_fanout {25}}

place_opt

#sizeof_collection [get_flat_cells place*]

#gui_change_highlight -add -color red -collection [get_flat_cells place*]
#add_spare_cells -num_instances 20 -cell_name SPARE -lib_cell "NAND2X2 NOR2X2"
#get_cells -hierarchical SPARE*
#change_selection [get_cells -hierarchical SPARE*]

legalize_placement -incremental
#change_selection [get_cells -hierarchical SPARE*]
#set_placement_status legalize_only [get_flat_cells -filter is_spare_cell]

#report_net_fanout -threshold 25

#report_timing -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../place_outputs/setup_place_opt.rpt 

#report_timing -delay_type min -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../place_outputs/hold_place_opt.rpt

#report_qor -summary > ../place_outputs/qor_place_opt.rpt 

#report_utilization > ../place_outputs/utilization_place_opt.rpt

save_block -as placement
##congestion,ce
