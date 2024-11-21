----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2024 09:50:32
-- Design Name: 
-- Module Name: mux16_1 - Structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux16_1 is
    Port ( c0 : in STD_LOGIC;
           c1 : in STD_LOGIC;
           c2 : in STD_LOGIC;
           c3 : in STD_LOGIC;
           c4 : in STD_LOGIC;
           c5 : in STD_LOGIC;
           c6 : in STD_LOGIC;
           c7 : in STD_LOGIC;
           c8 : in STD_LOGIC;
           c9 : in STD_LOGIC;
           c10 : in STD_LOGIC;
           c11 : in STD_LOGIC;
           c12 : in STD_LOGIC;
           c13 : in STD_LOGIC;
           c14 : in STD_LOGIC;
           c15 : in STD_LOGIC;
           se0 : in STD_LOGIC;
           se1 : in STD_LOGIC;
           se2 : in STD_LOGIC;
           se3 : in STD_LOGIC;
           y1 : out STD_LOGIC);
end mux16_1;

architecture structural of mux16_1 is
    signal u0: std_logic := '0';
    signal u1: std_logic := '0';
    signal u2: std_logic := '0';
    signal u3: std_logic := '0';
    
    
    component mux_4_1 
	   port(	
            b0 : in STD_LOGIC;
			b1 : in STD_LOGIC;
			b2 : in STD_LOGIC;
			b3 : in STD_LOGIC;
			s0 : in STD_LOGIC;
			s1 : in STD_LOGIC;
			y0 : out STD_LOGIC
          );		
    end component;
    
begin

    mux0: mux_4_1
        port map(
                b0 =>c0,
                b1 =>c1,
                b2 =>c2,
                b3 =>c3,
                s0 =>se0,
                s1 =>se1,
                y0 =>u0
            );


    mux1: mux_4_1
        port map(
                b0 =>c4,
                b1 =>c5,
                b2 =>c6,
                b3 =>c7,
                s0 =>se0,
                s1 =>se1,
                y0 =>u1
            );



    mux2: mux_4_1
        port map(
                b0 =>c8,
                b1 =>c9,
                b2 =>c10,
                b3 =>c11,
                s0 =>se0,
                s1 =>se1,
                y0 =>u2
            );


    mux3: mux_4_1
        port map(
                b0 =>c12,
                b1 =>c13,
                b2 =>c14,
                b3 =>c15,
                s0 =>se0,
                s1 =>se1,
                y0 =>u3
            );


    mux4: mux_4_1
        port map(
                b0 =>u0,
                b1 =>u1,
                b2 =>u2,
                b3 =>u3,
                s0 =>se2,
                s1 =>se3,
                y0 =>y1
            );
            

end structural;
