----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2024 10:17:27
-- Design Name: 
-- Module Name: riconoscitore - Behavioral
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

entity riconoscitore IS
    PORT (
        i : IN STD_LOGIC;
        A : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        M : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END riconoscitore;

ARCHITECTURE behavioral OF riconoscitore IS
TYPE stato IS (S0, S1, S2, S3, S4);

SIGNAL stato_attuale : stato := S0;
SIGNAL stato_prossimo : stato;
SIGNAL Y_temp : STD_LOGIC;

BEGIN
    f_stato_uscita : PROCESS (i, stato_attuale, M)
        BEGIN
            CASE M IS
                WHEN '0' =>
                    CASE stato_attuale IS
                        WHEN S0 =>
                            IF (i = '0') THEN
                                stato_prossimo <= S1;
                                Y_temp <= '0';
                            ELSE
                                stato_prossimo <= S3;
                                Y_temp <= '0';
                            END IF;
                        WHEN S1 =>
                            stato_prossimo <= S2;
                            Y_temp <= '0';
        
                        WHEN S2 =>
                            stato_prossimo <= S0;
                            Y_temp <= '0';
                    
                        WHEN S3 =>
                            IF (i = '0') THEN
                                stato_prossimo <= S4;
                                Y_temp <= '0';
                            ELSE
                                stato_prossimo <= S2;
                                Y_temp <= '0';
                            END IF;
                    
                        WHEN S4 =>
                            stato_prossimo <= S0;
                            Y_temp <= i;
                    
                        WHEN OTHERS =>
                            Y_temp <= '0';
                    END CASE;
                    
                WHEN '1' =>
                    CASE stato_attuale IS
                        WHEN S0 =>
                            IF (i = '0') THEN
                                stato_prossimo <= S0;
                                Y_temp <= '0';
                            ELSE
                                stato_prossimo <= S1;
                                Y_temp <= '0';
                            END IF;
                
                        WHEN S1 =>
                            IF (i = '0') THEN
                                stato_prossimo <= S2;
                                Y_temp <= '0';
                            ELSE
                                stato_prossimo <= S1;
                                Y_temp <= '0';
                            END IF;
                
                        WHEN S2 =>
                            stato_prossimo <= S0;
                            Y_temp <= i;
                
                        WHEN OTHERS =>
                            Y_temp <= '0';
                    END CASE;
                    
                WHEN OTHERS =>
                    Y_temp <= '0';
                END CASE;
        END PROCESS;

    memoria_stato : PROCESS (A)
    BEGIN
        IF (rising_edge(A)) THEN
            IF (RST = '1') THEN
                stato_attuale <= S0;
                Y <= '0';
            ELSE
                stato_attuale <= stato_prossimo;
                Y <= Y_temp;
            END IF;
        END IF;
    END PROCESS;

END behavioral;

                          
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                