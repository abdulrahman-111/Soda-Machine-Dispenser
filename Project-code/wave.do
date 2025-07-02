onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /vprojnew/rst
add wave -noupdate -radix unsigned /vprojnew/clk
add wave -noupdate -radix unsigned /vprojnew/N
add wave -noupdate -radix unsigned /vprojnew/D
add wave -noupdate -radix unsigned /vprojnew/Q
add wave -noupdate -radix unsigned /vprojnew/dut/next
add wave -noupdate -radix unsigned /vprojnew/dut/current
add wave -noupdate -radix unsigned /vprojnew/dis
add wave -noupdate -radix unsigned /vprojnew/oN
add wave -noupdate -radix unsigned /vprojnew/oD
add wave -noupdate -radix unsigned /vprojnew/o2D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {160 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {901 ps}
