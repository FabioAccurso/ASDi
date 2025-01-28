library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity unita_controllo is 
	port( qLSB : in std_logic_vector(1 downto 0);
	      clock, reset, start: in std_logic;--clock è il clock della board, clock_div viene dal divisore di freq
		  count: in std_logic_vector(2 downto 0);
		  loadM, count_in, loadAQ, en_shift: out std_logic;
		  selAQ, subtract: out std_logic); 
end unita_controllo;


architecture structural of unita_controllo is
	type state is (idle, acquisisci_op, waitSR, avvia_somma, avvia_shift, incr_count, fine);
	signal current_state,next_state: state;

	begin 

		
	reg_stato: process(clock)
			  begin
			  if(clock'event and clock='1') then
		         if(reset='1') then 
				    current_state <=idle;
			    else 
				    current_state <=next_state;
			     end if;
			  end if;
			  end process;
			  
	comb: process(current_state, start, count)
		  begin
		  
		  
		 count_in <='0'; 
         subtract <='0';
         selAQ <= '0';
         loadAQ <='0';  --carica nello shift register
         loadM <='0';   --carica il moltiplicando nel registro M
         --stop_cu <='0';  
         en_shift <='0'; --segnale che abilita lo shift durante le prime N-1 iterazioni
         
		  	            
	     CASE current_state is
		  
		  WHEN idle => 
		  
		            
                  if(start='1') then 
					   next_state <= acquisisci_op;
				    else 
					   next_state <= idle;
					end if;
		
		  --fornisce i segnali di caricamento operandi
		  WHEN acquisisci_op => 

		             
		            loadM <='1'; --abilita il caricamento del moltiplicando nel registro M
		            
					loadAQ <='1'; --abilita il caricamento del moltiplicatore e degli 8 zeri in testa 
					              --nello shift register A.Q (perchè selAQ=0)
					
					next_state <= waitSR;
					
		 WHEN waitSR =>
		            
		            next_state <= avvia_somma;
		--acquisisce gli operandi, su cui il sommatore inizia a lavorare immediatamente
		 WHEN avvia_somma => 

                    if(qLSB="01") then
                        selAQ <= '1';
		                loadAQ <= '1'; --fornisce il segnale di caricamento in A del risultato della somma
					    next_state <= avvia_shift;
					elsif(qLSB = "10") then
					    subtract <='1';  
					    selAQ <= '1';
		                loadAQ <= '1'; --fornisce il segnale di caricamento in A del risultato della somma
					    next_state <= avvia_shift;
					elsif(qLSB = "00" or qLSB = "11") then
					    next_state <= avvia_shift;
					end if;
		
		 --carica il risultato della somma in A e da fornisce il segnale di shift
		 WHEN avvia_shift =>  

					en_shift <='1';
					if(count = "111") then
					   next_state <= fine;
					else   
					   next_state <= incr_count;
					end if;
					  
		 --esegue lo shift, abilita incremento conteggio e predispone per nuova iterazione  
		 WHEN incr_count => 
		             
		            count_in <= '1';
					  
					next_state <= avvia_somma;
	
	     
		
		 WHEN fine => 
		      		
                     --stop_cu <='1';
		      		  
                     next_state <= idle;
		end CASE;
		
    end process; 
 end structural;