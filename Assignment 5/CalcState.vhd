----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:54 03/15/2021 
-- Design Name: 
-- Module Name:    CalcState - Behavioral 
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

entity CalcState is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Enter : in  STD_LOGIC;
           Beregn : in  STD_LOGIC;
           Func : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (2 downto 0);
           Done : in  STD_LOGIC;
           Tilstand : out  STD_LOGIC_VECTOR (7 downto 0);
           Start : out  STD_LOGIC;
			  DispSel : out STD_LOGIC_VECTOR (2 downto 0);
			  InSel : out STD_LOGIC;
			  InAEn : out STD_LOGIC;
			  InBEn : out STD_LOGIC;
			  InCEn : out STD_LOGIC;
			  OpAEn : out STD_LOGIC;
			  OpBEn : out STD_LOGIC;
			  ResAogBEn : out STD_LOGIC;
			  ResEn : out STD_LOGIC);
end CalcState;

architecture Behavioral of CalcState is

type Statetype is (InputA, InputB, InputC, OperationA, OperationB, StartSetAogB, StartSet, CalculateAogB, Calculate, ResultAogB, Result, EnableA, EnableB, EnableC, EnableOpA, EnableOpB);
signal State, NextState: Statetype;

begin
	
	StateReg: process(Reset, Clk)
		begin
		if Reset = '1' then
			State <= InputA;
		elsif Clk'event and Clk = '1' then
			State <= NextState;
		end if;
	end process;
	
	StateDec: process(State, Enter, Beregn, Func, Done, DataIn)
		begin
		Tilstand <= "00000000";
		Start <= '0';
		DispSel <= "000";
		InSel <= '0';
		InAEn <= '0';
		InBEn <= '0';
		InCEn <= '0';
		OpAEn <= '0';
		OpBEn <= '0';
		ResAogBEn <= '0';
		ResEn <= '0';
		NextState <= State;
		case State is
			when InputA =>
				Tilstand <= "00000001";
				DispSel <= "001";
				if Enter = '1' then
					NextState <= EnableA;
				elsif Func = '1' then
					NextState <= OperationA;
				else
					NextState <= InputA;
				end if;
			when InputB =>
				Tilstand <= "00000100";
				DispSel <= "011";
				if Enter = '1' then
					NextState <= EnableB;
				elsif Beregn = '1' then
					NextState <= StartSetAogB;
				else
					NextState <= InputB;
				end if;
			when InputC =>
				Tilstand <= "00100000";
				DispSel <= "110";
				InSel <= '1';
				if Enter = '1' then
					NextState <= EnableC;
				elsif Beregn = '1' then
					NextState <= StartSet;
				else
					NextState <= InputC;
				end if;
			when OperationA =>
				Tilstand <= "00000010";
				DispSel <= "010";
				if Enter = '1' and (DataIn(2 downto 0) = "001" or DataIn(2 downto 0) = "010" or DataIn(2 downto 0) = "011" or DataIn(2 downto 0) = "100") then
					Nextstate <= EnableOpA;
				elsif Func = '1' and (DataIn(2 downto 0) = "001" or DataIn(2 downto 0) = "010" or DataIn(2 downto 0) = "011" or DataIn(2 downto 0) = "100") then
					NextState <= InputB;
				else
					NextState <= OperationA;
				end if;
			when OperationB =>
				Tilstand <= "00010000";
				DispSel <= "101";
				InSel <= '1';
				if Enter = '1' and (DataIn(2 downto 0) = "001" or DataIn(2 downto 0) = "010" or DataIn(2 downto 0) = "011" or DataIn(2 downto 0) = "100") then
					NextState <= EnableOpB;
				elsif Func = '1' and (DataIn(2 downto 0) = "001" or DataIn(2 downto 0) = "010" or DataIn(2 downto 0) = "011" or DataIn(2 downto 0) = "100") then
					NextState <= InputC;
				else
					NextState <= OperationB;
				end if;
			when StartSetAogB =>
				Tilstand <= "00001000";
				Start <= '1';
				NextState <= CalculateAogB;
			when StartSet =>
				Tilstand <= "01000000";
				Start <= '1';
				InSel <= '1';
				NextState <= Calculate;
			when CalculateAogB =>
				Tilstand <= "00001000";
				if Done = '1' then
					NextState <= ResultAogB;
				else
					NextState <= CalculateAogB;
				end if;
			when Calculate =>
				Tilstand <= "01000000";
				InSel <= '1';
				if Done = '1' then
					NextState <= Result;
				else
					NextState <= Calculate;
				end if;
			when ResultAogB =>
				Tilstand <= "00001000";
				DispSel <= "100";
				ResAogBEn <= '1';
				if Func = '1' then
					NextState <= OperationB;
				else
					NextState <= ResultAogB;
				end if;
			when Result =>
				Tilstand <= "10000000";
				DispSel <= "111";
				ResEn <= '1';
				InSel <= '1';
				if Func = '1' then
					NextState <= InputA;
				else
					NextState <= Result;
				end if;
			when EnableA =>
				Tilstand <= "00000001";
				DispSel <= "001";
				InAEn <= '1';
				NextState <= InputA;
			when EnableB =>
				Tilstand <= "00000100";
				DispSel <= "011";
				InBEn <= '1';
				NextState <= InputB;
			when EnableC =>
				Tilstand <= "00100000";
				DispSel <= "110";
				InCEn <= '1';
				InSel <= '1';
				NextState <= InputC;
			when EnableOpA =>
				Tilstand <= "00000010";
				DispSel <= "010";
				OpAEn <= '1';
				NextState <= OperationA;
			when EnableOpB =>
				Tilstand <= "00010000";
				DispSel <= "101";
				OpBEn <= '1';
				InSel <= '1';
				NextState <= OperationB;
			when others =>
				Tilstand <= "00000000";
				Start <= '0';
				DispSel <= "000";
				InSel <= '0';
				InAEn <= '0';
				InBEn <= '0';
				InCEn <= '0';
				OpAEn <= '0';
				OpBEn <= '0';
				ResAogBEn <= '0';
				ResEn <= '0';
				NextState <= InputA;
			end case;
	end process;
		
end Behavioral;
