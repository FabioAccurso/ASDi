library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopModule is
    port(
        clk : in std_logic;
        B1: in std_logic;
        B2 : in std_logic;
        S1 : in std_logic;
        S2 : in std_logic;
        reset : in std_logic;
        led_out : out std_logic
    );
  end TopModule;
  
architecture structural of TopModule is

signal mod_inter : std_logic;
signal dato_inter : std_logic;

  component control_unit is
    Port (
        clock       : in std_logic;
        caricaInput : in STD_LOGIC;
        caricaModo  : in STD_LOGIC;
        input_a       : in std_logic;
        modo        : in std_logic;
        uscitaInput : out std_logic;
        uscitaModo  : out std_logic
    );
  end component;
  
  component riconoscitore is 
  port(
    i  : in std_logic;
    clock : in std_logic;
    rst: in std_logic;
    m  : in std_logic;
    y  : out std_logic
  );
  end component;
  
  

  
begin
    CU : control_unit
        Port map(
            clock => clk,
            caricaInput => B1,
            caricaModo => B2,
            input_a => S1,
            modo => S2,
            uscitaInput => dato_inter,
            uscitaModo => mod_inter
        ); 
    
    RIC: riconoscitore
        Port map(
            i => dato_inter,
            clock => clk,
            rst => reset,
            m => mod_inter,
            y => led_out
        );

end structural;