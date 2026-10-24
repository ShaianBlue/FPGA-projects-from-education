----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:19 04/07/2021 
-- Design Name: 
-- Module Name:    DeMux - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DeMux is
	Port ( In1 : in STD_LOGIC_VECTOR (7 downto 0);
			In2 : in STD_LOGIC_VECTOR (7 downto 0);
			OpCode : in STD_LOGIC_VECTOR (2 downto 0);
			Add1 : out STD_LOGIC_VECTOR (7 downto 0);
			Add2 : out STD_LOGIC_VECTOR (7 downto 0);
			Sub1 : out STD_LOGIC_VECTOR (7 downto 0);
			Sub2 : out STD_LOGIC_VECTOR (7 downto 0);
			Mul1 : out STD_LOGIC_VECTOR (7 downto 0);
			Mul2 : out STD_LOGIC_VECTOR (7 downto 0);
			Div1 : out STD_LOGIC_VECTOR (7 downto 0);
			Div2 : out STD_LOGIC_VECTOR (7 downto 0));
			
end DeMux;

architecture Behavioral of DeMux is	
begin
	process (In1, In2, Opcode) 
		begin
			
			Add1 <= "00000000";
			Add2 <= "00000000";
			Sub1 <= "00000000";
			Sub2 <= "00000000";
			Mul1 <= "00000000";
			Mul2 <= "00000000";
			Div1 <= "00000000";
			Div2 <= "00000000";
			case OpCode is
			when "001" =>
			Add1 <= In1;
			Add2 <= In2;
			when "010" =>
			Sub1 <= In1;
			Sub2 <= In2;
			when "011" => 
			Mul1 <= In1;
			Mul2 <= In2;
			when "100" => 
			Div1 <= In1;
			Div2 <= In2;
			when others =>
			Add1 <= "00000000";
			Add2 <= "00000000";
			Sub1 <= "00000000";
			Sub2 <= "00000000";
			Mul1 <= "00000000";
			Mul2 <= "00000000";
			Div1 <= "00000000";
			Div2 <= "00000000";
			
		end case; 
	end process;
end Behavioral;


