----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.01.2025 17:35:13
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
use ieee.numeric_std.all;

entity MEM is
    Generic(
    len_add : positive := 4
    );
    
    Port(
        CLK_mem : in std_logic;
        write : in std_logic;
        address : in std_logic_vector (len_add-1 downto 0);
        inp_val : in std_logic_vector(3 downto 0);
        out_val : out std_logic_vector(3 downto 0)
    );
end MEM;

architecture Behavioral of MEM is
CONSTANT N : positive := 2*len_add;
signal address_temp : std_logic_vector(len_add-1 downto 0);
type MEMORY_N_4 is array (0 to N-1) of std_logic_vector(len_add-1 downto 0); 
constant M_4 : MEMORY_N_4 := (
    "0001",
    "0010",
    "0011",
    "0100",
    "0101",
    "0110",
    "0111",
    "1000"
);
signal MEMO : MEMORY_N_4 := M_4;
begin
process (CLK_mem)
    begin
    if rising_edge(CLK_mem) then
        if(write = '1') then
            MEMO(to_integer(unsigned(address))) <= inp_val;
            address_temp <= address;
        end if;
        out_val <= MEMO(to_integer(unsigned(address_temp)));
    end if;
    end process;
end Behavioral;