----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2024 11:50:51
-- Design Name: 
-- Module Name: reteInterconnessione_16_4 - structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reteInterconnessione_16_4 is
      Port (
        d : in std_logic_vector(15 downto 0);
        sel : in std_logic_vector(5 downto 0);
        y : out std_logic_vector(3 downto 0)
      );
end reteInterconnessione_16_4;

architecture structural of reteInterconnessione_16_4 is
    signal u0: std_logic := '0'; --Segnale di interconnessione per connettere mux 16-1 con demux 1-4

component mux16_1 
	   port(	
           c0 : in STD_LOGIC;
           c1 : in STD_LOGIC;
           c2 : in STD_LOGIC;
           c3 : in STD_LOGIC;
           c4 : in STD_LOGIC;
           c5 : in STD_LOGIC;
           c6 : in STD_LOGIC;
           c7 : in STD_LOGIC;
           c8 : in STD_LOGIC;
           c9 : in STD_LOGIC;
           c10 : in STD_LOGIC;
           c11 : in STD_LOGIC;
           c12 : in STD_LOGIC;
           c13 : in STD_LOGIC;
           c14 : in STD_LOGIC;
           c15 : in STD_LOGIC;
           se0 : in STD_LOGIC;
           se1 : in STD_LOGIC;
           se2 : in STD_LOGIC;
           se3 : in STD_LOGIC;
           y1 : out STD_LOGIC
          );		
    end component;

component demux_1_4 
	   port(	
           b : in STD_LOGIC;
           f0 : in STD_LOGIC;
           f1 : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC;
           y2 : out STD_LOGIC;
           y3 : out STD_LOGIC
          );		
    end component;

begin

mux1: mux16_1
    port map(
           c0 =>d(0),
           c1 =>d(1),
           c2 =>d(2),
           c3 =>d(3),
           c4 =>d(4),
           c5 =>d(5),
           c6 =>d(6),
           c7 =>d(7),
           c8 =>d(8),
           c9 =>d(9),
           c10 =>d(10),
           c11 =>d(11),
           c12 =>d(12),
           c13 =>d(13),
           c14 =>d(14),
           c15 =>d(15), 
           se0 =>sel(0),
           se1 =>sel(1),
           se2 =>sel(2),
           se3 =>sel(3),
           y1 => u0
           );

demux1: demux_1_4
    port map(
           b => u0,
           f0 =>sel(4),
           f1 =>sel(5),
           y0 =>y(0),
           y1 =>y(1),
           y2 =>y(2),
           y3 =>y(3)
           );

end structural;
