#####

set EXTCLK "clock";
set_units -time 1.0ns;

set_units -capacitance 1.0pF;
set EXTCLK_PERIOD 10.0;

create_clock -name "$EXTCLK" -period "$EXTCLK_PERIOD" -waveform "0 [expr $EXTCLK_PERIOD/2]" [get_ports clock]
set SKEW 0.200
set_clock_uncertainity $SKEW [get_clocks $EXTCLK]
set MINRISE 0.20
set MAXRISE 0.25
set MINFALL 0.20
set MAXFALL 0.25

set_clock_transition -rise -min $MINRISE [get_clocks $EXTCLK]
set_clock_transition -rise -max $MAXRISE [get_clocks $EXTCLK]
set_clock_transition -fall -min $MINFALL [get_clocks $EXTCLK]
set_clock_transition -fall -max $MAXFALL [get_clocks $EXTCLK]

########## DELAY DEFENITION #########

set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports clk]
set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports rst]
set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports y]
set_input_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports x]

set_output_delay -clock [get_clocks $EXTCLK] -add_delay 0.3 [get_ports p]

set_max_fanout 10 [all_inputs]
set_max_capacitance 0.5 [all_outputs]
set_min_capacitance 0.05 [all_inputs]
