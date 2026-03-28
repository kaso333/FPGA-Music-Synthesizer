### Constraints (XDC)

<xaiArtifact artifact_id="8c2819ee-5be0-4b83-af4e-a566544dc2b8" artifact_version_id="513a8332-219c-4a70-8c65-70dc6056fc8c" title="Organki_extended_rgb.xdc" contentType="text/plain">

## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { Clock100MHz }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { Clock100MHz }];

## Switches
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]; #IO_L13N_T2_MRCC_16 Sch=sw[2]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]; #IO_L14P_T2_SRCC_16 Sch=sw[3]

## Buttons
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { Button[0] }]; #IO_L6N_T0_VREF_16 Sch=btn[0]
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { Button[1] }]; #IO_L11P_T1_SRCC_16 Sch=btn[1]
set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { Button[2] }]; #IO_L11N_T1_SRCC_16 Sch=btn[2]
set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { Button[3] }]; #IO_L12P_T1_MRCC_16 Sch=btn[3]

## RGB LEDs
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { LED0_B }]; #IO_L18N_T2_35 Sch=LED0_b
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { LED0_G }]; #IO_L19N_T3_VREF_35 Sch=LED0_g
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { LED0_R }]; #IO_L19P_T3_35 Sch=LED0_r
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { LED1_B }]; #IO_L20P_T3_35 Sch=LED1_b
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { LED1_G }]; #IO_L21P_T3_DQS_35 Sch=LED1_g
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { LED1_R }]; #IO_L20N_T3_35 Sch=LED1_r
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { LED2_B }]; #IO_L21N_T3_DQS_35 Sch=LED2_b
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { LED2_G }]; #IO_L22N_T3_35 Sch=LED2_g
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { LED2_R }]; #IO_L22P_T3_35 Sch=LED2_r
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { LED3_B }]; #IO_L23P_T3_35 Sch=LED3_b
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { LED3_G }]; #IO_L24P_T3_35 Sch=LED3_g
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { LED3_R }]; #IO_L23N_T3_35 Sch=LED3_r

## Buzzer
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { Buzzer }]; #IO_L10N_T1_D15_14 Sch=ck_ioa
