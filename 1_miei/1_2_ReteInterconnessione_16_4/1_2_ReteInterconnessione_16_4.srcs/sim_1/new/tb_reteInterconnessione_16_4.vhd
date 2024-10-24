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
        -- Test case 1
        d <= "0000000000000001";  -- d(0) is '1', others are '0'
        sel <= "000000";          -- Selects y0
        wait for 100 ns;
        
        -- Test case 2
        d <= "0000000000000010";  -- d(1) is '1'
        sel <= "000001";          -- Selects y1
        wait for 100 ns;
        
        -- Test case 3
        d <= "0000000000000100";  -- d(2) is '1'
        sel <= "000010";          -- Selects y2
        wait for 100 ns;
        
        -- Test case 4
        d <= "1000000000000000";  -- d(15) is '1'
        sel <= "111111";          -- Selects y3
        wait for 100 ns;
        
        -- Add more test cases as needed
        
        wait;
    end process;

end behavior;
