onerror {exit -code 1}
vlib work
vlog -work work NibbleProcessor.vo
vlog -work work Reg24Test.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Register24Bits_vlg_vec_tst -voptargs="+acc"
vcd file -direction NibbleProcessor.msim.vcd
vcd add -internal Register24Bits_vlg_vec_tst/*
vcd add -internal Register24Bits_vlg_vec_tst/i1/*
run -all
quit -f
