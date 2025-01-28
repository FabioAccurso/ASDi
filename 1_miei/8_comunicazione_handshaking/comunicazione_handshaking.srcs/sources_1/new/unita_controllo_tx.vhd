----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2025 16:56:02
-- Design Name: 
-- Module Name: unita_controllo_tx - Behavioral
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

ENTITY unita_controllo_tx IS
    GENERIC (
        N : INTEGER := 4
    );
    
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        start_send : IN STD_LOGIC;
        ack : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        req : OUT STD_LOGIC;
        en_read_mem : OUT STD_LOGIC;
        en_counter : OUT STD_LOGIC
    );
END unita_controllo_tx;

ARCHITECTURE behavioral OF unita_controllo_tx IS
    TYPE stato IS (IDLE, DATA_LOADED, WAITING_ACK, WAITING_DONE, INCR_COUNT);
    SIGNAL stato_attuale : stato := IDLE;
    SIGNAL stato_prossimo : stato;
    
BEGIN
    f_stato_uscita : PROCESS (stato_attuale, start_send, address, ack)
    BEGIN
        CASE stato_attuale IS
            WHEN IDLE =>
                req <= '0';
                en_read_mem <= '0';
                en_counter <= '0';               
                IF (start_send = '0') THEN
                    stato_prossimo <= IDLE;
                ELSE
                    stato_prossimo <= DATA_LOADED;
                END IF;
                
            WHEN DATA_LOADED =>
                en_read_mem <= '1';
                en_counter <='0';
                stato_prossimo <= WAITING_ACK;
                
            WHEN WAITING_ACK =>
                en_read_mem <= '0';
                req <= '1';
                IF (ack = '1') THEN
                    stato_prossimo <= WAITING_DONE;
                ELSE
                    stato_prossimo <= WAITING_ACK;
                END IF;
                
            WHEN WAITING_DONE =>
                req <= '0';
                IF (ack = '1') THEN
                    IF (address = "1111") THEN
                        stato_prossimo <= IDLE;
                    ELSE
                        stato_prossimo <= INCR_COUNT;
                    END IF;
                ELSE
                    stato_prossimo <= WAITING_DONE;
                END IF;
                
            WHEN INCR_COUNT =>
                en_counter <= '1';
                stato_prossimo <= IDLE;
        END CASE;
    END PROCESS;

    memoria : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF (rst = '1') THEN
                stato_attuale <= IDLE;
            ELSE
                stato_attuale <= stato_prossimo;
            END IF;
        END IF;
    END PROCESS;
END behavioral;
