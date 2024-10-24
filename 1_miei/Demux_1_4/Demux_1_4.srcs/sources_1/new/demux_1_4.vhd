----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2024 12:24:59
-- Design Name: 
-- Module Name: demux_1_4 - structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux_1_4 is
    Port ( b : in STD_LOGIC;
           f0 : in STD_LOGIC;
           f1 : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC;
           y2 : out STD_LOGIC;
           y3 : out STD_LOGIC);
end demux_1_4;

architecture structural of demux_1_4 is
signal u0: std_logic := '0';
signal u1: std_logic := '0';

component demux1_2
        Port ( a : in STD_LOGIC;
           s : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC);
end component;

begin
    demux0: demux1_2
    Port map(
        a => b,
        s => f1,
        y0 => u0,
        y1 => u1
    );
    
    demux1: demux1_2
    Port map(
        a => u0,
        s => f0,
        y0 => y0,
        y1 => y1
    );
    
    
    demux2: demux1_2
    Port map(
        a => u1,
        s => f0,
        y0 => y2,
        y1 => y3
    );



end structural;
