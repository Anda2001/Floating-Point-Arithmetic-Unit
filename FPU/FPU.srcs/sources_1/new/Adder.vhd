library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
    Port (    op : in STD_LOGIC; 
          SA : in STD_LOGIC; --sign a
          SB : in STD_LOGIC; --sign b
          Comp : in STD_LOGIC; -- i if first > second
          A : in STD_LOGIC_VECTOR (27 downto 0);
          B : in STD_LOGIC_VECTOR (27 downto 0);
          Res : out STD_LOGIC_VECTOR (27 downto 0);
          SO: out STD_LOGIC;
          CO: out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is

component CLAadder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;
    
    
    signal Aa_aux, Aaux, Baux, Bb_aux, S_aux, B1, S_aux_2, aux : std_logic_vector(27 downto 0);
    signal AS_aux, SO_aux, CO_aux, SB_aux : std_logic := '0';

begin
  
        SB_aux <= SB xor op;                               -- B's sign 
    SO_aux <= SA when Comp = '1' else                       -- A > B  => Sign A
          SB_aux when Comp = '0' else                   -- B > A  => Sign B 
          '-';
    
    Aaux <= A when Comp = '1' else 
            B when Comp = '0';
    Baux <= B when Comp = '1' else 
            A when Comp = '0';
            
    process(SA, SB_aux, A, B,Aaux,BAux)
    begin
        if (SA xor SB_aux) = '0' then                   -- if Sign A equals to Sign B
            Aa_aux <= Aaux;
            Bb_aux <= Baux;
            
        elsif (SA = '1'  and SB_aux = '0') then         -- if Sign A is negative and Sign B is positive
            Aa_aux <= Baux;
            Bb_aux <= Aaux;
            
        elsif (SA = '0' and SB_aux = '1') then          -- if Sign A is positive and Sign B is negative
            Aa_aux <= Aaux;
            Bb_aux <= Baux;
        end if;
    end process;
    
    AS_aux <= '1' when SA /= SB_aux else                    -- when Signs are different, we substract (1) else add (0)
          '0';
    
    
      Compon: for i in 0 to 27 generate
          B1(i) <= Bb_aux(i) xor AS_aux;
          sum_0: if (i=0) generate
                      sum_0comp: CLAadder port map (A => AA_aux(i), B => B1(i), Cin => AS_Aux, S => S_aux_2(i), Cout => aux(i));
                  end generate;
          sum_i: if ((i > 0) and (i < 28)) generate
                      sum_icomp: CLAadder port map (A => Aa_aux(i), B => B1(i), Cin => aux(i-1), S => S_aux_2(i), Cout => aux(i));
                  end generate;
      end generate;
      
      S_aux <= S_aux_2;
      --CO_aux <= aux(27);
    
    Res <= (S_aux xor X"FFFFFFF") + '1' when ((AS_aux and SO_aux) = '1') else 
            S_aux;
    CO <= '0' when ((SB xor op) /= SA) else aux(27);
    SO <= SO_aux;

end Behavioral;