initialize_floorplan -core_utilization 0.6 -core_offset 1


set DCAP_CELL {*DCAP*}

set_boundary_cell_rules  -prefix dcap  -insert_into_blocks -at_va_boundary -left_boundary_cell $DCAP_CELL -right_boundary_cell $DCAP_CELL -top_boundary_cell $DCAP_CELL -bottom_boundary_cell $DCAP_CELL

compile_boundary_cells

connect_pg_net




set_block_pin_constraints -self -allowed_layers {M3 M4}

place_pins -self

#report_timing -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../fp_outputs/setup_initial_placement.rpt 

#report_timing -delay_type min -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../fp_outputs/hold_initial_placement.rpt

#report_qor -summary > ../fp_outputs/qor_initial_placement.rpt

save_block -as floorplan1
