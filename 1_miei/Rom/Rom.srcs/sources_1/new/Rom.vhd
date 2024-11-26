----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2024 23:10:11
-- Design Name: 
-- Module Name: Rom - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rom is
    generic (N:natural range 1 to 32 :=3);  --Parametro N che definisce il numero di posizioni della memoria ROM. Di default inizializzato a 3

    Port ( clock : in STD_LOGIC;
           read : in STD_LOGIC;
           address : in std_logic_vector(N-1 downto 0); -- indirizzo formato da N bit viste le N posizioni
           uscita : out std_logic_vector(7 downto 0)  -- 8 bit di uscita
           );
end Rom;

architecture Behavioral of Rom is

-- definisco memoria Nx8, ovvero N posizioni ciascuna di 8 bit
type MEMORIA_N_8 is array (0 to 2**N-1) of std_logic_vector(7 downto 0);

constant MEM_N_8 : MEMORIA_N_8 :=(  -- definisco una costante MEM_N_8 del tipo definito sopra con i seguenti valori di default (num binario da 0 a 15)
         "0000",
         "0001",
         "0010",
         "0011",
         "0100",
         "0101",
         "0110",
         "0111",
         "1000",
         "1001",
         "1010",
         "1011",
         "1100",
         "1101",
         "1110",
         "1111"
);

signal memory : MEMORIA_N_8 := MEM_N_8;     -- creo un segnale della tipologia MEMORIA_N_8 e lo inizializzo alla costante MEM_N_8


begin

    main : process(clock)
    begin
        if (rising_edge(clock)) then
            if(read='1') then
                uscita <= memory(TO_INTEGER(unsigned(address)));
            end if;
        end if;     
    end process main;

end Behavioral;
