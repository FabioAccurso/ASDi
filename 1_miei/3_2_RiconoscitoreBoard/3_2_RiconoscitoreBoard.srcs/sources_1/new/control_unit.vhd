library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        clock       : in std_logic;
        caricaInput : in STD_LOGIC;
        caricaModo  : in STD_LOGIC;
        input_a       : in std_logic;
        modo        : in std_logic;
        uscitaInput : out std_logic;
        uscitaModo  : out std_logic
    );
end control_unit;

architecture Behavioral of control_unit is
begin
    main: process(clock)
    begin
        if clock'event and clock = '1' then
            if caricaInput = '1' then
                uscitaInput <= input_a;
            end if;
            if caricaModo = '1' then
                uscitaModo <= modo;
            end if;
        end if;
    end process;
end Behavioral;
