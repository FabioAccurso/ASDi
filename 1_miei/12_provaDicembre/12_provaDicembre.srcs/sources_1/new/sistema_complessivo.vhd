----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.01.2025
-- Design Name: 
-- Module Name: sistema_complessivo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Sistema complessivo che include i componenti sistema_a e sistema_b
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

entity sistema_complessivo is
    Port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        start : in STD_LOGIC;
        output_finale : out STD_LOGIC_VECTOR(3 downto 0)
    );
end sistema_complessivo;

architecture Structural of sistema_complessivo is

    component sistema_a
        Port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            start : in STD_LOGIC;
            ack_b : in STD_LOGIC;
            req_b : out STD_LOGIC;
            dato : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component sistema_b
        Port (
            CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            req_b : in STD_LOGIC;
            ack_b : out STD_LOGIC;
            output_finale : out STD_LOGIC_VECTOR(3 downto 0);
            dato : in STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- segnali interni per l'interconnessione tra sistema_a e sistema_b
    signal req_b_signal : STD_LOGIC;
    signal ack_b_signal : STD_LOGIC;
    signal dato_signal : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Istanza del sistema_a
    inst_sistema_a : sistema_a
        port map (
            CLK => CLK,
            RST => RST,
            start => start,
            ack_b => ack_b_signal,
            req_b => req_b_signal,
            dato => dato_signal
        );

    -- Istanza del sistema_b
    inst_sistema_b : sistema_b
        port map (
            CLK => CLK,
            RST => RST,
            req_b => req_b_signal,
            ack_b => ack_b_signal,
            output_finale => output_finale,
            dato => dato_signal
        );

end Structural;