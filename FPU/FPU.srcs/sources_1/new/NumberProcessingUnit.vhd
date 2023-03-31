----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2022 10:38:54 PM
-- Design Name: 
-- Module Name: NumberProcessingUnit - Behavioral
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

entity NumberProcessingUnit is
  Port (  A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          SA : out STD_LOGIC;
          SB : out STD_LOGIC;
          Comp : out STD_LOGIC;
          Emax : out STD_LOGIC_VECTOR (7 downto 0);
          MAout : out STD_LOGIC_VECTOR (27 downto 0);
          MBout : out STD_LOGIC_VECTOR (27 downto 0));
end NumberProcessingUnit;

architecture Behavioral of NumberProcessingUnit is

    
    component Comparator is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
               B : in STD_LOGIC_VECTOR (31 downto 0);
               SA : out STD_LOGIC;
               SB : out STD_LOGIC;
               Emax : out STD_LOGIC_VECTOR (7 downto 0);
               Mmax : out STD_LOGIC_VECTOR (22 downto 0);
               Mshift : out STD_LOGIC_VECTOR (22 downto 0);
               Dif : out STD_LOGIC_VECTOR (7 downto 0);
               Comp : out STD_LOGIC);
    end component;
    
    component ShiftRight is
        port ( Min : in std_logic_vector(27 downto 0);    
               shift : in std_logic_vector(7 downto 0);        
               Mout : out std_logic_vector(27 downto 0));
    end component;



   signal Mshift : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
    signal MAaux : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
    signal Maux : STD_LOGIC_VECTOR (27 downto 0):= "0000000000000000000000000000";
    signal Mout : STD_LOGIC_VECTOR (27 downto 0):= "0000000000000000000000000000";
    signal Dif : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    
    
    begin
    
        CompareExponent : Comparator port map (   A => A, 
                                                            B => B, 
                                                            SA => SA, 
                                                            SB => SB, 
                                                            Emax => Emax, 
                                                            Mmax => MAaux, 
                                                            Mshift => Mshift, 
                                                            Dif => Dif, 
                                                            Comp => Comp);
            
        Maux <= Mshift & "00000";
        Shift : ShiftRight port map (   Min => Maux, 
                                        shift => Dif, 
                                        Mout => Mout);
        
        MBout <= Mout;
        MAout <= MAaux & "00000";
end Behavioral;
