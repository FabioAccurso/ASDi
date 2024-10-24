-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.10.2024 10:32:30 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_demux_1_4 is
end tb_demux_1_4;

architecture tb of tb_demux_1_4 is

    component demux_1_4
        port (b  : in std_logic;
              f0 : in std_logic;
              f1 : in std_logic;
              y0 : out std_logic;
              y1 : out std_logic;
              y2 : out std_logic;
              y3 : out std_logic);
    end component;

    signal b  : std_logic;
    signal f0 : std_logic;
    signal f1 : std_logic;
    signal y0 : std_logic;
    signal y1 : std_logic;
    signal y2 : std_logic;
    signal y3 : std_logic;

begin

    dut : demux_1_4
    port map (b  => b,
              f0 => f0,
              f1 => f1,
              y0 => y0,
              y1 => y1,
              y2 => y2,
              y3 => y3);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        b <= '0';
        f0 <= '0';
        f1 <= '0';
        wait for 100 ns;

        b <= '0';
        f0 <= '1';
        f1 <= '0';
        wait for 100 ns;
        
        b <= '0';
        f0 <= '0';
        f1 <= '1';
        wait for 100 ns;
        
        b <= '0';
        f0 <= '1';
        f1 <= '1';
        wait for 100 ns;
        
        b <= '1';
        f0 <= '0';
        f1 <= '0';
        wait for 100 ns;
        
        b <= '1';
        f0 <= '1';
        f1 <= '0';
        wait for 100 ns;
        
        b <= '1';
        f0 <= '0';
        f1 <= '1';
        wait for 100 ns;
        
        b <= '1';
        f0 <= '1';
        f1 <= '1';
        wait for 100 ns;
        
        
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_demux_1_4 of tb_demux_1_4 is
    for tb
    end for;
end cfg_tb_demux_1_4;