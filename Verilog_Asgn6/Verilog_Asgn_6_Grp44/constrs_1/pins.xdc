## This file is a constraints file (.xdc) for the S-AES project on a Nexys4 DDR Rev. C
## The port names (e.g., get_ports {clk}) have been matched to the TopModule.v file.

## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports {clk}]; # Main 100MHz clock
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];


## Switches (for 16-bit plaintext input)
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports {sw[0]}];  # SW0
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports {sw[1]}];  # SW1
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports {sw[2]}];  # SW2
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports {sw[3]}];  # SW3
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports {sw[4]}];  # SW4
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports {sw[5]}];  # SW5
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports {sw[6]}];  # SW6
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports {sw[7]}];  # SW7
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS33 } [get_ports {sw[8]}];  # SW8
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports {sw[9]}];  # SW9
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports {sw[10]}]; # SW10
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports {sw[11]}]; # SW11
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports {sw[12]}]; # SW12
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports {sw[13]}]; # SW13
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports {sw[14]}]; # SW14
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports {sw[15]}]; # SW15


## LEDs (for 16-bit ciphertext output)
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {led[0]}];  # LED0
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports {led[1]}];  # LED1
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports {led[2]}];  # LED2
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports {led[3]}];  # LED3
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports {led[4]}];  # LED4
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {led[5]}];  # LED5
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports {led[6]}];  # LED6
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {led[7]}];  # LED7
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {led[8]}];  # LED8
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports {led[9]}];  # LED9
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {led[10]}]; # LED10
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports {led[11]}]; # LED11
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports {led[12]}]; # LED12
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports {led[13]}]; # LED13
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports {led[14]}]; # LED14
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports {led[15]}]; # LED15


## Buttons
# Using the center button (BTNC) as the reset signal
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports {rst}]; # BTNC