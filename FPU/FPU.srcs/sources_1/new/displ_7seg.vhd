----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2022 06:40:55 PM
-- Design Name: 
-- Module Name: displ_7seg - Behavioral
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

entity displ_7seg is
  Port (     clk: in std_logic;
             data : in std_logic_vector (15 downto 0);
             sseg : out std_logic_vector (6 downto 0);
             an : out std_logic_vector (3 downto 0));
end displ_7seg;

architecture Behavioral of displ_7seg is

begin


end Behavioral;
