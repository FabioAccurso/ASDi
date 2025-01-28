----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2025 17:21:40
-- Design Name: 
-- Module Name: sis_tot_tb - Behavioral
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

entity sis_tot_tb is
end entity sis_tot_tb;

architecture bench of sis_tot_tb is
    component sis_tot
        port(
            clk : in std_logic;
            reset : in std_logic;
            start_send : in std_logic)
        ;
        end component;
        
        signal CLK, RST: std_logic := '0';
        signal start_temp : std_logic := '0';
        constant clock_period: time := 10 ns;
        
    begin
        uut: sis_tot
            port map (
                reset => RST,
                clk => CLK,
                start_send=> start_temp
            );
            
        stimulus: process
        begin
            RST <= '1';
            wait for 10 ns;
            RST <= '0';
            wait for 10 ns;
            start_temp <= '1';
        wait for 20000 ns;
        
        wait;
    end process;
    
        clocking: process
        begin
            CLK <= '0';
            wait for clock_period / 2;
            CLK <= '1';
            wait for clock_period / 2;
    end process;
end architecture bench;
