library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reteInterconnessione_16_4 is
    -- No ports in the testbench entity
end tb_reteInterconnessione_16_4;

architecture behavior of tb_reteInterconnessione_16_4 is

    -- Component declaration for the unit under test (UUT)
    component reteInterconnessione_16_4
        Port (
            d : in std_logic_vector(15 downto 0);
            sel : in std_logic_vector(5 downto 0);
            y : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal d : std_logic_vector(15 downto 0);
    signal sel : std_logic_vector(5 downto 0);
    signal y : std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: reteInterconnessione_16_4
        port map (
            d => d,
            sel => sel,
            y => y
        );

    -- Stimulus process
    stim_proc: process
    begin
        
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000000";          -- Selects y0
        wait for 100 ns;
        
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000001";          -- Selects y1
        wait for 100 ns;
        
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000010";          -- Selects y2
        wait for 100 ns;


        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000011";          -- Selects y3
        wait for 100 ns;


        d <= "0000000000010000";  -- d(4) is '1', others are '0'
        sel <= "010010";          -- Selects y2
        wait for 100 ns;

        d <= "1111111111111111";  -- d(4) is '1', others are '0'
        sel <= "000000";          -- Selects y2
        wait for 100 ns;
        sel <= "100100";          -- Selects y2
        wait for 100 ns;
        sel <= "100000";          -- Selects y2
        wait for 100 ns;
        sel <= "110000";          -- Selects y2
        wait for 100 ns;
        sel <= "000001";          -- Selects y2
        wait for 100 ns;
        
        
        wait;
    end process;

end behavior;
