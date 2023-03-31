----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2022 07:27:53 AM
-- Design Name: 
-- Module Name: ROM_tb - Behavioral
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

entity ROM_tb is
--  Port ( );
end ROM_tb;

architecture Behavioral of ROM_tb is

component ROM is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           number : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal address :  STD_LOGIC_VECTOR (3 downto 0);
signal number :  STD_LOGIC_VECTOR (31 downto 0);

begin
   UUT: ROM port map(address, number);
   
   process 
   begin
       wait for  100 ns;
       address <= "0000";
       
       wait for 100 ns;
       address <= "0001";
       
       wait for  100 ns;
       address <= "0010";
       
       wait for 100 ns;
       address <= "0011";
    end process;



end Behavioral;
