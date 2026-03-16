# [cite_start]Assign the 100MHz system clock to the 'clk' input port [cite: 41]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];

set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { reset }]; # BTNC


# [cite_start]Map SW7 down to SW0 to the 8-bit 'multiplicand' input [cite: 43]
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[0] }]; # SW0
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[1] }]; # SW1
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[2] }]; # SW2
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[3] }]; # SW3
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[4] }]; # SW4
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[5] }]; # SW5
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[6] }]; # SW6
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { multiplicand[7] }]; # SW7

# [cite_start]Map SW15 down to SW8 to the 8-bit 'multiplier' input [cite: 44]
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS33 } [get_ports { multiplier[0] }];  # SW8
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { multiplier[1] }];  # SW9
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { multiplier[2] }];  # SW10
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { multiplier[3] }];  # SW11
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { multiplier[4] }];  # SW12
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { multiplier[5] }];  # SW13
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { multiplier[6] }];  # SW14
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { multiplier[7] }];  # SW15


set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { product[0] }];  # LED0
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { product[1] }];  # LED1
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { product[2] }];  # LED2
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { product[3] }];  # LED3
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { product[4] }];  # LED4
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { product[5] }];  # LED5
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { product[6] }];  # LED6
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { product[7] }];  # LED7
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { product[8] }];  # LED8
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { product[9] }];  # LED9
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { product[10] }]; # LED10
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { product[11] }]; # LED11
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { product[12] }]; # LED12
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { product[13] }]; # LED13
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { product[14] }]; # LED14
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { product[15] }]; # LED15