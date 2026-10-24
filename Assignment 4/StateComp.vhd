----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:09 03/01/2021 
-- Design Name: 
-- Module Name:    StateComp - Behavioral 
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

entity StateComp is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Func : in  STD_LOGIC;
           Enter : in  STD_LOGIC;
           Play : in  STD_LOGIC;
           Done : in  STD_LOGIC;
           Start : out  STD_LOGIC;
           DispSel : out  STD_LOGIC_VECTOR (1 downto 0);
           BetEn : out  STD_LOGIC;
           SatsEn : out  STD_LOGIC;
           PointEn : out  STD_LOGIC);
end StateComp;

architecture Behavioral of StateComp is

type Statetype is (BetE, BetS, SatsE, SatsS, StartS, PlayS, CalcS, PointS);
signal State, NextState: Statetype;

begin

	StateDec: process(State, Func, Enter, Play, Done)
		begin
		Start <= '0';
		DispSel <= "00";
		BetEn <= '0';
		SatsEn <= '0';
		PointEn <= '0';
		case State is
			when BetE =>
				DispSel <= "01";
				BetEn <= '1';
				NextState <= BetS;
			when BetS =>
				DispSel <= "01";
				if Play = '1' then
					NextState <= StartS;
				elsif Func = '1' then
					NextState <= SatsS;
				elsif Enter = '1' then
					NextState <= BetE;
				else
					NextState <= BetS;
				end if;
			when SatsS =>
				DispSel <= "10";
				if Func = '1' then
					NextState <= PointS;
				elsif Enter = '1' then
					NextState <= SatsE;
				elsif Play = '1' then
					NextState <= StartS;
				else
					NextState <= SatsS;
				end if;
			when SatsE =>
				DispSel <= "10";
				SatsEn <= '1';
				NextState <= SatsS;
			when StartS =>
				Start <= '1';
				NextState <= PlayS;
			when PlayS =>
				if Done = '1' then
					NextState <= CalcS;
				else
					NextState <= PlayS;
				end if;
			when CalcS =>
				PointEn <= '1';
				NextState <= PointS;
			when PointS =>
				DispSel <= "11";
				if Func = '1' then
					NextState <= BetS;
				elsif Play = '1' then
					NextState <= StartS;
				else
					NextState <= PointS;
				end if;
		end case;
	end process;

	StateReg: process(Reset, Clk) is
		begin
		if Reset = '1' then
			State <= BetS;
		elsif Clk'event and Clk = '1' then
			State <= NextState;
		end if;
	end process;

end Behavioral;

