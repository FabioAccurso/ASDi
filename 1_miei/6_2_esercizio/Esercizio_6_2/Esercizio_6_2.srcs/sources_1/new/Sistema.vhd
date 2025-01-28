library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Sistema is
    
    generic(bits : integer := 4;
    N : integer := 16);
    
    Port (
        clock : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        uscita : out std_logic_vector(3 downto 0));
end Sistema;

architecture Structural of Sistema is

component ROM
generic (bits : integer := 4);
    port(
        clk : in std_logic;
        address : in std_logic_vector(bits-1 downto 0);  
        read : in std_logic;                              
        data : out std_logic_vector(7 downto 0) 
    );
end component;

component M 
    Port (
        data_in : in std_logic_vector(7 downto 0);                              
        data_out : out std_logic_vector(3 downto 0) 
     );
end component;

component MEM
    generic (bits : integer := 4);
    port(
        clk : in std_logic;
        write : in std_logic;
        address : in std_logic_vector(bits-1 downto 0);                                
        input : in std_logic_vector(3 downto 0)
    );   
end component;

component contatore
    generic(bits : integer := 4);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   enable : in STD_LOGIC; 
           counter : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

component clock_divider
    generic(
        clock_frequency_in : integer := 100000000; --100MHz
        clock_frequency_out : integer := 2 --500 Hz
    );
    
    port(
        clock_in : in std_logic;
        reset : in std_logic;
        clock_out : out std_logic
    );
end component;

component Control_Unit
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
end component;

signal s1 : std_logic_vector(7 downto 0); -- uscita ROM, ingresso M
signal s2 : std_logic_vector(3 downto 0); -- uscita M, ingresso MEM
signal s3 : std_logic_vector(bits-1 downto 0); -- indirizzo/uscita contatore
signal s4, s5, s6 : std_logic; -- segnali di abilitazione: enable, read, write
signal cd : std_logic; --uscita clock divider, ingresso altri clock

begin

rom_0 : ROM

    generic map (bits => bits)
    port map(
        clk => cd,
        address => s3,
        read => s5,
        data => s1
    );
    
 macc : M

    port map(
        data_in => s1,
        data_out => s2  
    );
    
mem_0 : MEM

    generic map (bits => bits)
    port map(
        clk => cd,
        write => s6,
        address => s3,
        input => s2
    );

cont : Contatore

    generic map (bits => bits)
    port map(
        clock => cd,
        reset => reset,
        enable => s4,
        counter => s3
    );
    
CU : Control_Unit

    generic map (N => N)
    port map(
        clk => cd,
        rst => reset,
        start => start,
        count => s3,
        enable => s4,
        read => s5,
        write => s6
    );

C_D : clock_divider 
    
    port map (
        clock_in => clock,
        reset => '0',
        clock_out => cd
    );
 
    
uscita<=s2;

end Structural;
