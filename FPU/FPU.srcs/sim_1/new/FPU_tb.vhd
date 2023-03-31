----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2022 07:44:47 AM
-- Design Name: 
-- Module Name: FPU_tb - Behavioral
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

entity FPU_tb is
--  Port ( );
end FPU_tb;

architecture Behavioral of FPU_tb is

component FPU is
  Port ( --clk: in std_logic;
         addr1 : in std_logic_vector (3 downto 0);
         addr2 : in std_logic_vector (3 downto 0);
         op : in std_logic;
         res : out std_logic_vector(31 downto 0));
         --catode : out std_logic_vector (6 downto 0);
         --anode : out std_logic_vector (3 downto 0));
end component;

signal addr1 : std_logic_vector (3 downto 0):= "0000";
signal addr2 : std_logic_vector (3 downto 0):="0000";
signal op : std_logic := '0';
signal res : std_logic_vector(31 downto 0) :="00000000000000000000000000000000";

begin

 UUT: FPU port map(addr1, addr2, op, res);

process
begin 
     wait for 100 ns;
     op <= '0';
     addr1 <= "0000";
     addr2 <= "0110";
     
     wait for 100 ns;
     op <= '0';
     addr1 <= "0111";
     addr2 <= "1001";
     
     wait for 100 ns;
     op <= '0';
     addr1 <= "0001";
     addr2 <= "0100";
     
     wait for 100 ns;
     op <= '1';
     addr1 <= "0000";
     addr2 <= "0110";
     
     wait for 100 ns;
     op <= '1';
     addr1 <= "0110";
     addr2 <= "0110";
     
     wait for 100 ns;
     op<='0';
     addr1 <= "0110";
     addr2 <= "1001";
     
     wait for 100 ns;
     op<='1';
     addr1 <= "0110";
     addr2 <= "1001";
     
     wait for 100 ns;
     op<='0';
     addr1 <= "1110";
     addr2 <= "1111";
     
     wait for 100 ns;
     op<='1';
end process;

end Behavioral;
