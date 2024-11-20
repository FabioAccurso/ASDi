----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 12:08:00
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit is
    port(
        clock   :   in std_logic;
        value8_in : in std_logic_vector(7 downto 0);
        uploadFirst : in std_logic;
        uploadSecond : in std_logic;
        value16_out : out std_logic_vector(15 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is

signal reg_value : std_logic_vector(15 downto 0) := (others =>'0');

begin

value16_out <= reg_value;

process(clock)
begin

    if (clock'event and clock = '1') then
        if(uploadFirst='1') then
            reg_value(7 downto 0) <= value8_in;
        elsif (uploadSecond = '1') then
            reg_value(15 downto 8) <= value8_in;
        end if;
    end if;
    
end process;


end Behavioral;