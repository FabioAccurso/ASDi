-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.10.2024 09:35:48 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_mux16_1 is
end tb_mux16_1;

architecture tb of tb_mux16_1 is

    component mux16_1
        port (c0  : in std_logic;
              c1  : in std_logic;
              c2  : in std_logic;
              c3  : in std_logic;
              c4  : in std_logic;
              c5  : in std_logic;
              c6  : in std_logic;
              c7  : in std_logic;
              c8  : in std_logic;
              c9  : in std_logic;
              c10 : in std_logic;
              c11 : in std_logic;
              c12 : in std_logic;
              c13 : in std_logic;
              c14 : in std_logic;
              c15 : in std_logic;
              se0 : in std_logic;
              se1 : in std_logic;
              se2 : in std_logic;
              se3 : in std_logic;
              y   : out std_logic);
    end component;

    signal c0  : std_logic;
    signal c1  : std_logic;
    signal c2  : std_logic;
    signal c3  : std_logic;
    signal c4  : std_logic;
    signal c5  : std_logic;
    signal c6  : std_logic;
    signal c7  : std_logic;
    signal c8  : std_logic;
    signal c9  : std_logic;
    signal c10 : std_logic;
    signal c11 : std_logic;
    signal c12 : std_logic;
    signal c13 : std_logic;
    signal c14 : std_logic;
    signal c15 : std_logic;
    signal se0 : std_logic;
    signal se1 : std_logic;
    signal se2 : std_logic;
    signal se3 : std_logic;
    signal y   : std_logic;

begin

    uut : mux16_1
        port map (c0  => c0,
                  c1  => c1,
                  c2  => c2,
                  c3  => c3,
                  c4  => c4,
                  c5  => c5,
                  c6  => c6,
                  c7  => c7,
                  c8  => c8,
                  c9  => c9,
                  c10 => c10,
                  c11 => c11,
                  c12 => c12,
                  c13 => c13,
                  c14 => c14,
                  c15 => c15,
                  se0 => se0,
                  se1 => se1,
                  se2 => se2,
                  se3 => se3,
                  y   => y);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        c0 <= '0';
        c1 <= '0';
        c2 <= '0';
        c3 <= '0';
        c4 <= '0';
        c5 <= '0';
        c6 <= '0';
        c7 <= '0';
        c8 <= '0';
        c9 <= '0';
        c10 <= '0';
        c11 <= '0';
        c12 <= '0';
        c13 <= '0';
        c14 <= '0';
        c15 <= '0';
        se0 <= '0';
        se1 <= '0';
        se2 <= '0';
        se3 <= '0';
        
        wait for 100 ns;

        c0 <= '1';
        c1 <= '0';
        c2 <= '0';
        c3 <= '0';
        c4 <= '0';
        c5 <= '0';
        c6 <= '0';
        c7 <= '0';
        c8 <= '0';
        c9 <= '0';
        c10 <= '0';
        c11 <= '0';
        c12 <= '0';
        c13 <= '0';
        c14 <= '0';
        c15 <= '0';
        se0 <= '0';
        se1 <= '0';
        se2 <= '0';
        se3 <= '0';
        
        wait for 100 ns;
        
        c0 <= '1';
        c1 <= '0';
        c2 <= '0';
        c3 <= '0';
        c4 <= '0';
        c5 <= '0';
        c6 <= '0';
        c7 <= '0';
        c8 <= '0';
        c9 <= '0';
        c10 <= '0';
        c11 <= '0';
        c12 <= '0';
        c13 <= '0';
        c14 <= '0';
        c15 <= '0';
        se0 <= '1';
        se1 <= '0';
        se2 <= '0';
        se3 <= '0';
        
        wait for 100 ns;
        
        c0 <= '0';
        c1 <= '1';
        c2 <= '0';
        c3 <= '0';
        c4 <= '0';
        c5 <= '0';
        c6 <= '0';
        c7 <= '0';
        c8 <= '0';
        c9 <= '0';
        c10 <= '0';
        c11 <= '0';
        c12 <= '0';
        c13 <= '0';
        c14 <= '0';
        c15 <= '0';
        se0 <= '1';
        se1 <= '0';
        se2 <= '0';
        se3 <= '0';
        
        wait for 100 ns;
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mux16_1 of tb_mux16_1 is
    for tb
    end for;
end cfg_tb_mux16_1;