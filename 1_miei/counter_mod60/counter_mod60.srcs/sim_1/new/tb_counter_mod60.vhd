----------------------------------------------------------------------------------
-- Testbench for counter_mod60
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_counter_mod60 IS
-- Testbench has no ports
END tb_counter_mod60;

ARCHITECTURE behavior OF tb_counter_mod60 IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT counter_mod60
        PORT(
            clk     : IN  std_logic;
            rst     : IN  std_logic;
            en      : IN  std_logic;
            load    : IN  std_logic;
            set     : IN  std_logic_vector(0 TO 5);
            count   : OUT std_logic_vector(0 TO 5);
            en_next : OUT std_logic
        );
    END COMPONENT;

    -- Signals for UUT
    SIGNAL clk     : std_logic := '0';
    SIGNAL rst     : std_logic := '0';
    SIGNAL en      : std_logic := '0';
    SIGNAL load    : std_logic := '0';
    SIGNAL set     : std_logic_vector(0 TO 5) := (others => '0');
    SIGNAL count   : std_logic_vector(0 TO 5);
    SIGNAL en_next : std_logic;

    -- Clock period definition
    CONSTANT clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: counter_mod60 PORT MAP (
        clk     => clk,
        rst     => rst,
        en      => en,
        load    => load,
        set     => set,
        count   => count,
        en_next => en_next
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
        -- Reset the counter
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';

        -- Enable the counter and observe counting
        en <= '1';
        WAIT FOR 630 ns; 

        -- Test load functionality
        load <= '1';
        set <= "001100"; -- Load the value 12 (binary: 1100)
        WAIT FOR clk_period;
        load <= '0';

        -- Observe counting from loaded value
        WAIT FOR 200 ns;

        -- Test reset again
        rst <= '1';
        WAIT FOR 20 ns;
        rst <= '0';

        -- Disable the counter
        en <= '0';
        WAIT FOR 100 ns;

        -- End of simulation
        WAIT;
    END PROCESS;

END behavior;
