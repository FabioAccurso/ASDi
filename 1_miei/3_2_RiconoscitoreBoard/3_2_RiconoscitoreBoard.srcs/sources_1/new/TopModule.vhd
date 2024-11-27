----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2024 11:29:51
-- Design Name: 
-- Module Name: TopModule - Behavioral
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


ENTITY TopModule IS
PORT(
    B1 : IN STD_LOGIC;
    B2 : IN STD_LOGIC;
    S1 : IN STD_LOGIC;
    S2 : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    led : OUT STD_LOGIC
);
END TopModule;

ARCHITECTURE Behavioral OF TopModule IS
    COMPONENT ButtonDebouncer IS
        GENERIC (
            CLK_period: integer := 10;
            btn_noise_time: integer := 10000000
        );
        PORT (
            RST : in STD_LOGIC;
            CLK : in STD_LOGIC;
            BTN : in STD_LOGIC;
            CLEARED_BTN : out STD_LOGIC
        );
    END COMPONENT;

    COMPONENT riconoscitore IS
        PORT (
            i : IN STD_LOGIC;
            BI : IN STD_LOGIC;
            BM : IN STD_LOGIC;
            A : IN STD_LOGIC;
            RST : IN STD_LOGIC;
            M : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL cleared_i : STD_LOGIC;
    SIGNAL cleared_m : STD_LOGIC;

BEGIN
    deb_i : ButtonDebouncer
    PORT MAP (
        RST => '0',
        CLK => CLK,
        BTN => B1,
        CLEARED_BTN => cleared_i
    );

    deb_m : ButtonDebouncer
    PORT MAP (
        RST => '0',
        CLK => CLK,
        BTN => B2,
        CLEARED_BTN => cleared_m
    );

    ric: riconoscitore
    PORT MAP (
        i => S1,
        BI => cleared_i,
        BM => cleared_m,
        M => S2,
        A => CLK,
        RST => '0',
        Y => led
    );
END Behavioral;
