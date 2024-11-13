----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2024 15:49:41
-- Design Name: 
-- Module Name: shift_register_4bit - Behavioral
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

entity shift_register_4bit is
    Port ( datoIN : in STD_LOGIC;
           clock : in STD_LOGIC;
           datoOUT : out STD_LOGIC);
end shift_register_4bit;

architecture Behavioral of shift_register_4bit is
    signal tmp : std_logic_vector (3 downto 0);
begin

PROCESS(clock) --Questa è la sensitivity list -> si attiva ad ogni variazione del clock (tutti e due fronti)
BEGIN
    --Voglio controllare di essere sul fronte di salita
    IF(rising_edge(clock)) then
        --avrei dovuto per completezza anche implementare un controllo sul segnale di reset.
        --sto facendo lo shift a sinistra ma potrei farlo anche al contrario.
        tmp(0)<=datoIN;
        tmp(1)<=tmp(0);
        tmp(2)<=tmp(1);
        tmp(3)<=tmp(2);
       -- datoOUT<=tmp(3); --inserendo qua questo, verra modificato al prossimo clock l'uscita. Farla qui sarebbe sbagliata anche dal punto di vista architetturale.
    END IF;
END PROCESS;
datoOUT<=tmp(3); --inserendolo qui invece viene modificato in maniera concorrente, non devo quindi attendere un ulteriore colpo di clock.
end Behavioral;
