----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.01.2025
-- Design Name: 
-- Module Name: tb_sistema_complessivo - Testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench per il sistema_complessivo
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_sistema_complessivo is
-- Testbench non ha porte
end tb_sistema_complessivo;

architecture Behavioral of tb_sistema_complessivo is

    -- Componenti da testare
    component sistema_complessivo
        Port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            start : in STD_LOGIC;
            output_finale : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Segnali interni
    signal CLK : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal start : STD_LOGIC := '0';
    signal output_finale : STD_LOGIC_VECTOR(3 downto 0);

    -- Parametri temporali
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instanzia il sistema_complessivo
    uut : sistema_complessivo
        port map (
            CLK => CLK,
            RST => RST,
            start => start,
            output_finale => output_finale
        );

    -- Processo per generare il clock
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Processo di test
    test_process : process
    begin
        -- Reset iniziale
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 20 ns;

        -- Avvia il sistema
        start <= '1';
        wait for 10 ns;
        start <= '0';

        -- Attendere completamento operazioni
        wait for 200 ns;

        -- Controlla il risultato finale
--        assert output_finale = "XXXX" -- Sostituire "XXXX" con il valore atteso
--        report "Test fallito: risultato inatteso" severity error;

        -- Fine del test
        wait;
    end process;

end Behavioral;
