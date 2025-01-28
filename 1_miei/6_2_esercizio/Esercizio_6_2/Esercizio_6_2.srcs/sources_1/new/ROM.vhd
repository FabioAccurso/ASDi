library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
    
    generic (bits : integer := 4);
    port(
        clk : in std_logic;
        address : in std_logic_vector(bits-1 downto 0);  
        read : in std_logic;                              
        data : out std_logic_vector(7 downto 0) 
    );
    
end ROM;

architecture behavioral of ROM is 
type MEMORY_N_8 is array (0 to (2**bits)-1) of std_logic_vector(7 downto 0);
constant ROM_N_8 : MEMORY_N_8 := (

"00000000", "00000001", "00000010", "00000011", 
"00000100", "00000101", "00000110", "00000111",
"00001000", "00001001", "00001010", "00001011", 
"00001100", "00001101", "00001110", "00001111");
                                          
begin


rom_process: process(clk)
begin
    
     if(rising_edge(clk)) then	  
	   if read = '1' then
		  data <= ROM_N_8(to_integer(unsigned(address)));
	   end if;
	 end if;
end process;

end behavioral;
