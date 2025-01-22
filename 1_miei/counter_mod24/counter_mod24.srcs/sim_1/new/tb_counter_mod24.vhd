LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_counter_mod24 IS
END tb_counter_mod24;

ARCHITECTURE behavior OF tb_counter_mod24 IS

    -- Component declaration for the Unit Under Test (UUT)
    COMPONENT counter_mod24
        PORT (
            clk   : IN  STD_LOGIC;
            rst   : IN  STD_LOGIC;
            en    : IN  STD_LOGIC;
            load  : IN  STD_LOGIC;
            set   : IN  STD_LOGIC_VECTOR(0 TO 4);
            count : OUT STD_LOGIC_VECTOR(0 TO 4)
        );
    END COMPONENT;

    -- Signals to connect to UUT
    SIGNAL clk   : STD_LOGIC := '0';
    SIGNAL rst   : STD_LOGIC := '0';
    SIGNAL en    : STD_LOGIC := '0';
    SIGNAL load  : STD_LOGIC := '0';
    SIGNAL set   : STD_LOGIC_VECTOR(0 TO 4) := (OTHERS => '0');
    SIGNAL count : STD_LOGIC_VECTOR(0 TO 4);

    -- Clock period definition
    CONSTANT clk_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: counter_mod24 PORT MAP (
        clk   => clk,
        rst   => rst,
        en    => en,
        load  => load,
        set   => set,
        count => count
    );

    -- Clock generation
    clk_process : PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR clk_period/2;
        clk <= '1';
        WAIT FOR clk_period/2;
    END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Initialize inputs
        rst <= '1';
        en  <= '0';
        load <= '0';
        set <= "00000";
        WAIT FOR 20 ns;

        -- Release reset
        rst <= '0';
        WAIT FOR 20 ns;

        -- Enable counting
        en <= '1';
        WAIT FOR 270 ns; -- Count to 24

        -- Test load functionality
        en <= '0';
        load <= '1';
        set <= "10010"; -- Load value 18 (binary 10010)
        WAIT FOR 20 ns;

        load <= '0';
        en <= '1';
        WAIT FOR 120 ns; -- Count from 18 to 23, then wrap to 0

        -- Reset and test again
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';
        WAIT FOR 20 ns;

        -- Disable counting
        en <= '0';
        WAIT FOR 40 ns;

        -- End simulation
        WAIT;
    END PROCESS;

END behavior;
