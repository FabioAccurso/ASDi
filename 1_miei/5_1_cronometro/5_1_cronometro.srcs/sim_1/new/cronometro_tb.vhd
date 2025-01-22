----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.01.2025 18:48:59
-- Design Name: 
-- Module Name: cronometro_tb - Behavioral
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

ENTITY cronometro_tb IS
END cronometro_tb;

ARCHITECTURE bench OF cronometro_tb IS

    COMPONENT cronometro
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
            minutes    : OUT STD_LOGIC_VECTOR(0 TO 5);
            hours      : OUT STD_LOGIC_VECTOR(0 TO 4)
        );
    END COMPONENT;

    SIGNAL clk        : STD_LOGIC;
    SIGNAL rst        : STD_LOGIC := '0';
    SIGNAL start_stop : STD_LOGIC := '0';
    SIGNAL load_sec   : STD_LOGIC := '0';
    SIGNAL load_min   : STD_LOGIC := '0';
    SIGNAL load_hours : STD_LOGIC := '0';
    SIGNAL set_sec    : STD_LOGIC_VECTOR(0 TO 5) := (OTHERS => '0');
    SIGNAL set_min   : STD_LOGIC_VECTOR(0 TO 5) := (OTHERS => '0');
    SIGNAL set_hours : STD_LOGIC_VECTOR(0 TO 4) := (OTHERS => '0');
    SIGNAL seconds   : STD_LOGIC_VECTOR(0 TO 5);
    SIGNAL minutes   : STD_LOGIC_VECTOR(0 TO 5);
    SIGNAL hours     : STD_LOGIC_VECTOR(0 TO 4);

    CONSTANT clock_period : TIME := 10 ns;
    SIGNAL stop_the_clock : BOOLEAN := FALSE;

BEGIN

    uut : cronometro PORT MAP (
        clk        => clk,
        rst        => rst,
        start_stop => start_stop,
        load_sec   => load_sec,
        load_min   => load_min,
        load_hours => load_hours,
        set_sec    => set_sec,
        set_min    => set_min,
        set_hours  => set_hours,
        seconds    => seconds,
        minutes    => minutes,
        hours      => hours
    );

    stimulus : PROCESS
    BEGIN
        WAIT FOR 10 ns;
        start_stop <= '1';

        WAIT FOR 800 ns;
        start_stop <= '0';

        stop_the_clock <= true;
        WAIT;
    END PROCESS;

    clocking : PROCESS
    BEGIN
        WHILE NOT stop_the_clock LOOP
            clk <= '0', '1' AFTER clock_period / 2;
            WAIT FOR clock_period;
        END LOOP;
        WAIT;
    END PROCESS;

END;





