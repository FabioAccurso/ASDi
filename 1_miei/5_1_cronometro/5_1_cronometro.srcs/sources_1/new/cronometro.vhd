----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.01.2025 18:40:10
-- Design Name: 
-- Module Name: cronometro - Behavioral
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

ENTITY cronometro IS
    PORT (
        clk        : IN STD_LOGIC;
        rst        : IN STD_LOGIC;
        start_stop : IN STD_LOGIC;
        load_sec   : IN STD_LOGIC;
        load_min   : IN STD_LOGIC;
        load_hours : IN STD_LOGIC;
        set_sec    : IN STD_LOGIC_VECTOR(0 TO 5);
        set_min    : IN STD_LOGIC_VECTOR(0 TO 5);
        set_hours  : IN STD_LOGIC_VECTOR(0 TO 4);
        seconds    : OUT STD_LOGIC_VECTOR(0 TO 5);
        minutes : OUT STD_LOGIC_VECTOR(0 TO 5);
        hours   : OUT STD_LOGIC_VECTOR(0 TO 4)
    );
END ENTITY cronometro;

ARCHITECTURE structural OF cronometro IS

    COMPONENT counter_mod24 IS
        PORT (
            clk   : IN STD_LOGIC;
            rst   : IN STD_LOGIC;
            en    : IN STD_LOGIC;
            load  : IN STD_LOGIC;
            set   : IN STD_LOGIC_VECTOR(0 TO 4);
            count : OUT STD_LOGIC_VECTOR(0 TO 4)
        );
    END COMPONENT counter_mod24;

    COMPONENT counter_mod60 IS
        PORT (
            clk      : IN STD_LOGIC;
            rst      : IN STD_LOGIC;
            en       : IN STD_LOGIC;
            load     : IN STD_LOGIC;
            set      : IN STD_LOGIC_VECTOR(0 TO 5);
            count    : OUT STD_LOGIC_VECTOR(0 TO 5);
            en_next  : OUT STD_LOGIC
        );
    END COMPONENT counter_mod60;

    COMPONENT divisore_frequenza IS
    -- GENERIC (
    -- freq_in  : INTEGER := 10000000;
    -- freq_out : INTEGER := 1000000
    -- );
        PORT (
            clock_in  : IN STD_LOGIC;
            reset     : IN STD_LOGIC;
            clock_out : OUT STD_LOGIC
        );
    END COMPONENT divisore_frequenza;
    
    SIGNAL new_clock : STD_LOGIC;
    SIGNAL en_min    : STD_LOGIC := '0';
    SIGNAL en_hours  : STD_LOGIC := '0';
    
    SIGNAL a1 : STD_LOGIC := '0';
    SIGNAL a2 : STD_LOGIC := '0';
    SIGNAL a3 : STD_LOGIC := '0';
    
    BEGIN
        divisore_freq : divisore_frequenza
        PORT MAP (
            clock_in  => clk,
            reset     => rst,
            clock_out => new_clock
        );
    
        a1 <= start_stop AND new_clock;

        counter_sec : counter_mod60
        PORT MAP (
            clk      => clk,
            rst      => rst,
            en       => a1,
            load     => load_sec,
            set      => set_sec,
            count    => seconds,
            en_next  => en_min
        );
    
        a2 <= en_min AND start_stop AND new_clock;
    
        counter_min : counter_mod60
        PORT MAP (
            clk      => clk,
            rst      => rst,
            en       => a2,
            load     => load_min,
            set      => set_min,
            count    => minutes,
            en_next  => en_hours
        );
        
        a3 <= en_hours AND en_min AND start_stop AND new_clock;

        counter_hours : counter_mod24
        PORT MAP (
            clk   => clk,
            rst   => rst,
            en    => a3,
            load  => load_hours,
            set   => set_hours,
            count => hours
        );
    
END structural;

            
    








