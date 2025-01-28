----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2024 17:53:42
-- Design Name: 
-- Module Name: contatore - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity contatore is
    generic(bits : integer := 4);
    
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   enable : in STD_LOGIC; 
           counter : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end contatore;

architecture Behavioral of contatore is

signal c : std_logic_vector (bits-1 downto 0) := (others => '0');
begin
counter <= c;

counter_process: process(clock)
begin
    
     if(rising_edge(clock)) then	  
	   if reset = '1' then
		  c <= (others => '0');
	   elsif enable = '1' then
		  c <= std_logic_vector(unsigned(c) + 1);
	  end if;
	 end if;
end process;

end Behavioral;