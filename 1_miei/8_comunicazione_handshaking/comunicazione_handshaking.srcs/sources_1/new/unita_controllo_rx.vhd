----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2025 17:04:24
-- Design Name: 
-- Module Name: unita_controllo_rx - Behavioral
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

ENTITY unita_controllo_rx IS
    GENERIC (
        N : INTEGER := 4
    );
    
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        req : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        ack : OUT STD_LOGIC;
        en_read_in : OUT STD_LOGIC;
        en_read_mem : OUT STD_LOGIC;
        en_write_mem : OUT STD_LOGIC;
        en_counter : OUT STD_LOGIC
    );
END unita_controllo_rx;

ARCHITECTURE behavioral OF unita_controllo_rx IS
    TYPE stato IS (IDLE, READ_IN_AND_MEM, WRITE_MEM, WAIT_END, INCR_COUNT);
    SIGNAL stato_attuale : stato := IDLE;
    SIGNAL stato_prossimo : stato;

BEGIN
    memoria : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF (rst = '1') THEN
                stato_attuale <= IDLE;
            ELSE
                stato_attuale <= stato_prossimo;
            END IF;
        END IF;
    END PROCESS memoria;
    
    f_stato_uscita : PROCESS (stato_attuale, req, address)
    BEGIN
        CASE stato_attuale IS
            WHEN IDLE =>
                ack <= '0';
                en_read_in <= '0';
                en_read_mem <= '0';
                en_write_mem <= '0';
                en_counter <= '0';
                IF (req = '1') THEN
                    stato_prossimo <= READ_IN_AND_MEM;
                ELSE
                    stato_prossimo <= IDLE;
                END IF;
            
            WHEN READ_IN_AND_MEM =>
                en_read_in <= '1';
                en_read_mem <= '1';
                stato_prossimo <= WRITE_MEM;
            
            WHEN WRITE_MEM =>
                ack <= '1';
                en_read_in <= '0';
                en_read_mem <= '0';
                en_write_mem <= '1';
                stato_prossimo <= WAIT_END;
            
            WHEN WAIT_END =>
                en_write_mem <= '0';
                if (req = '0') then
                    if (address = "1111") then
                        stato_prossimo <= IDLE;
                    else
                        stato_prossimo <= INCR_COUNT;
                    end if;
                else
                    stato_prossimo <= WAIT_END;
                end if;
                
            WHEN INCR_COUNT =>
                en_counter <= '1';
                stato_prossimo <= IDLE;
        END CASE;
    END PROCESS;
END behavioral;
