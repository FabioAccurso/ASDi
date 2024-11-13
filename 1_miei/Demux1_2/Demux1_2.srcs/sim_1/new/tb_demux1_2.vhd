-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.10.2024 10:13:49 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_demux1_2 is
end tb_demux1_2;

architecture tb of tb_demux1_2 is

    component demux1_2
        port (a  : in std_logic;
              s  : in std_logic;
              y0 : out std_logic;
              y1 : out std_logic);
    end component;

    signal a  : std_logic;
    signal s  : std_logic;
    signal y0 : std_logic;
    signal y1 : std_logic;

begin

    dut : demux1_2
    port map (a  => a,
              s  => s,
              y0 => y0,
              y1 => y1);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= '0';
        s <= '0';
        wait for 100 ns;
    
        a <= '0';
        s <= '1';
        wait for 100 ns;
        
        a <= '1';
        s <= '1';
        wait for 100 ns;
        
        a <= '1';
        s <= '0';
        wait for 100 ns;

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_demux1_2 of tb_demux1_2 is
    for tb
    end for;
end cfg_tb_demux1_2;