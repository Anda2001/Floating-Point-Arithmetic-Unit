----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2022 10:12:39 PM
-- Design Name: 
-- Module Name: FPU - Behavioral
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

entity FPU is
  Port ( --clk: in std_logic;
         addr1 : in std_logic_vector (3 downto 0);
         addr2 : in std_logic_vector (3 downto 0);
         op : in std_logic;
         res : out std_logic_vector(31 downto 0));
         --catode : out std_logic_vector (6 downto 0);
         --anode : out std_logic_vector (3 downto 0));
end FPU;

architecture Behavioral of FPU is

component ROM is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           number : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component FPAdder is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           operation : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component displ_7seg is
	port (  clk: in std_logic;
		    data : in std_logic_vector (15 downto 0);
		    sseg : out std_logic_vector (6 downto 0);
		    an : out std_logic_vector (3 downto 0));
end component;

signal first_number, second_number, result : STD_LOGIC_VECTOR (31 downto 0):= x"00000000";
signal result1 : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
--signal res : std_logic_vector (31 downto 0) := x"00000000";

begin

    Rom1: ROM port map (addr1, first_number);
    Rom2: ROM port map (addr2, second_number);
    
    FP: FPAdder port map (  A => first_number, 
                            B => second_number, 
                            operation => op, 
                            Result => result);
        
        result1 <= result(31 downto 16);
        res <= result;
        
--        ssd: displ_7seg port map (  clk => clk,
--                                    data => result1 , 
--                                    sseg => catode, 
--                                    an => anode);


end Behavioral;
