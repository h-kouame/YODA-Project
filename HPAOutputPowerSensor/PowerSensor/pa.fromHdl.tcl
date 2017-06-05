
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name PowerSensor -dir "C:/Xilinx/14.7/ISE_DS/PowerSensor/planAhead_run_2" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Nexys3_Master.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../SPI_Module/SPI_Module.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top SPI_Module $srcset
add_files [list {Nexys3_Master.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
