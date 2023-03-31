----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2022 10:18:06 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           number : out STD_LOGIC_VECTOR (31 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array(0 to 15) of STD_LOGIC_VECTOR (31 downto 0);
signal mem : rom_type := (
    b"0_00000000_00000000000000000000000", -- 0
    b"0_11111111_00000000000000000000000", -- Infinity
    b"0_11111111_00000000000000000000011", -- Nan
    b"1_00000000_00000000000000000000000", -- -0
    b"1_11111111_00000000000000000000000", -- -Infinity
    b"1_11111111_00000000000000000000011", -- -Nan
    b"0_10000000_11000000000000000000000", --3.5
    b"0_10000000_01100000000000000000000", --2.75
    b"0_10000000_10100000000000000000000", --3.25
    b"0_10000000_01000000000000000000000", --2.5
    b"1_10001010_11010100110000000110001", 
    b"0_01111110_11110001110001000011001",
    b"0_10000010_00111000000000000000000", -- 9.75
    b"0_01111110_00100000000000000000000", -- 0.5625
    b"1_10001001_01111100010000001011010",
    b"0_01110101_11001111111111101011000"
 );
begin
    process(address)
    begin
        number <= mem(conv_integer(address));
    end process;

end Behavioral;
