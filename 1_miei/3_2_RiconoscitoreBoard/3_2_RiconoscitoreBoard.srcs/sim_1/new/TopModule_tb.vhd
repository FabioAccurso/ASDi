----------------------------------------------------------------------------------
-- Testbench for TopModule
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TopModule_tb IS
END TopModule_tb;

ARCHITECTURE Behavioral OF TopModule_tb IS

    -- Component Declaration
    COMPONENT TopModule IS
        PORT(
            B1 : IN STD_LOGIC;
            B2 : IN STD_LOGIC;
            S1 : IN STD_LOGIC;
            S2 : IN STD_LOGIC;
            CLK : IN STD_LOGIC;
            led : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signals for simulation
    SIGNAL B1 : STD_LOGIC := '0';
    SIGNAL B2 : STD_LOGIC := '0';
    SIGNAL S1 : STD_LOGIC := '0';
    SIGNAL S2 : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL led : STD_LOGIC;

    CONSTANT CLK_PERIOD : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: TopModule
    PORT MAP (
        B1 => B1,
        B2 => B2,
        S1 => S1,
        S2 => S2,
        CLK => CLK,
        led => led
    );

    -- Clock generation process
    clk_process : PROCESS
    BEGIN
        WHILE TRUE LOOP
            CLK <= '0';
            WAIT FOR CLK_PERIOD / 2;
            CLK <= '1';
            WAIT FOR CLK_PERIOD / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Stimulus process
    stimulus_process : PROCESS
    BEGIN
        -- Initialize inputs
        B1 <= '0';
        B2 <= '0';
        S1 <= '0';
        S2 <= '0';
        WAIT FOR 100 ns;

        -- Apply test vectors Mode 0
        S2 <= '0';
        B2 <= '1';
        WAIT FOR 50 ns;
        B2 <= '0';
        WAIT FOR 50 ns;
        
        --1
        S1 <= '1';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

        --0
        S1 <= '0';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

        --1
        S1 <= '1';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

        
        -- Cambia mod mode=1
        S2 <= '1';
        B2 <= '1';
        WAIT FOR 50 ns;
        B2 <= '0';
        WAIT FOR 50 ns;

        --1
        S1 <= '1';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

        --0
        S1 <= '0';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

        --1
        S1 <= '1';
        B1 <= '1';
        WAIT FOR 50 ns;
        B1 <= '0';
        WAIT FOR 50 ns;

       

        -- End simulation
        WAIT;
    END PROCESS;

END Behavioral;
