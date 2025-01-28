library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity M is

    Port (
        data_in : in std_logic_vector(7 downto 0);                              
        data_out : out std_logic_vector(3 downto 0) 
     );

end M;

architecture Behavioral of M is
                                             
begin

process(data_in)
  begin
   
   data_out <= data_in(3 downto 0);
  
  end process;
end behavioral;

