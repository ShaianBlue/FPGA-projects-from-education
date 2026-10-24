----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:22 02/17/2021 
-- Design Name: 
-- Module Name:    SevenSeg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSeg is
    Port ( data : in  STD_LOGIC_VECTOR (3 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           cat : out  STD_LOGIC_VECTOR (7 downto 0));
end SevenSeg;

architecture Behavioral of SevenSeg is

begin
	an <= "1110";
	cat <= "00000011" when data = "0000" else --0
			 "10011111" when data = "0001" else --1
			 "00100101" when data = "0010" else --2
			 "00001101" when data = "0011" else --3
			 "10011001" when data = "0100" else --4
			 "01001001" when data = "0101" else --5
			 "01000001" when data = "0110" else --6
			 "00011111" when data = "0111" else --7
			 "00000001" when data = "1000" else --8
			 "00011001" when data = "1001" else --9
			 "00010000" when data = "1010" else --A
			 "00000000" when data = "1011" else --B
			 "01100010" when data = "1100" else --C
			 "00000010" when data = "1101" else --D
			 "01100000" when data = "1110" else --E
			 "01110000" when data = "1111" else --F
			 "11111110";
end Behavioral;

