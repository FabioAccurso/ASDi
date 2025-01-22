----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.01.2025 18:08:36
-- Design Name: 
-- Module Name: divisore_frequenza - Behavioral
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

ENTITY divisore_frequenza IS
    PORT (
        clock_in  : IN STD_LOGIC;
        reset     : IN STD_LOGIC;
        clock_out : OUT STD_LOGIC
    );
END divisore_frequenza;

ARCHITECTURE Behavioral OF divisore_frequenza IS
    SIGNAL count : unsigned(27 DOWNTO 0) := (OTHERS => '0');
    SIGNAL no_division : BOOLEAN := true;

    -- inserire 99999999 al posto di 9 per passare da 100 MHz a 1 Hz
    CONSTANT divider : unsigned(27 DOWNTO 0) := to_unsigned(9, 28);

BEGIN
    PROCESS (clock_in, reset, no_division)
    BEGIN
        IF no_division = true THEN
            clock_out <= clock_in;
        ELSE
            IF reset = '1' THEN
                count <= (OTHERS => '0');
                clock_out <= '0';
            ELSIF rising_edge(clock_in) THEN
                IF count = divider THEN
                    count <= (OTHERS => '0');
                    clock_out <= '1';
                ELSE
                    clock_out <= '0';
                    count <= count + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

END Behavioral;



