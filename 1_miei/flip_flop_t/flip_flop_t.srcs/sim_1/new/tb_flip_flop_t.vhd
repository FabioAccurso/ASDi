----------------------------------------------------------------------------------
-- Testbench for flip_flop_t
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flip_flop_t_tb IS
END ENTITY flip_flop_t_tb;

ARCHITECTURE behavior OF flip_flop_t_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT flip_flop_t
    PORT(
        clk       : IN  STD_LOGIC;
        rst       : IN  STD_LOGIC;
        en        : IN  STD_LOGIC;
        rst_count : IN  STD_LOGIC;
        load      : IN  STD_LOGIC;
        set       : IN  STD_LOGIC;
        count     : OUT STD_LOGIC
    );
    END COMPONENT;

    -- Signals to connect to the UUT
    SIGNAL clk       : STD_LOGIC := '0';
    SIGNAL rst       : STD_LOGIC := '0';
    SIGNAL en        : STD_LOGIC := '0';
    SIGNAL rst_count : STD_LOGIC := '0';
    SIGNAL load      : STD_LOGIC := '0';
    SIGNAL set       : STD_LOGIC := '0';
    SIGNAL count     : STD_LOGIC;

    -- Clock period definition
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: flip_flop_t PORT MAP (
        clk => clk,
        rst => rst,
        en => en,
        rst_count => rst_count,
        load => load,
        set => set,
        count => count
    );

    -- Clock process definitions
    clk_process :PROCESS
    BEGIN
        WHILE TRUE LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;
            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
    END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Initialize Inputs
        rst <= '0';
        en <= '0';
        rst_count <= '0';
        load <= '0';
        set <= '0';
        WAIT FOR 20 ns;

        -- Apply Reset
        rst <= '1';
        WAIT FOR clk_period;
        rst <= '0';
        WAIT FOR clk_period;

        -- Enable counting
        en <= '1';
        WAIT FOR 5 * clk_period;

        -- Reset counter
        rst_count <= '1';
        WAIT FOR clk_period;
        rst_count <= '0';
        WAIT FOR clk_period;

        -- Load a specific value
        load <= '1';
        set <= '1';
        WAIT FOR clk_period;
        load <= '0';
        set <= '0';
        WAIT FOR clk_period;

        -- Enable toggling
        en <= '1';
        WAIT FOR 10 * clk_period;

        -- End simulation
        WAIT;
    END PROCESS;

END ARCHITECTURE behavior;
