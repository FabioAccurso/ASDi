----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2024 23:42:56
-- Design Name: 
-- Module Name: TopModule - Structural
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

entity TopModule is
    Port ( ingresso : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rd : in STD_LOGIC;
           led_out : out STD_LOGIC_VECTOR (3 downto 0));
end TopModule;

architecture Structural of TopModule is
    component Rom
        generic (N:natural range 1 to 32 :=4);
        Port ( 
           clock : in STD_LOGIC;
           read : in STD_LOGIC;
           address : in std_logic_vector(N-1 downto 0); 
           uscita : out std_logic_vector(7 downto 0)  
        );
    end component;
    
    component macchina_M
        Port ( valore_Mem : in STD_LOGIC_VECTOR (7 downto 0);
            output : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    -- segnali interni
    signal value_rom : std_logic_vector(7 downto 0);
     
     
    begin
    RO: Rom
        Port map(
            clock => clk,
            read => rd,
            address =>ingresso,
            uscita => value_rom
        );
     
    M: macchina_M
        Port map(
            valore_Mem => value_rom,
            output => led_out
        );
        
end Structural;
