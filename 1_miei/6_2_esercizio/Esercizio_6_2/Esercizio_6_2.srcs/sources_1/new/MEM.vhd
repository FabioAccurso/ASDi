----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2024 11:00:22
-- Design Name: 
-- Module Name: MEM - Behavioral
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


entity MEM is

    generic (bits : integer := 4);
    port(
        clk : in std_logic;
        write : in std_logic;
        address : in std_logic_vector(bits-1 downto 0);                                
        input : in std_logic_vector(3 downto 0)
    );
    
end MEM;


architecture behavioral of MEM is 
type MEMORY_N_4 is array (0 to (2**bits)-1) of std_logic_vector(3 downto 0);
constant MEM_N_4 : MEMORY_N_4 := (

"0000", "0000", "0000", "0000", 
"0000", "0000", "0000", "0000",
"0000", "0000", "0000", "0000", 
"0000", "0000", "0000", "0000");
 
signal memo : MEMORY_N_4 := MEM_N_4;
                                          
begin

main: process(clk)
begin
    
     if(rising_edge(clk)) then	  
	   if write = '1' then
		  memo(to_integer(unsigned(address))) <= input;
	   end if;
	 end if;
end process;
end behavioral;