----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2024 23:42:56
-- Design Name: 
-- Module Name: macchina_M - Behavioral
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

entity macchina_M is
    Port ( valore_Mem : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end macchina_M;

architecture Behavioral of macchina_M is

begin

    output(3) <= valore_Mem(7) AND valore_Mem(6);
    output(2) <= valore_Mem(5) AND valore_Mem(4);
    output(1) <= valore_Mem(3) AND valore_Mem(2);
    output(0) <= valore_Mem(1) AND valore_Mem(0);
    
end Behavioral;
