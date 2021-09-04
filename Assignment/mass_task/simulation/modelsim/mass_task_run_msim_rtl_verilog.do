transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Aadhithan/Documents/Code-sync/Maven_verilog/Assignment/mass_task {C:/Users/Aadhithan/Documents/Code-sync/Maven_verilog/Assignment/mass_task/mass_task.v}

