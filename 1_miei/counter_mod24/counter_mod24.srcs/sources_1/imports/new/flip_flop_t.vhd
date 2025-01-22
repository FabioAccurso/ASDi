----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.01.2025 15:36:49
-- Design Name: 
-- Module Name: flip_flop_t - Behavioral
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

ENTITY flip_flop_t IS
    PORT (
        clk       : IN  STD_LOGIC;
        rst       : IN  STD_LOGIC;
        en        : IN  STD_LOGIC;
        rst_count : IN  STD_LOGIC;
        load      : IN  STD_LOGIC;
        set       : IN  STD_LOGIC;
        count     : OUT STD_LOGIC
    );
END ENTITY flip_flop_t;

ARCHITECTURE behavioral OF flip_flop_t IS

SIGNAL counter_value : STD_LOGIC := '0';

BEGIN
    fft : PROCESS (clk)
    BEGIN
        IF (falling_edge(clk)) THEN
            IF (rst = '1') THEN
                counter_value <= '0';
            ELSE
                IF (load = '1') THEN
                    counter_value <= set;
                ELSE
                    IF (rst_count = '1') THEN
                        counter_value <= '0';
                    ELSE
                        IF (en = '1') THEN
                            counter_value <= NOT counter_value;
                        END IF;
            END IF;
        END IF;
    END IF;
END IF;
END PROCESS;

count <= counter_value;

END behavioral;
