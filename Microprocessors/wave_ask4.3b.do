onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ramcontrollertb/we
add wave -noupdate /ramcontrollertb/re
add wave -noupdate -radix unsigned /ramcontrollertb/datawr
add wave -noupdate /ramcontrollertb/addr
add wave -noupdate -radix unsigned /ramcontrollertb/datard
add wave -noupdate /ramcontrollertb/i
add wave -noupdate /ramcontrollertb/j
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1024 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 312
configure wave -valuecolwidth 262
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {500 ps} {1301 ps}
