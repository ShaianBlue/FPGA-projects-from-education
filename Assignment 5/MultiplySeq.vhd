----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:14 02/25/2021 
-- Design Name: 
-- Module Name:    MultiplySeq - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplySeq is
	Port ( Reset : in STD_LOGIC;
			Clk : in STD_LOGIC;
			Start : in STD_LOGIC;
			A : in STD_LOGIC_VECTOR (7 downto 0);
			B : in STD_LOGIC_VECTOR (7 downto 0);
			Done : out STD_LOGIC;
			C : out STD_LOGIC_VECTOR (15 downto 0));
end MultiplySeq;

architecture Behavioral of MultiplySeq is
	signal Adum, Res, nextRes: STD_LOGIC_VECTOR(15 downto 0);
	signal index: integer range 0 to 8;
begin

	AdumRes: process(Reset, Clk)
	begin
		if Reset = '1' then
			Adum <= x"0000";
		elsif Clk'event and Clk = '1' then
			if start = '1' then
				Adum <= X"00" & A;
			else
				Adum <= Adum(14 downto 0) & '0';
			end if;
		end if;
	end process;

	IndexReg: process(Reset, Clk, Start)
	begin
		if Reset = '1' then
			index <= 0;
		elsif Clk'event and Clk = '1' then
			if Start = '1' then
				index <= 0;
			elsif index < 8 then
				index <= index + 1;
			end if;
		end if;
	end process;

	ResReg: process(Reset, CLK)
	begin
		if Reset = '1' then
			Res <= "0000000000000000";
		elsif CLK'event and CLK = '1' then
			if Start = '1' then
				Res <= "0000000000000000";
			else
				Res <= nextRes;
			end if;
		end if;
	end process;	

	ResDec: process(B, Adum, Res, index)
	begin
		Done <= '0';
		nextRes <= Res;
		if Index < 8 then
			if B(index) = '1' then
				nextRes <= Res + Adum;
				end if;
		else
			Done <= '1';
		end if;
	end process;

	C <= Res;

end Behavioral;
