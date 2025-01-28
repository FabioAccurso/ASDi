----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.01.2025 17:07:07
-- Design Name: 
-- Module Name: sistema_a - Behavioral
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

entity sistema_a is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           start : in STD_LOGIC;
           ack_b : in STD_LOGIC;
           req_b : out STD_LOGIC;
           dato : out STD_LOGIC_VECTOR (3 downto 0));
end sistema_a;

architecture Structural of sistema_a is

    component unita_controllo_a
        Port (
            CLK         : in  std_logic;
            RST         : in  std_logic;
            start       : in std_logic; -- quando inizia il programma -> a leggere da rom
            count       : in std_logic_vector (2 downto 0); -- valore conteggio contatore mod 8
            ack_B       : in  std_logic; -- Acknowledgment da sistema B
            
            req_b       : out std_logic; -- Req al sistema B
            read        : out std_logic; -- abilita lettura dalla Rom
            en_c_a      : out std_logic -- abilita conteggio contatore indirizzi rom        
        );
    end component;

    component ROM
        port(
            address : in  std_logic_vector(2 downto 0);
            dout    : out std_logic_vector(3 downto 0)
        );
    end component;

    component counter
      generic(
            m : integer := 8;  -- questo ci dice fino a che conta il counter
            n : integer := 3   -- questo ci da la lunghezza del vector, il numero di bit
        );
      Port (
            CLK : in std_logic;
            RESET: in std_logic;
            enable: in std_logic;
            y: out std_logic_vector(n-1 downto 0) -- uscita contatore
       );
    end component;

    --segnali interni per le interconnessioni
    signal read : std_logic;
    signal address : std_logic_vector(2 downto 0);
    signal en_c_a : std_logic;
    

begin

    CU : unita_controllo_a
        port map (
            CLK => CLK,
            RST => RST,
            start  => start,
            count => address,
            ack_B => ack_b,
            req_b => req_b,
            read => read,
            en_c_a => en_c_a
        );

    Rom_8_4 : ROM
        port map (
            address => address,
            dout => dato
        );


    cnt_mod_8 : counter
        generic map (
            m => 8,
            n => 3
        )
        port map (
            CLK  => CLK,
            RESET  => RST,
            enable => en_c_a,
            y => address
        );
    
end Structural;
