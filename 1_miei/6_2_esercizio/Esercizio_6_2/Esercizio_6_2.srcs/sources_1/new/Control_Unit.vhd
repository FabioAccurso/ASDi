----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2024 12:09:29
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity Control_Unit is
    generic (bits : integer := 4;
    N : positive := 16);
    Port (
        clk : in std_logic;
        rst : in std_logic;
        start : in std_logic;
        count : in std_logic_vector(bits-1 downto 0);
        enable : out std_logic;
        read : out std_logic;
        write : out std_logic );
end Control_Unit;

architecture Behavioral of Control_Unit is

type state is (idle, lettura, scrittura, incr_count, fine);
signal current_state,next_state: state;

begin

seq: process(clk)
    begin
        if(clk'event and clk='1') then
            if(rst='1') then
                current_state <=idle;
			else 
				current_state <=next_state;
			end if;
		end if;
	end process;

comb: process(current_state, start, count)

    begin
		  	            
	CASE current_state is
	   
	   WHEN idle =>
	   
	       if(start='1') then 
		      next_state <= lettura;
		   else 
			  next_state <= idle;
		   end if;
		
		  
	   WHEN lettura =>
		  
		   enable <= '0';
		   read <='1';
		   next_state <= scrittura;
						
	   WHEN scrittura =>  
            
           read <= '0';
           write <= '1';
           next_state <= incr_count;
       
       WHEN incr_count =>  
            
           write <= '0';
           if(unsigned(std_logic_vector(count))= N-1) then 
		      next_state <= fine;
		   else 
		      enable <= '1';
			  next_state <= lettura;
		   end if;
		
	   WHEN fine => 
		      	
	       next_state <= idle;	
                   
	end CASE;
	end process;

end Behavioral;
