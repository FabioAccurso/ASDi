library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity mbooth_tb is
end mbooth_tb;

architecture behavioural of mbooth_tb is

	component molt_booth is
	  port( clock, reset, start: in std_logic;
		   X, Y: in std_logic_vector(7 downto 0);   
		   P: out std_logic_vector(15 downto 0);
		   stop_cu: out std_logic);
	end component;
	signal inputx, inputy: std_logic_vector(7 downto 0);
	signal prod: std_logic_vector(15 downto 0);
	signal clk, res, start: std_logic;
	signal t_stop_cu: std_logic;
    constant clk_period : time := 10 ns;
    
    signal end_sim : std_logic := '0';
    
       
	begin
	
	uut: molt_booth port map(clk, res, start, inputx, inputy, prod, t_stop_cu);
	
	clk_process : process
     begin
        while (end_sim = '0') loop
            clk<= '1';
            wait for clk_period/2;
            clk <= '0';
            wait for clk_period/2;
        end loop;
        wait;
     end process;
   
	 

	
	sim: process
		 begin
		 
		 wait for 100 ns;
		
		 res<='1';
		 wait for 2 * clk_period;
		 res<='0';
		
		--------------------------------------- operazione numero 1:
		-- 15*3=45 (002D)
        inputx <= "00001111";
        inputy <= "00000011";
		 	 
		 -- start deve essere visto da clk_div: poich  sar  generato dal button debouncer si aggiunger  anche il clk_div
		 -- al button debouncer e il segnale di start deve durare quanto il periodo del clk rallentato
		 
		 start<='1';
		 wait for clk_period ;
		 start<='0';
		 
		 
		 wait for 50*clk_period;
		
		 
		 res <= '1';
		 wait for 2 * clk_period;
		 res <= '0';
		 --------------------------------------- operazione numero 2:
		 -- 15*(-3)=-45 (0053)
         inputx <= "00001111";
         inputy <= "11111101";
         
         start <= '1';
         wait for clk_period;
         start <= '0';
         
         
		 wait for 50*clk_period;
		 
         
		 wait;
		 end process;
	
	
end behavioural;