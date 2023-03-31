----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 01:43:03 AM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator is
  Port (A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           SA : out STD_LOGIC;
           SB : out STD_LOGIC;
           Emax : out STD_LOGIC_VECTOR (7 downto 0);
           Mmax : out STD_LOGIC_VECTOR (22 downto 0);
           Mshift : out STD_LOGIC_VECTOR (22 downto 0);
           Dif : out STD_LOGIC_VECTOR (7 downto 0);
           Comp : out STD_LOGIC );
end Comparator;

architecture Behavioral of Comparator is
signal first_exp, second_exp : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
signal first_mantissa, second_mantissa : STD_LOGIC_VECTOR(22 downto 0) := "00000000000000000000000";
begin
  SA <= A(31);
  first_exp <= A(30 downto 23);
  first_mantissa <= A(22 downto 0);
  
  second_exp <= B(30 downto 23);
  second_mantissa <= B(22 downto 0);
  SB <= B(31);
  
  process(first_exp, second_exp, first_mantissa, second_mantissa)
  begin
      if (first_exp >= second_exp or (first_exp = second_exp and first_mantissa >= second_mantissa)) then
          Comp <= '1';
          Emax <= first_exp;
          Dif <= first_exp - second_exp;
          MShift <= second_mantissa;
          Mmax <= first_mantissa;
      else
          Comp <= '0';
          Emax <= second_exp;
          Dif <= second_exp - first_exp;
          MShift <= first_mantissa;
          Mmax <= second_mantissa;
      end if;
  end process;

end Behavioral;
