library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
    port(
        address : in  std_logic_vector(2 downto 0);
        dout    : out std_logic_vector(3 downto 0)
    );
end entity ROM;

architecture RTL of ROM is
    type MEMORY_8_4 is array (0 to 7) of std_logic_vector(3 downto 0);     
    constant ROM_8_4 : MEMORY_8_4 :=(        
        "0000",         
        "0001",
        "0010",
        "0011",
        "0100",
        "0101",
        "0110",
        "0111"
    );
begin
    main : process(address)
    begin
        dout <= ROM_8_4(to_integer(unsigned(address)));
    end process main;

end architecture RTL;