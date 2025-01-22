----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.01.2025 17:40:09
-- Design Name: 
-- Module Name: counter_mod60 - Behavioral
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

ENTITY counter_mod60 IS
    PORT (
        clk     : IN STD_LOGIC;
        rst     : IN STD_LOGIC;
        en      : IN STD_LOGIC;
        load    : IN STD_LOGIC;
        set     : IN STD_LOGIC_VECTOR(0 TO 5);
        count   : OUT STD_LOGIC_VECTOR(0 TO 5);
        en_next : OUT STD_LOGIC
    );
END counter_mod60;

ARCHITECTURE structural OF counter_mod60 IS
    COMPONENT flip_flop_t IS
        PORT (
        clk     : IN STD_LOGIC;
        rst       : IN STD_LOGIC;
        en        : IN STD_LOGIC;
        rst_count : IN STD_LOGIC;
        load      : IN STD_LOGIC;
        set       : IN STD_LOGIC;
        count     : OUT STD_LOGIC
    );
    END COMPONENT flip_flop_t;

    SIGNAL counter : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
    SIGNAL reset   : STD_LOGIC := '0';
    SIGNAL en_combined   : STD_LOGIC_VECTOR(5 DOWNTO 0); -- Segnali di abilitazione combinata

BEGIN
    -- 59 in binario = 111011
    reset <= counter(5) AND counter(4) AND counter(3) AND NOT counter(2) AND counter(1) AND counter(0);
    en_next <= reset;

    -- Generazione dei segnali di abilitazione combinata
    en_combined(0) <= en;
    en_combined(1) <= counter(0) AND en;
    en_combined(2) <= counter(0) AND counter(1) AND en;
    en_combined(3) <= counter(0) AND counter(1) AND counter(2) AND en;
    en_combined(4) <= counter(0) AND counter(1) AND counter(2) AND counter(3) AND en;
    en_combined(5) <= counter(0) AND counter(1) AND counter(2) AND counter(3) AND counter(4) AND en;

    U0 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(0),
        rst_count => reset,
        load      => load,
        set       => set(5),
        count     => counter(0)
    );

    U1 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(1),
        rst_count => reset,
        load      => load,
        set       => set(4),
        count     => counter(1)
    );

    U2 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(2),
        rst_count => reset,
        load      => load,
        set       => set(3),
        count     => counter(2)
    );

    U3 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(3),
        rst_count => reset,
        load      => load,
        set       => set(2),
        count     => counter(3)
    );

    U4 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(4),
        rst_count => reset,
        load      => load,
        set       => set(1),
        count     => counter(4)
    );

    U5 : flip_flop_t PORT MAP (
        clk       => clk,
        rst       => rst,
        en        => en_combined(5),
        rst_count => reset,
        load      => load,
        set       => set(0),
        count     => counter(5)
    );

    count <= counter;

END structural;
