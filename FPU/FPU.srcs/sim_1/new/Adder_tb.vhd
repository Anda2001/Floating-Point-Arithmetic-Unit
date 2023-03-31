----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2022 09:08:44 AM
-- Design Name: 
-- Module Name: Adder_tb - Behavioral
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

entity Adder_tb is
--  Port ( );
end Adder_tb;

architecture Behavioral of Adder_tb is

component Adder is
  Port ( operation : in STD_LOGIC; 
           SA : in STD_LOGIC;
           SB : in STD_LOGIC;
           Comp : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (27 downto 0);
           B : in STD_LOGIC_VECTOR (27 downto 0);
           Result : out STD_LOGIC_VECTOR (27 downto 0);
           SO: out STD_LOGIC;
           carryOut: out STD_LOGIC);
end component;

signal operation : STD_LOGIC; 
signal SA : STD_LOGIC;
signal SB : STD_LOGIC;
signal Comp : STD_LOGIC;
signal A: STD_LOGIC_VECTOR (27 downto 0);
signal B: STD_LOGIC_VECTOR (27 downto 0);
signal Result : STD_LOGIC_VECTOR (27 downto 0);
signal SO: STD_LOGIC;
signal carryOut: STD_LOGIC;

begin

 UUT: Adder port map (operation, SA, SB, Comp, A,B, Result, SO, carryOut);
     

end Behavioral;
