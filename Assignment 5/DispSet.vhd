----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:58 03/22/2021 
-- Design Name: 
-- Module Name:    DispSet - Behavioral 
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

entity DispSet is
    Port ( Reset : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  InAEn : in STD_LOGIC;
			  InBEn : in STD_LOGIC;
			  InCEn : in STD_LOGIC;
			  OpAEn : in STD_LOGIC;
			  OpBEn : in STD_LOGIC;
			  ResAogBEn : in STD_LOGIC;
			  ResEn : in STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
			  CalcVal : in  STD_LOGIC_VECTOR (15 downto 0);
			  DispSel : in STD_LOGIC_VECTOR (2 downto 0);
			  InSel : in STD_LOGIC;
           DispData : out  STD_LOGIC_VECTOR (15 downto 0);
			  In1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  In2 : out  STD_LOGIC_VECTOR (7 downto 0);
			  OpCode : out  STD_LOGIC_VECTOR (2 downto 0));
end DispSet;

architecture Behavioral of DispSet is

signal InADisp : STD_LOGIC_VECTOR (15 downto 0);
signal InBDisp : STD_LOGIC_VECTOR (15 downto 0);
signal InCDisp : STD_LOGIC_VECTOR (15 downto 0);
signal OpADisp : STD_LOGIC_VECTOR (15 downto 0);
signal OpBDisp : STD_LOGIC_VECTOR (15 downto 0);
signal ResAogBDisp : STD_LOGIC_VECTOR (15 downto 0);
signal ResDisp : STD_LOGIC_VECTOR (15 downto 0);

component Enable_Register is
	Port (	Reset : in  STD_LOGIC;
				Clk : in  STD_LOGIC;
				En : in  STD_LOGIC;
				D : in  STD_LOGIC_VECTOR (15 downto 0);
				Q : out  STD_LOGIC_VECTOR (15 downto 0));
end component Enable_Register;

begin

	InAReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => InAEn, D(7 downto 0) => DataIn, D(15 downto 8) => "00000000", Q => InADisp);
	InBReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => InBEn, D(7 downto 0) => DataIn, D(15 downto 8) => "00000000", Q => InBDisp);
	InCReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => InCEn, D(7 downto 0) => DataIn, D(15 downto 8) => "00000000", Q => InCDisp);
	OpAReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => OpAEn, D(2 downto 0) => DataIn(2 downto 0), D(15 downto 3) => "0000000000000", Q => OpADisp);
	OpBReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => OpBEn, D(2 downto 0) => DataIn(2 downto 0), D(15 downto 3) => "0000000000000", Q => OpBDisp);
	ResAogBReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => ResAogBEn, D => CalcVal, Q => ResAogBDisp);
	ResReg: Enable_Register Port Map(Reset => Reset, Clk => Clk, En => ResEn, D => CalcVal, Q => ResDisp);

	DispMux: process (DispSel, InADisp, InBDisp, InCDisp, OpADisp, OpBDisp, ResAogBDisp, ResDisp)
	begin
		case DispSel is
			when "001" =>
				DispData <= InADisp;
			when "010" =>
				DispData <= OpADisp;
			when "011" =>
				DispData <= InBDisp;
			when "100" =>
				DispData <= ResAogBDisp;
			when "101" =>
				DispData <= OpBDisp;
			when "110" =>
				DispData <= InCDisp;
			when "111" =>
				DispData <= ResDisp;
			when others =>
				DispData <= "0000000000000000";
		end case;
	end process;
	
	In1Mux: process (InSel, InADisp, ResAogBDisp)
	begin
		case InSel is
			when '0' =>
				In1 <= InADisp(7 downto 0);
			when '1' =>
				In1 <= ResAogBDisp(7 downto 0);
			when others =>
				In1 <= "00000000";
		end case;
	end process;
		
	In2Mux: process (InSel, InBDisp, InCDisp)
	begin
		case InSel is
			when '0' =>
				In2 <= InBDisp(7 downto 0);
			when '1' =>
				In2 <= InCDisp(7 downto 0);
			when others =>
				In2 <= "00000000";
		end case;
	end process;
		
	OpCodeMux: process (InSel, OpADisp, OpBDisp)
	begin
		case InSel is
			when '0' =>
				OpCode <= OpADisp(2 downto 0);
			when '1' =>
				OpCode <= OpBDisp(2 downto 0);
			when others =>
				OpCode <= "000";
		end case;
	end process;
	
end Behavioral;