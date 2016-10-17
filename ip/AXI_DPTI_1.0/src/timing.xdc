create_clock -period 16.667 -name PROG_CLKO -waveform {0.000 8.333} [get_ports -prop_thru_buffers PROG_CLKO]
set_input_delay -clock [get_clocks PROG_CLKO] -min -add_delay 1.000 [get_ports -prop_thru_buffers {PROG_D[*]}]
set_input_delay -clock [get_clocks PROG_CLKO] -max -add_delay 7.517 [get_ports -prop_thru_buffers {PROG_D[*]}]
set_input_delay -clock [get_clocks PROG_CLKO] -min -add_delay 1.000 [get_ports -prop_thru_buffers PROG_RXEN]
set_input_delay -clock [get_clocks PROG_CLKO] -max -add_delay 7.517 [get_ports -prop_thru_buffers PROG_RXEN]
set_input_delay -clock [get_clocks PROG_CLKO] -min -add_delay 1.000 [get_ports -prop_thru_buffers PROG_TXEN]
set_input_delay -clock [get_clocks PROG_CLKO] -max -add_delay 7.517 [get_ports -prop_thru_buffers PROG_TXEN]
set_output_delay -clock [get_clocks PROG_CLKO] -min -add_delay 0.000 [get_ports -prop_thru_buffers {PROG_D[*]}]
set_output_delay -clock [get_clocks PROG_CLKO] -max -add_delay 8.000 [get_ports -prop_thru_buffers {PROG_D[*]}]
set_output_delay -clock [get_clocks PROG_CLKO] -min -add_delay 0.000 [get_ports -prop_thru_buffers PROG_OEN]
set_output_delay -clock [get_clocks PROG_CLKO] -max -add_delay 8.000 [get_ports -prop_thru_buffers PROG_OEN]
set_output_delay -clock [get_clocks PROG_CLKO] -min -add_delay 0.000 [get_ports -prop_thru_buffers PROG_RDN]
set_output_delay -clock [get_clocks PROG_CLKO] -max -add_delay 8.000 [get_ports -prop_thru_buffers PROG_RDN]
set_output_delay -clock [get_clocks PROG_CLKO] -min -add_delay 0.000 [get_ports -prop_thru_buffers PROG_WRN]
set_output_delay -clock [get_clocks PROG_CLKO] -max -add_delay 8.000 [get_ports -prop_thru_buffers PROG_WRN]

set_false_path -through [get_pins -filter {NAME =~ *SyncAsync*/oSyncStages_reg[*]/D} -hier]
set_false_path -through [get_pins -filter {NAME =~ *SyncAsync*/oSyncStages*/PRE || NAME =~ *SyncAsync*/oSyncStages*/CLR} -hier]

set_false_path -through [get_pins -filter {NAME =~ *in_*_sync/*/CLR} -hier]
set_false_path -from [get_cells -hier -filter {NAME =~ *in_*_sync/iData_int_reg[*]}] -to [get_cells -hier -filter {NAME=~ *in_*_sync/oData_reg[*]}]