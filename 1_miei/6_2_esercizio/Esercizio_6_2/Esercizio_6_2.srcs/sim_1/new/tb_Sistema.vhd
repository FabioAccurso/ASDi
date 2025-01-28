----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2024 14:47:38
-- Design Name: 
-- Module Name: tb_Sistema - Behavioral
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

entity tb_Sistema is
end tb_Sistema;

architecture Behavioral of tb_Sistema is

    -- Component under test (CUT)
    component Sistema
        generic(bits : integer := 4;
                N : integer := 16);
        port (
            clock : in std_logic;
            reset : in std_logic;
            start : in std_logic
        );
    end component;

    -- Dichiarazione dei segnali di stimolo
    signal clock_tb : std_logic := '0';
    signal reset_tb : std_logic := '0';
    signal start_tb : std_logic := '0';

    -- Parametri per simulazione
    constant clk_period : time := 10 ns;

begin

    -- Istanza del Sistema
    CUT: Sistema
        generic map(bits => 4, N => 16)
        port map(
            clock => clock_tb,
            reset => reset_tb,
            start => start_tb
        );

    -- Processo per generare il clock
    clock_gen: process
    begin
        while true loop
            clock_tb <= '0';
            wait for clk_period / 2;
            clock_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Processo di simulazione
    stim_proc: process
    begin
        -- Reset iniziale
        reset_tb <= '1';
        wait for clk_period;
        reset_tb <= '0';
        wait for clk_period * 5;
        -- Applicazione del segnale di start
        start_tb <= '1';
        wait for clk_period * 5;
        start_tb <= '0';
         

        wait;
    end process;

end Behavioral;
