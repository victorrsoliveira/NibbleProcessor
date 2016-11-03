onerror {exit -code 1}
vlib work
vlog -work work NibbleProcessor.vo
vlog -work work Mux3_1Test.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Mux3_1_vlg_vec_tst -voptargs="+acc"
vcd file -direction NibbleProcessor.msim.vcd
vcd add -internal Mux3_1_vlg_vec_tst/*
vcd add -internal Mux3_1_vlg_vec_tst/i1/*
run -all
quit -f
