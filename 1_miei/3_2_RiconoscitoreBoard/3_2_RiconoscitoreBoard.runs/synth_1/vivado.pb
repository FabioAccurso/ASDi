
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:072default:default2
00:00:072default:default2
462.5592default:default2
196.6682default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/utils_1/imports/synth_1/control_unit.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/utils_1/imports/synth_1/control_unit.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
w
Command: %s
53*	vivadotcl2F
2synth_design -top TopModule -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
198722default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1295.055 ; gain = 410.973
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2
	TopModule2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/new/TopModule.vhd2default:default2
162default:default8@Z8-638h px� 
`
%s
*synth2H
4	Parameter CLK_period bound to: 10 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter btn_noise_time bound to: 10000000 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
ButtonDebouncer2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/2_suoi/12_ROM_ON_DISPLAY/12_ROM_ON_DISPLAY.srcs/sources_1/imports/sources_1/new/ButtonDebouncer.vhd2default:default2
132default:default2
bot12default:default2#
ButtonDebouncer2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/new/TopModule.vhd2default:default2
482default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2#
ButtonDebouncer2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/2_suoi/12_ROM_ON_DISPLAY/12_ROM_ON_DISPLAY.srcs/sources_1/imports/sources_1/new/ButtonDebouncer.vhd2default:default2
252default:default8@Z8-638h px� 
`
%s
*synth2H
4	Parameter CLK_period bound to: 10 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter btn_noise_time bound to: 10000000 - type: integer 
2default:defaulth p
x
� 
�
default block is never used226*oasys2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/2_suoi/12_ROM_ON_DISPLAY/12_ROM_ON_DISPLAY.srcs/sources_1/imports/sources_1/new/ButtonDebouncer.vhd2default:default2
582default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2#
ButtonDebouncer2default:default2
02default:default2
12default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/2_suoi/12_ROM_ON_DISPLAY/12_ROM_ON_DISPLAY.srcs/sources_1/imports/sources_1/new/ButtonDebouncer.vhd2default:default2
252default:default8@Z8-256h px� 
`
%s
*synth2H
4	Parameter CLK_period bound to: 10 - type: integer 
2default:defaulth p
x
� 
j
%s
*synth2R
>	Parameter btn_noise_time bound to: 10000000 - type: integer 
2default:defaulth p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2#
ButtonDebouncer2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/2_suoi/12_ROM_ON_DISPLAY/12_ROM_ON_DISPLAY.srcs/sources_1/imports/sources_1/new/ButtonDebouncer.vhd2default:default2
132default:default2
bot22default:default2#
ButtonDebouncer2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/new/TopModule.vhd2default:default2
602default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
riconoscitore2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/1_miei/3_1_riconoscitoreSequenza/3_1_riconoscitoreSequenza.srcs/sources_1/new/riconoscitore.vhd2default:default2
52default:default2
	riconosci2default:default2!
riconoscitore2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/new/TopModule.vhd2default:default2
722default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2!
riconoscitore2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/1_miei/3_1_riconoscitoreSequenza/3_1_riconoscitoreSequenza.srcs/sources_1/new/riconoscitore.vhd2default:default2
162default:default8@Z8-638h px� 
�
default block is never used226*oasys2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/1_miei/3_1_riconoscitoreSequenza/3_1_riconoscitoreSequenza.srcs/sources_1/new/riconoscitore.vhd2default:default2
282default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2!
riconoscitore2default:default2
02default:default2
12default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/1_miei/3_1_riconoscitoreSequenza/3_1_riconoscitoreSequenza.srcs/sources_1/new/riconoscitore.vhd2default:default2
162default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	TopModule2default:default2
02default:default2
12default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/new/TopModule.vhd2default:default2
162default:default8@Z8-256h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1385.414 ; gain = 501.332
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1385.414 ; gain = 501.332
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1385.414 ; gain = 501.332
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1385.4142default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc2default:default2/
.Xil/TopModule_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1478.2272default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1478.2272default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2!
BTN_state_reg2default:default2#
ButtonDebouncer2default:defaultZ8-802h px� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2s
_             not_pressed |                               00 |                               00
2default:defaulth p
x
� 
�
%s
*synth2s
_             chk_pressed |                               01 |                               01
2default:defaulth p
x
� 
�
%s
*synth2s
_                 pressed |                               10 |                               10
2default:defaulth p
x
� 
�
%s
*synth2s
_         chk_not_pressed |                               11 |                               11
2default:defaulth p
x
� 
�
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
BTN_state_reg2default:default2

sequential2default:default2#
ButtonDebouncer2default:defaultZ8-3354h px� 
�
!inferring latch for variable '%s'327*oasys2&
stato_prossimo_reg2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.srcs/sources_1/imports/vhdl/1_miei/3_1_riconoscitoreSequenza/3_1_riconoscitoreSequenza.srcs/sources_1/new/riconoscitore.vhd2default:default2
332default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:13 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 2     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 4     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 14    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 6     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:20 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:20 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:20 ; elapsed = 00:00:20 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    16|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT2   |     4|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT3   |     2|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT4   |    16|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT5   |     8|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT6   |    12|
2default:defaulth px� 
D
%s*synth2,
|8     |FDRE   |    75|
2default:defaulth px� 
D
%s*synth2,
|9     |LD     |     3|
2default:defaulth px� 
D
%s*synth2,
|10    |IBUF   |     6|
2default:defaulth px� 
D
%s*synth2,
|11    |OBUF   |     1|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:16 ; elapsed = 00:00:23 . Memory (MB): peak = 1478.227 ; gain = 501.332
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 1478.227 ; gain = 594.145
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1478.2272default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
192default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1478.2272default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
E  A total of 3 instances were transformed.
  LD => LDCE: 3 instances
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
19e34b282default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
342default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:272default:default2
00:00:292default:default2
1478.2272default:default2
991.5122default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
�C:/Users/Fabio/Desktop/Magistrale/Architettura_dei_Sistemi_Digitali/vhdl/1_miei/3_2_RiconoscitoreBoard/3_2_RiconoscitoreBoard.runs/synth_1/TopModule.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2|
hExecuting : report_utilization -file TopModule_utilization_synth.rpt -pb TopModule_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Jan 27 19:39:00 20252default:defaultZ17-206h px� 


End Record