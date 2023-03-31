library ieee;
use ieee.std_logic_1164.all;

entity ShiftLeft is
	port ( Min : in std_logic_vector(27 downto 0);	
		   shift : in std_logic_vector(4 downto 0);		
		   Mout : out std_logic_vector(27 downto 0));
end ShiftLeft;

architecture Behavioral of ShiftLeft is

signal aux : std_logic_vector(27 downto 0) := "0000000000000000000000000000";
		
begin

    process(shift, Min)
    begin
        case shift is
            when "00000" => aux <= Min;
            when "00001" => aux <= Min(26 downto 0) & "0";
            when "00010" => aux <= Min(25 downto 0) & "00";
            when "00011" => aux <= Min(24 downto 0) & "000";
            when "00100" => aux <= Min(23 downto 0) & "0000";
            when "00101" => aux <= Min(22 downto 0) & "00000";
            when "00110" => aux <= Min(21 downto 0) & "000000";
            when "00111" => aux <= Min(20 downto 0) & "0000000";
            when "01000" => aux <= Min(19 downto 0) & "00000000";
            when "01001" => aux <= Min(18 downto 0) & "000000000";
            when "01010" => aux <= Min(17 downto 0) & "0000000000";
            when "01011" => aux <= Min(16 downto 0) & "00000000000";
            when "01100" => aux <= Min(15 downto 0) & "000000000000";
            when "01101" => aux <= Min(14 downto 0) & "0000000000000";
            when "01110" => aux <= Min(13 downto 0) & "00000000000000";
            when "01111" => aux <= Min(12 downto 0) & "000000000000000";
            when "10000" => aux <= Min(11 downto 0) & "0000000000000000";
            when "10001" => aux <= Min(10 downto 0) & "00000000000000000";
            when "10010" => aux <= Min(9 downto 0) & "000000000000000000";
            when "10011" => aux <= Min(8 downto 0) & "0000000000000000000";
            when "10100" => aux <= Min(7 downto 0) & "00000000000000000000";
            when "10101" => aux <= Min(6 downto 0) & "000000000000000000000";
            when "10110" => aux <= Min(5 downto 0) & "0000000000000000000000";
            when "10111" => aux <= Min(4 downto 0) & "00000000000000000000000";
            when "11000" => aux <= Min(3 downto 0) & "000000000000000000000000";
            when "11001" => aux <= Min(2 downto 0) & "0000000000000000000000000";
            when "11010" => aux <= Min(1 downto 0) & "00000000000000000000000000";
            when "11011" => aux <= Min(0) & "000000000000000000000000000";
            when others => aux <= "0000000000000000000000000000";
        end case;       
    end process;
    
    Mout <= aux;
    
end Behavioral;