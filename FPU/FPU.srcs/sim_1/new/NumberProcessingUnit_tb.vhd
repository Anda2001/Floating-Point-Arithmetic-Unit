----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2022 11:38:33 PM
-- Design Name: 
-- Module Name: NumberProcessingUnit_tb - Behavioral
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

entity NumberProcessingUnit_tb is
--  Port ( );
end NumberProcessingUnit_tb;

architecture Behavioral of NumberProcessingUnit_tb is
component NumberProcessingUnit is
 Port (  A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          SA : out STD_LOGIC;
          SB : out STD_LOGIC;
          Comp : out STD_LOGIC;
          Emax : out STD_LOGIC_VECTOR (7 downto 0);
          MAout : out STD_LOGIC_VECTOR (27 downto 0);
          MBout : out STD_LOGIC_VECTOR (27 downto 0));
end component;

 signal a :  STD_LOGIC_VECTOR (31 downto 0);
 signal b :  STD_LOGIC_VECTOR (31 downto 0);
 signal SA :  STD_LOGIC;
 signal SB :  STD_LOGIC;
 signal Emax :  STD_LOGIC_VECTOR (7 downto 0);
 signal MAout :  STD_LOGIC_VECTOR (27 downto 0);
 signal MBout :  STD_LOGIC_VECTOR (27 downto 0);
 
begin
    UUT: NumberProcessingUnit port map(a, b, sa, sb,emax,maout,mbout);
    
    process 
    begin
        wait for  100 ns;
        a <= b"0_10000000_11000000000000000000000";
        b <= b"0_10000000_10100000000000000000000";
        
        
        wait for  100 ns;
        a <= b"0_10000001_11000000000000000000000";
        b <= b"0_10000000_10100000000000000000000";
        
                
        wait for  100 ns;
        a <= b"0_10000010_00111000000000000000000";
        b <= b"0_01111110_00100000000000000000000";
     end process;

end Behavioral;
