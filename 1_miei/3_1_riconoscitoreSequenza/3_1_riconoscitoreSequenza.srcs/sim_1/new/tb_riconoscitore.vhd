library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_riconoscitore is
    -- Testbench non ha porte
end tb_riconoscitore;

architecture Behavioral of tb_riconoscitore is
    -- Component declaration
    component riconoscitore
        port(
            i   : in std_logic;
            clk : in std_logic;
            rst : in std_logic;
            m   : in std_logic;
            y   : out std_logic
        );
    end component;

    -- Signals for testing
    signal i   : std_logic := '0';
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal m   : std_logic := '0';
    signal y   : std_logic;

    -- Clock period constant
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: riconoscitore
        port map (
            i   => i,
            clk => clk,
            rst => rst,
            m   => m,
            y   => y
        );

    -- Clock generation
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        wait for 100 ns;
        
        
        RST <= '1';
        wait for CLK_period;
        RST <= '0';
        
        -- Test case 1: No overlap mode (M = '0')
        --wait for CLK_period;
        i <= '1'; wait for CLK_period;  
        i <= '1'; wait for CLK_period;
        i <= '0'; wait for CLK_period; 
        i <= '1'; wait for CLK_period;  
        i <= '0'; wait for CLK_period;
        i <= '1'; wait for CLK_period;  
        i <= '0'; wait for CLK_period;  


        -- Reset
        RST <= '1';
        wait for CLK_period;
        RST <= '0';
        --wait for CLK_period;
        
        M <= '1';
        --wait for CLK_period;
        i <= '1'; wait for CLK_period;  
        i <= '1'; wait for CLK_period;
        i <= '0'; wait for CLK_period; 
        i <= '1'; wait for CLK_period;  
        i <= '0'; wait for CLK_period;
        i <= '1'; wait for CLK_period;  
        i <= '0'; wait for CLK_period;

       
        
        wait;
    end process;

end Behavioral;
