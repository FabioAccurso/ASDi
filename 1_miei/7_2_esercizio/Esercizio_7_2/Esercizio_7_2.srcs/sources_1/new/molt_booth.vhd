library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- il progetto utilizza un clock divider
entity molt_booth is
	 port( clock, reset, start: in std_logic;
		   X, Y: in std_logic_vector(7 downto 0);		   
		   P: out std_logic_vector(15 downto 0));
		   --stop_cu: out std_logic);
end molt_booth;

architecture structural of molt_booth is
	component unita_controllo is 
		port( qLSB : in std_logic_vector(1 downto 0);
		  clock, reset, start: in std_logic;
		  count: in std_logic_vector(2 downto 0);
		  loadM, count_in, loadAQ, en_shift: out std_logic;
		  selAQ, subtract: out std_logic); 
	end component;
	
	component unita_operativa is
	port( X, Y: in std_logic_vector(7 downto 0);--moltiplicatore e moltiplicando
		  clock, reset: in std_logic;
		  loadAQ, shift, loadM, sub,  selAQ, count_in: in std_logic;
		  count: out std_logic_vector(2 downto 0);
		  P: out std_logic_vector(16 downto 0));
	end component;
	
	component ButtonDebouncer
    
    GENERIC (                       
        CLK_period: integer := 10;  -- periodo del clock (della board) in nanosecondi
        btn_noise_time: integer := 10000000 -- durata stimata dell'oscillazione del bottone in nanosecondi  
                                            -- il valore di default � 10ms                                         -- il valore di default � 10 millisecondi
    );
    PORT ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BTN : in STD_LOGIC;
           CLEARED_BTN : out STD_LOGIC);
    end component;
	
	
	signal tempqLSB : std_logic_vector(1 downto 0);
	signal temp_selAQ, temp_clock, temp_sub,temp_loadAQ: std_logic;
	signal temp_count: std_logic_vector(2 downto 0);
	signal temp_p: std_logic_vector(16 downto 0);
	signal temp_count_in, t_load_add: std_logic;
	signal fine_conteggio: std_logic;
	signal temp_shift: std_logic;
	signal temp_loadM: std_logic;
	signal temp_reset: std_logic;
	signal temp_reset_in: std_logic; -- segnale di reset in ingresso alla UO
	signal temp_start: std_logic;
	
	begin
	
	UC: unita_controllo port map
	(tempqLSB, clock, temp_reset, temp_start, 
	temp_count, 
	temp_loadM, temp_count_in, temp_loadAQ, temp_shift, 
	temp_selAQ,  temp_sub);
	
		  
	
	UO: unita_operativa port map
	(X, Y, clock, temp_reset, temp_loadAQ, temp_shift, temp_loadM, 
	temp_sub,  temp_selAQ,  temp_count_in, temp_count, temp_p); 
	
	
    DEB_START: ButtonDebouncer port map ('0', clock, start, temp_start
);

    DEB_RESET: ButtonDebouncer port map ('0', clock, reset, temp_reset);
		  
	tempqLSB<=temp_p(1 downto 0); --invio all'unit  di controllo il bit meno significativo del registro A.Q
	P<=temp_p(16 downto 1);
	
	-- la UO viene resettata sia se arriva un reset dall'esterno sia se l'operazione di moltiplicazione termina
	--temp_reset_in <= reset or temp_stop_cu;
	
	--stop_cu <= temp_stop_cu;
end structural;
