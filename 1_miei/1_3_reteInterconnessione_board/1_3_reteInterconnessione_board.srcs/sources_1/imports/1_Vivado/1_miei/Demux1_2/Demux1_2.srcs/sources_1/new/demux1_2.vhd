----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2024 12:04:34
-- Design Name: 
-- Module Name: demux1_2 - Behavioral
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

entity demux1_2 is
    Port ( a : in STD_LOGIC;
           s : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC);
end demux1_2;

architecture dataflow of demux1_2 is

begin
    with s select
        y0 <= a when '0',
              '0' when '1',
              '-' when others;
   with s select       
        y1 <= '0' when '0',
              a when '1',
              '-' when others;    

end dataflow;


