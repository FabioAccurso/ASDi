library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reteInterconnessione_16_4 is
end tb_reteInterconnessione_16_4;

architecture behavior of tb_reteInterconnessione_16_4 is
    component reteInterconnessione_16_4
        Port (
            d : in std_logic_vector(15 downto 0);
            sel : in std_logic_vector(5 downto 0);
            y : out std_logic_vector(3 downto 0)
        );
    end component;

    signal d : std_logic_vector(15 downto 0);
    signal sel : std_logic_vector(5 downto 0);
    signal y : std_logic_vector(3 downto 0);

begin
    uut: reteInterconnessione_16_4
        port map (
            d => d,
            sel => sel,
            y => y
        );

    stim_proc: process
    begin
         -- [!] dei 6 bit di selezione: i 2 bit piu' significativi selezionano uscita, i 4 meno significativi l'ingresso
         
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000000";          -- Selects y0
        wait for 100 ns;
        
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "010000";          -- Selects y1
        wait for 100 ns;
        
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "100000";          -- Selects y2
        wait for 100 ns;


        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "110000";          -- Selects y3
        wait for 100 ns;

        d <= "0000000100000000";  -- d(8) is '1', others are '0'
        sel <= "101000";          -- Selects y2
        wait for 100 ns;
        
        d <= "0000000000000000";  -- test finale in modo da fare correttamente screen
        sel <= "000000";
        wait for 100 ns;
        wait;
    end process;

end behavior;



 
--        d <= "1111111111111111";  
--        sel <= "000000";   
--        wait for 100 ns;
--        sel <= "100100";      
--        wait for 100 ns;
--        sel <= "010100";  
   
--        d <= "0101010101010101"; --opposto di cinzia -> funziona!
----        d <= "1010101010101010";  
--        sel <= "000000"; 
--        wait for 100 ns;
--        sel <= "010000"; 
--        wait for 100 ns;
--        sel <= "100000"; 
--        wait for 100 ns;
--        sel <= "110000"; 
--        wait for 100 ns;
--        sel <= "000001"; 
--        wait for 100 ns;
        

