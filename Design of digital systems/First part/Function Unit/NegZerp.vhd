

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity NegZerp is
 Port ( 
 MuxF: in STD_LOGIC_VECTOR(7 downto 0);
 N,Z: out STD_LOGIC);
end NegZerp;

architecture Behavioral of NegZerp is

begin
Z<='1' when (muxF="00000000") else '0';
N<=MuxF(7);
end Behavioral;
