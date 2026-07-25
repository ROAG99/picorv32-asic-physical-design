# =========================
# CLOCK (200 MHz → 5 ns)
# =========================
create_clock [get_ports clk] -name clk -period 5 -waveform {0 2.5}

# =========================
# CLOCK QUALITY
# =========================
set_clock_uncertainty -setup 0.05 [get_clocks clk]
set_clock_uncertainty -hold 0.02  [get_clocks clk]

set_clock_transition 0.1 [get_clocks clk]

# =========================
# INPUT / OUTPUT DELAYS
# =========================
set_input_delay  -max 0.2 -clock clk [all_inputs]
set_input_delay  -min 0.05 -clock clk [all_inputs]

set_output_delay -max 0.2 -clock clk [all_outputs]
set_output_delay -min 0.05 -clock clk [all_outputs]

# =========================
# LOAD
# =========================
set_load 5 [all_outputs]

# =========================
# DESIGN RULES
# =========================
set_max_fanout 10 [current_design]
set_max_transition 0.25 [current_design]

# =========================
# NET FIXING
# =========================
#set_fix_multiple_port_nets -all -buffer_constants

# =========================
# (OPTIONAL) FAST CELLS
# =========================
#set_prefer [get_lib_cells */*LVT*]

# =========================
# REPORTS (REG → REG)
# =========================
#report_timing -from [all_registers] -to [all_registers] -max_paths 10 > setup_reg2reg.rpt
#report_timing -delay_type min -from [all_registers] -to [all_registers] -max_paths 10 > hold_reg2reg.rpt
