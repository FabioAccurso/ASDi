LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY riconoscitore_tb IS
END riconoscitore_tb;

ARCHITECTURE behavior OF riconoscitore_tb IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT riconoscitore
    PORT(
        i : IN STD_LOGIC;
        A : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        M : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
    END COMPONENT;

    -- Inputs
    SIGNAL i : STD_LOGIC := '0';
    SIGNAL A : STD_LOGIC := '0';
    SIGNAL RST : STD_LOGIC := '0';
    SIGNAL M : STD_LOGIC := '0';

    -- Outputs
    SIGNAL Y : STD_LOGIC;

    -- Clock period definitions
    CONSTANT clk_period : TIME := 10 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: riconoscitore PORT MAP (
        i => i,
        A => A,
        RST => RST,
        M => M,
        Y => Y
    );

    -- Clock generation process
    clk_process :process
    begin
        A <= '0';
        wait for clk_period/2;
        A <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin		
        -- Reset the system
        RST <= '1';
        wait for clk_period;
        RST <= '0';

        -- Test scenario 1: M = '0', transitions between states
        M <= '0';
        i <= '1'; -- Transition from S0 -> S3
        wait for clk_period;
        i <= '0'; -- Transition S3 -> S4
        wait for clk_period;
        i <= '1'; -- Transition from S4 -> S0 -> Y=1
        wait for clk_period;
        i <= '0'; -- Transition S0 -> S1
        wait for clk_period;
        i <= '1'; -- Transition S1 -> S2
        wait for clk_period;
        i <= '0'; -- Transition S2 -> S0 -> Y=0
        wait for clk_period;   
          
        
        -- Test scenario 2: M = '1', transitions between states
        M <= '1';
        i <= '0'; -- Transition S0 -> S0
        wait for clk_period;
        i <= '1'; -- Transition S0 -> S1
        wait for clk_period;
        i <= '1'; -- Transition S1 -> S1
        wait for clk_period;
        i <= '0'; -- Transition S1 -> S2
        wait for clk_period;
        i <= '1'; -- Transition S2 -> S0
        wait for clk_period;


--        -- Test scenario 3: Reset during operation
--        RST <= '1'; -- Assert reset
--        wait for clk_period;
--        RST <= '0'; -- Deassert reset
--        wait for clk_period;



        -- Stop simulation
        wait;
    end process;

END behavior;
