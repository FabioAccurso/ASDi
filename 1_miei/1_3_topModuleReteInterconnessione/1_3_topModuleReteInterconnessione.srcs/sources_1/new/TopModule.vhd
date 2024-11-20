----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2024 13:06:43
-- Design Name: 
-- Module Name: TopModule - Behavioral
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
    port(
        clk   :   in std_logic;
        v8_in : in std_logic_vector(7 downto 0);
        upFirst : in std_logic;
        upSecond : in std_logic;
        led_out : out std_logic_vector(3 downto 0)    
    );
end TopModule;

architecture structural of TopModule is

begin


end structural;
