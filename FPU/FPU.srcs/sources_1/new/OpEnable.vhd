----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2022 01:53:19 AM
-- Design Name: 
-- Module Name: OpEnable - Behavioral
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

entity OpEnable is
  Port (A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           op : in std_logic;
           enable : out STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (31 downto 0) );
end OpEnable;

architecture Behavioral of OpEnable is
signal aux : STD_LOGIC_VECTOR (31 downto 0);
begin
   process( A, B, op)
 begin
         if A = X"00000000" then -- 0
             if op = '0' then
                aux <= B;
             elsif B(31) = '0' then
                aux <= '1' & B(30 downto 0);
             else
                aux <= '0' & B(30 downto 0);
             end if;
         elsif A = X"80000000" then  -- -0
            if op = '0' then
             aux <= B;
          elsif B(31) = '0' then
             aux <= '1' & B(30 downto 0);
          else
             aux <= '0' & B(30 downto 0);
          end if;
         elsif B = X"00000000" then --0
           if op = '0' then
             aux <= A;
          elsif A(31) = '0' then
             aux <= '1' & A(30 downto 0);
          else
             aux <= '0' & A(30 downto 0);
          end if;
         elsif B = X"80000000" then -- -0
            if op = '0' then
             aux <= A;
          elsif A(31) = '0' then
             aux <= '1' & A(30 downto 0);
          else
             aux <= '0' & A(30 downto 0);
          end if;
         elsif A = X"FF800000" then -- -Inf
             if B = X"FF800000" then -- -Inf
                if op = '0' then
                    aux <= X"FF800000";
                else
                    aux <= X"00000000";
                end if;
             else 
                aux <= A;
             end if;
         elsif A = X"FF800000" then -- -Inf
             if B = X"7F800000" then -- Inf
                if op = '0' then
                    aux <= X"00000000";
                else 
                    aux <= X"FF800000";
                end if;
             else 
                 aux <= A;
             end if;
         elsif B = X"7F800000" then -- Inf
             if A = X"FF800000" then -- -Inf
                if op = '0' then
                 aux <= X"00000000";
                else 
                 aux <= X"FF800000";
                end if;
             else 
                 aux <= B;
             end if;
         elsif B = X"7F800000" then -- Inf
             if A = X"7F800000" then -- Inf
                if op = '0' then
                    aux <= X"7F800000";
                else 
                     aux <= X"00000000";
                end if;
             else 
                 aux <= B;
             end if;
         elsif A(31 downto 23) = "111111111" then -- NaN
             aux <= X"FF800000";
         elsif B(31 downto 23) = "111111111" then 
             aux <= X"FF800000";
         elsif A(31 downto 23) = "011111111" then 
             aux <= X"FF800000";
         elsif B(31 downto 23) = "011111111" then 
             aux <= X"FF800000";
         else 
             aux <= X"00000001"; 
         end if;
 end process;
 
 enable <= '1' when aux = X"00000001" else '0';
 Result <= aux;

end Behavioral;
