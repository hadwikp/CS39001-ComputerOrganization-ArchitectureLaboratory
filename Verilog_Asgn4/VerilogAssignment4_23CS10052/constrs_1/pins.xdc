## mainCounter pin assignments for Nexys4 DDR Rev. C
## Map top-level ports of mainCounter(...) to physical pins

## Board 100 MHz clock -> top-level clk_in
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_in }]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_in }];

## Switch used as direction input (dirn) -> SW0
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { dirn }]; # SW0

## Push-buttons: use BTNC and BTNU for resets
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { reset }];  # BTNC (center)
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { rst_clk }]; # BTNU (up)

## LEDs (connect mainCounter out[3:0] to LED0..LED3)
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { out[0] }]; # LED0 (Sum[0])
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { out[1] }]; # LED1 (Sum[1])
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { out[2] }]; # LED2 (Sum[2])
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { out[3] }]; # LED3 (Sum[3])

## mode_led -> LED4 (Cout)
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { mode_led }]; # LED4 (Cout)
