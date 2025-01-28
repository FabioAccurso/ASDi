library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity riconoscitore is
  port( 
      i: in std_logic;   --- switch S1
      enable_input: in std_logic;  --bottone B1
      A,RST: in std_logic; -- A = clock  RST = Bottone
      M : in std_logic;  --  switch S2
      enable_M: in std_logic;  -- bottone B2
      Y: out std_logic  -- led 
  );
end riconoscitore;

architecture Behavioral of riconoscitore is

type stato is (S0, S1, S2, S3, S4);

signal stato_corrente : stato := S0;
signal stato_prossimo : stato;
signal m_temp: std_logic:= M;
signal Y_temp : std_logic;
begin

f_stato_uscita: process(stato_corrente,i,M)
    begin
        CASE M IS
            WHEN '0' =>
                CASE stato_corrente IS
                    WHEN S0 =>
                        IF (i = '0') THEN
                            stato_prossimo <= S1;
                            Y_temp <= '0';
                        ELSE
                            stato_prossimo <= S3;
                            Y_temp <= '0';
                        END IF;
                    WHEN S1 =>
                        stato_prossimo <= S2;
                        Y_temp <= '0';
    
                    WHEN S2 =>
                        stato_prossimo <= S0;
                        Y_temp <= '0';
                
                    WHEN S3 =>
                        IF (i = '0') THEN
                            stato_prossimo <= S4;
                            Y_temp <= '0';
                        ELSE
                            stato_prossimo <= S2;
                            Y_temp <= '0';
                        END IF;
                
                    WHEN S4 =>
                        stato_prossimo <= S0;
                        Y_temp <= i;
                
                    WHEN OTHERS =>
                        Y_temp <= '0';
                END CASE;
                
            WHEN '1' =>
                CASE stato_corrente IS
                    WHEN S0 =>
                        IF (i = '0') THEN
                            stato_prossimo <= S0;
                            Y_temp <= '0';
                        ELSE
                            stato_prossimo <= S1;
                            Y_temp <= '0';
                        END IF;
            
                    WHEN S1 =>
                        IF (i = '0') THEN
                            stato_prossimo <= S2;
                            Y_temp <= '0';
                        ELSE
                            stato_prossimo <= S1;
                            Y_temp <= '0';
                        END IF;
            
                    WHEN S2 =>
                        stato_prossimo <= S0;
                        Y_temp <= i;
            
                    WHEN OTHERS =>
                        Y_temp <= '0';
                END CASE;
                
            WHEN OTHERS =>
                Y_temp <= '0';
         END CASE;
    end process;


mem: process(A)
begin  
  if( A'event and A = '1' ) then
    if( RST = '1') then   
         stato_corrente <= S0;
         Y <= '0';
    else
        if(enable_M = '1') then
            if(M /= m_temp) then    
              stato_corrente <= S0;  
              m_temp <= M; 
            end if;  
        end if;   
        if( enable_input = '1') then
            stato_corrente <= stato_prossimo;
            Y <= Y_temp;
        end if;
    end if;
  end if;
end process;


end Behavioral;

