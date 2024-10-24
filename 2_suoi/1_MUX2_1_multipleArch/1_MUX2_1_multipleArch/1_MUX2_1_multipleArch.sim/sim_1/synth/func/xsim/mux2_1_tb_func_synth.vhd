-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Oct  3 15:06:28 2022
-- Host        : LAPTOP-L0BA6RC1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/esempiVIVADO/1_MUX/1_MUX.sim/sim_1/synth/func/xsim/mux2_1_tb_func_synth.vhd
-- Design      : mux_2_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a50ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mux_2_1 is
  port (
    a0 : in STD_LOGIC;
    a1 : in STD_LOGIC;
    s : in STD_LOGIC;
    y : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mux_2_1 : entity is true;
end mux_2_1;

architecture STRUCTURE of mux_2_1 is
  signal a0_IBUF : STD_LOGIC;
  signal a1_IBUF : STD_LOGIC;
  signal s_IBUF : STD_LOGIC;
  signal y_OBUF : STD_LOGIC;
begin
a0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => a0,
      O => a0_IBUF
    );
a1_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => a1,
      O => a1_IBUF
    );
s_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => s,
      O => s_IBUF
    );
y_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => y_OBUF,
      O => y
    );
y_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => a1_IBUF,
      I1 => a0_IBUF,
      I2 => s_IBUF,
      O => y_OBUF
    );
end STRUCTURE;
