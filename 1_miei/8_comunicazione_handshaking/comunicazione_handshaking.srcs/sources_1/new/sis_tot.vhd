----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2025 17:11:03
-- Design Name: 
-- Module Name: sis_tot - Behavioral
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

entity sis_tot is
    port (
        clk : in std_logic;
        reset : in std_logic;
        start_send : in std_logic
    );
end entity sis_tot;

architecture rtl of sis_tot is
    component MEM is
        port(
            CLK_mem : in std_logic;
            write : in std_logic;
            address : in std_logic_vector (3 downto 0);
            inp_val : in std_logic_vector(3 downto 0);
            out_val : out std_logic_vector(3 downto 0)
        );
    end component MEM;
    
    component counter_mod_N is
        port (
            clock : in std_logic;
            reset : in std_logic;
            enable : in std_logic;
            counter : out std_logic_vector(3 downto 0)
        );
    end component counter_mod_N;
    
    component ripple_carry is
        port (
            X : in std_logic_vector(3 downto 0);
            Y : in std_logic_vector(3 downto 0);
            c_in : in std_logic;
            c_out : out std_logic;
            Z : out std_logic_vector(3 downto 0)
        );
    end component ripple_carry;
    
    component unita_controllo_tx is
    GENERIC (
        N : INTEGER := 4
    );
    
    port (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        start_send : IN STD_LOGIC;
        ack : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        req : OUT STD_LOGIC;
        en_read_mem : OUT STD_LOGIC;
        en_counter : OUT STD_LOGIC
    );
    end component unita_controllo_tx;
    
    component unita_controllo_rx is
    GENERIC (
    N : INTEGER := 4
    );
    
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        req : IN STD_LOGIC;
        address : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
        ack : OUT STD_LOGIC;
        en_read_in : OUT STD_LOGIC;
        en_read_mem : OUT STD_LOGIC;
        en_write_mem : OUT STD_LOGIC;
        en_counter : OUT STD_LOGIC
    );
    end component unita_controllo_rx;
    
signal ack_temp : std_logic;
signal address_temp : std_logic_vector(3 downto 0);
signal req_temp : std_logic;
signal en_read_in_temp : std_logic;
signal en_read_mem_temp : std_logic;
signal en_write_mem_temp : std_logic;
signal en_counter_temp_RX : std_logic;
signal en_counter_temp_TX : std_logic;
signal count_temp_TX : std_logic_vector(3 downto 0);
signal count_temp_RX : std_logic_vector(3 downto 0);
signal input_val_temp : std_logic_vector(3 downto 0);
signal registro1_temp : std_logic_vector(3 downto 0);
signal registro2_temp : std_logic_vector(3 downto 0);
signal ris_temp : std_logic_vector(3 downto 0);
signal cout_temp : std_logic;

begin
    u_tx : unita_controllo_tx
        port map (
            clk => clk,
            rst => reset,
            start_send => start_send,
            ack => ack_temp,
            address => address_temp,
            req => req_temp,
            en_read_mem => en_read_mem_temp,
            en_counter => en_counter_temp_TX
        );
        
    u_rx : unita_controllo_rx
        port map (
            clk => clk,
            rst => reset,
            req => req_temp,
            address => address_temp,
            ack => ack_temp,
            en_read_in => en_read_in_temp,
            en_read_mem => en_read_mem_temp,
            en_write_mem => en_write_mem_temp,
            en_counter => en_counter_temp_RX
        );
        
    mem0 : MEM
        port map (
            CLK_mem => clk,
            write => '0',
            address => count_temp_TX,
            inp_val => input_val_temp,
            out_val => registro1_temp
        );
        
    mem1 : MEM
        port map (
            CLK_mem => clk,
            write => en_write_mem_temp,
            address => count_temp_RX,
            inp_val => ris_temp,
            out_val => registro2_temp
        );
        
    contatoreTX : counter_mod_N
        port map (
            clock => clk,
            reset => reset,
            enable => en_counter_temp_TX,
            counter => count_temp_TX
        );
        
    contatoreRX : counter_mod_N
        port map (
            clock => clk,
            reset => reset,
            enable => en_counter_temp_RX,
            counter => count_temp_RX
        );
        
    ripple_adder : ripple_carry
        port map (
            X => registro1_temp,
            Y => registro2_temp,
            c_in => '0',
            c_out => cout_temp,
            Z => ris_temp
        );
end architecture rtl;
