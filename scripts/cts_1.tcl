


# set NDR
create_routing_rule  clk_rule -widths  {M6 0.12 M7 0.12} -spacings  {M6 0.168 M7 0.168}

#check_clock_tree

# specify clock tree cell list
set_lib_cell_purpose -exclude cts [get_lib_cells]

set_lib_cell_purpose -include cts [get_lib_cells "*NBUFFX16* *NBUFFX2* *NBUFFX32* *NBUFFX4* *NBUFFX8*"]

#set_lib_cell_purpose -include cts [get_lib_cells "saed14lvt_ss0p6vm40c/SAEDLVT14_BUF_S_8"]

#Specify Max fanout
set_app_options -name  cts.common.max_fanout -value 10

# set clock target skew and latency
set_clock_tree_options -clocks [all_clocks] -target_latency 0.250 -target_skew 0.030

#set_clock_tree_options -clocks [get_clocks -filter "is_virtual==false"] -target_latency 0.25 -target_skew 0.03


set_clock_routing_rules -clocks [all_clocks ] -net_type {internal} -rules clk_rule -min_routing_layer M6 -max_routing_layer M7

set_clock_routing_rules -clocks [all_clocks ] -net_type {root} -rules clk_rule -min_routing_layer M6 -max_routing_layer M7

clock_opt

#save_block -as cts
#save_lib

# Make the logical connection of PG nets  for all the standard cells
        
connect_pg_net -net VDD [get_pins -hier * -filter "name == VDD"]
connect_pg_net -net VSS [get_pins -hier * -filter "name == VSS"]

report_constraints -all_violators
report_clock_tree_options
report_clock_qor
report_qor -summary
report_timing -delay_type min
report_timing -delay_type max
#save_block
#save_lib

save_block -as cts_done
save_lib

