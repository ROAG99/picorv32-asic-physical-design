
#set design /home/gtu18/project_tawhid/vlsi/VLSI_in/rtl/ibex_top.sv

#join 
set design picorv32
set my_files   /home/gtu18/project_tawhid/vlsi/VLSI_in/rtl/pico.v

read_file -rtl -format verilog  /home/gtu18/project_tawhid/vlsi/VLSI_in/rtl/pico.v

set current_design picorv32

#set my_files [join "/home/gtu09/Documents/vlsi/VLSI_in/rtl/i2c_master_top.v"]

set_app_var search_path "../DBs/"

set target_library [join "  ../DBs/saed32hvt_ff0p95v125c.db 
../DBs/saed32hvt_ff0p95vn40c.db
../DBs/saed32hvt_ff1p16v125c.db
../DBs/saed32hvt_ff1p16vn40c.db
../DBs/saed32hvt_ss0p75vn40c.db
../DBs/saed32hvt_ss0p95v125c.db
../DBs/saed32hvt_ss0p95vn40c.db
../DBs/saed32rvt_ff0p95v125c.db
../DBs/saed32rvt_ff0p95vn40c.db
../DBs/saed32rvt_ff1p16v125c.db
../DBs/saed32rvt_ff1p16vn40c.db
../DBs/saed32rvt_ss0p75v125c.db
../DBs/saed32rvt_ss0p75vn40c.db
../DBs/saed32rvt_ss0p95v125c.db
../DBs/saed32rvt_ss0p95vn40c.db
../DBs/saed32lvt_ff0p95v125c.db
../DBs/saed32lvt_ff0p95vn40c.db
../DBs/saed32lvt_ff1p16v125c.db
../DBs/saed32lvt_ff1p16vn40c.db
../DBs/saed32lvt_ss0p75v125c.db
../DBs/saed32lvt_ss0p75vn40c.db
../DBs/saed32lvt_ss0p95v125c.db
../DBs/saed32lvt_ss0p95vn40c.db "]

set link_library  [join " ../DBs/saed32hvt_ff0p95v125c.db 
../DBs/saed32hvt_ff0p95vn40c.db
../DBs/saed32hvt_ff1p16v125c.db
../DBs/saed32hvt_ff1p16vn40c.db
../DBs/saed32hvt_ss0p75vn40c.db
../DBs/saed32hvt_ss0p95v125c.db
../DBs/saed32hvt_ss0p95vn40c.db
../DBs/saed32rvt_ff0p95v125c.db
../DBs/saed32rvt_ff0p95vn40c.db
../DBs/saed32rvt_ff1p16v125c.db
../DBs/saed32rvt_ff1p16vn40c.db
../DBs/saed32rvt_ss0p75v125c.db
../DBs/saed32rvt_ss0p75vn40c.db
../DBs/saed32rvt_ss0p95v125c.db
../DBs/saed32rvt_ss0p95vn40c.db
../DBs/saed32lvt_ff0p95v125c.db
../DBs/saed32lvt_ff0p95vn40c.db
../DBs/saed32lvt_ff1p16v125c.db
../DBs/saed32lvt_ff1p16vn40c.db
../DBs/saed32lvt_ss0p75v125c.db
../DBs/saed32lvt_ss0p75vn40c.db
../DBs/saed32lvt_ss0p95v125c.db
../DBs/saed32lvt_ss0p95vn40c.db "]
define_design_lib work -path ../work_new
analyze -library work -format verilog $my_files




list_designs






#current_design
set_fix_multiple_port_nets -all -buffer_constants 
list_instances
check_design

source /home/gtu18/project_tawhid/vlsi/VLSI_in/rtl/pico1.sdc -verbose -echo

report_port -verbose
report_clock -skew

#set_path_margin 0.5 -from pc_current_reg* -to pc_current_reg*
compile_ultra 
compile_ultra -incremental

check_design
report_area > ../output/area.rpt
report_cell > ../output/cell.rpt
report_qor > ../output/qor.rpt
report_resources > ../output/resources.rpt
report_timing -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../output/setup_ibex.rpt 
report_timing -delay_type min -max_paths 10 -transition -capacitance -nets -significant_digits 3 > ../output/hold_ibex.rpt 




write_sdc ../output/pico1.sdc 
define_name_rules no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri true
set verilogout_equation false
write -hierarchy -format verilog -output ../output/${design}.v 
write -f ddc -hierarchy -output ../output/${design}.ddc 
write_file -format verilog -hierarchy -output ../output/${design}.vg

