----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.01.2025 15:52:44
-- Design Name: 
-- Module Name: converti_count - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity converti_count is
    Port (
        secondi : in std_logic_vector(0 to 5);
        minuti : in std_logic_vector(0 to 5);
        ore : in std_logic_vector(0 to 4);
        outp : out std_logic_vector(23 downto 0)
    );
end converti_count;

architecture beh of converti_count is
    signal secondi_u : integer;
    signal secondi_d : integer;
    signal minuti_u : integer;
    signal minuti_d : integer;
    signal ore_u : integer;
    signal ore_d : integer;

    signal secondi_tot : std_logic_vector(7 downto 0);
    signal minuti_tot : std_logic_vector(7 downto 0);
    signal ore_tot : std_logic_vector(7 downto 0);
    signal uscita_temp : std_logic_vector(23 downto 0);

begin
    secondi_u <= to_integer(unsigned(secondi)) mod 10;
    secondi_d <= to_integer(unsigned(secondi)) / 10;
    minuti_u <= to_integer(unsigned(minuti)) mod 10;
    minuti_d <= to_integer(unsigned(minuti)) / 10;
    ore_u <= to_integer(unsigned(ore)) mod 10;
    ore_d <= to_integer(unsigned(ore)) / 10;

    secondi_tot(3 downto 0) <= std_logic_vector(to_unsigned(secondi_u, 4));
    secondi_tot(7 downto 4) <= std_logic_vector(to_unsigned(secondi_d, 4));

    minuti_tot(3 downto 0) <= std_logic_vector(to_unsigned(minuti_u, 4));
    minuti_tot(7 downto 4) <= std_logic_vector(to_unsigned(minuti_d, 4));

    ore_tot(3 downto 0) <= std_logic_vector(to_unsigned(ore_u, 4));
    ore_tot(7 downto 4) <= std_logic_vector(to_unsigned(ore_d, 4));

    uscita_temp(7 downto 0) <= secondi_tot;
    uscita_temp(15 downto 8) <= minuti_tot;
    uscita_temp(23 downto 16) <= ore_tot;

    outp <= uscita_temp;
end beh;

