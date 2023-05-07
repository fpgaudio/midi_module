

#add wave -noupdate -group my_uvm_tb
#add wave -noupdate -group my_uvm_tb -radix hexadecimal /my_uvm_tb/*

add wave -noupdate -group my_uvm_tb/dut
add wave -noupdate -group my_uvm_tb/dut -radix hexadecimal /my_uvm_tb/dut/*

add wave -noupdate -group my_uvm_tb/dut/midi
add wave -noupdate -group my_uvm_tb/dut/midi -radix hexadecimal /my_uvm_tb/dut/midi/*

add wave -noupdate -group my_uvm_tb/dut/midi/buffer
add wave -noupdate -group my_uvm_tb/dut/midi/buffer -radix hexadecimal /my_uvm_tb/dut/midi/buffer/*

add wave -noupdate -group my_uvm_tb/vif
add wave -noupdate -group my_uvm_tb/vif -radix hexadecimal /my_uvm_tb/vif/*