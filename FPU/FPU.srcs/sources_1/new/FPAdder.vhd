----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 01:55:41 AM
-- Design Name: 
-- Module Name: FPAdder - Behavioral
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

entity FPAdder is
  Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          operation : in STD_LOGIC;
          Result : out STD_LOGIC_VECTOR (31 downto 0));
end FPAdder;

architecture Behavioral of FPAdder is

component OpEnable is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           op : in std_logic;
           enable : out STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component NumberProcessingUnit is
     Port (A : in STD_LOGIC_VECTOR (31 downto 0);
          B : in STD_LOGIC_VECTOR (31 downto 0);
          SA : out STD_LOGIC;
          SB : out STD_LOGIC;
          Comp : out STD_LOGIC;
          Emax : out STD_LOGIC_VECTOR (7 downto 0);
          MAout : out STD_LOGIC_VECTOR (27 downto 0);
          MBout : out STD_LOGIC_VECTOR (27 downto 0));
end component;

component Adder is
    Port (    op : in STD_LOGIC; 
      SA : in STD_LOGIC; --sign a
      SB : in STD_LOGIC; --sign b
      Comp : in STD_LOGIC; -- i if first > second
      A : in STD_LOGIC_VECTOR (27 downto 0);
      B : in STD_LOGIC_VECTOR (27 downto 0);
      Res : out STD_LOGIC_VECTOR (27 downto 0);
      SO: out STD_LOGIC;
      CO: out STD_LOGIC);
end component;

component StandardizingBlock is
    Port ( S : in STD_LOGIC;
           M : in STD_LOGIC_VECTOR (27 downto 0);
           E : in STD_LOGIC_VECTOR (7 downto 0);
           carryOut : in STD_LOGIC;
           operation : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal enable, SA, SB, Comp, SO, carryOut: std_logic := '0';
signal auxResult, resultAdd : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
signal Emax : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal MAout, MBout, resultAdder : STD_LOGIC_VECTOR (27 downto 0) := "0000000000000000000000000000";

begin
  
  getCase : OpEnable port map (  A => A, 
                              B => B, 
                              op => operation,
                              enable => enable, 
                              Result => auxResult);
  
  NPU : NumberProcessingUnit port map ( A,B,SA,SB,Comp, Emax,MAout,MBout);
  
  adderComp : Adder port map (        op => operation,
                                      SA => SA, 
                                      SB => SB, 
                                      Comp => Comp,
                                      A => MAout, 
                                      B => MBout,
                                      Res => resultAdder, 
                                      SO => SO,  
                                      CO => carryOut);
  
  
    standardizeComp: StandardizingBlock port map (   S => SO, 
                                                     M => resultAdder, 
                                                     E => Emax, 
                                                     carryOut => carryOut,
                                                     operation => operation,  
                                                     Result => resultAdd);
                                          
    Result <= auxResult when enable = '0' else
                resultAdd;

end Behavioral;
