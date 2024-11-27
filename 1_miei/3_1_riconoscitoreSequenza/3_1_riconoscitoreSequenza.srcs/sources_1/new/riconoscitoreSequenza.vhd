----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2024 19:05:42
-- Design Name: 
-- Module Name: riconoscitoreSequenza - Behavioral
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

entity riconoscitore is port(
    i  : in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    m  : in std_logic;
    y  : out std_logic
);

end riconoscitore;

architecture Behavioral of riconoscitore is
    type stato is (s0, s1, s2, s3, s4);
    signal statoCorrente : stato := s0;
    signal statoProssimo : stato;

begin
    stato_uscita: process(clk)
    begin
        if rising_edge(clk) then
            if (rst='1') then
                statoCorrente <= s0;
                y <= '0';
            else
                if (m='0') then
                    case statoCorrente is
                        when s0 => 
                            if(i='0') then
                                statoCorrente <= s1;
                                y <= '0';
                            else
                                statoCorrente <= s2;
                                y <= '0';
                            end if;

                        when s1 => 
                            statoCorrente <= s3;
                            y <= '0';

                        when s2 => 
                            if(i='0') then
                                statoCorrente <= s4;
                                y <= '0';
                            else
                                statoCorrente <= s3;
                                y <= '0';
                            end if;

                        when s3 => 
                            statoCorrente <= s0;
                            y <= '0';
                        when s4 => 
                            if(i='0') then
                                statoCorrente <= s0;
                                y <= '0';
                            else
                                statoCorrente <= s0;
                                y <= '1';
                            end if;
                        when others => 
                            statoCorrente <= s0;
                            y <= '0';
                    end case;
                else
                    case statoCorrente is
                        when s0 => if(i='0') then
                            y <= '0';
                        else
                            statoCorrente <= s1;
                            y <= '0';
                        end if;

                        when s1 => if(i='0') then
                            statoCorrente <= s2;
                            y <= '0';
                        else
                            y <= '0';
                        end if;

                        when s2 => if(i='0') then
                            statoCorrente <= s0;
                            y <= '0';
                        else
                            statoCorrente <= s0;
                            y <= '1';
                        end if;

                        when others => statoCorrente <= s0;
                            y <= '0';
                    end case;
                end if;
            end if;
        end if;
    end process;
end Behavioral;

