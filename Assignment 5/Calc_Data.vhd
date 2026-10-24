----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:13 04/07/2021 
-- Design Name: 
-- Module Name:    Calc_Data - Behavioral 
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

entity Calc_Data is

    Port ( Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           Done  : out  STD_LOGIC;
           OpCode  : in  STD_LOGIC_VECTOR (2 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           CalcVal : out  STD_LOGIC_VECTOR (15 downto 0));
end Calc_Data;

architecture Behavioral of Calc_Data is

	signal AddDone : STD_LOGIC;
	signal SubDone : STD_LOGIC;
	signal MulDone : STD_LOGIC;
	signal DivDone : STD_LOGIC; 
	signal Add1Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Add2Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Sub1Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Sub2Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Mul1Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Mul2Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Div1Con : STD_LOGIC_VECTOR(7 downto 0);
	signal Div2Con : STD_LOGIC_VECTOR(7 downto 0);
	signal AddCalcVal : STD_LOGIC_VECTOR(7 downto 0);
	signal SubCalcVal : STD_LOGIC_VECTOR(7 downto 0);
	signal MulCalcVal : STD_LOGIC_VECTOR(15 downto 0);
	signal DivCalcVal : STD_LOGIC_VECTOR(15 downto 0);
	
component DeMux is
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
			
end component;

component ripple_carry_adder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
			  Start : in STD_LOGIC;
			  Done : out STD_LOGIC
			  );
end component;

component Ripple_Borrow_Subtractor is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           S : out  STD_LOGIC_VECTOR(7 downto 0);
			  Start :   in STD_LOGIC;
			  Done : out STD_LOGIC);
end component;

component MultiplySeq is
	Port ( Reset : in STD_LOGIC;
			Clk : in STD_LOGIC;
			Start : in STD_LOGIC;
			A : in STD_LOGIC_VECTOR (7 downto 0);
			B : in STD_LOGIC_VECTOR (7 downto 0);
			Done : out STD_LOGIC;
			C : out STD_LOGIC_VECTOR (15 downto 0));
end component;

	component Divider is
    Port ( Dividend :in std_logic_vector(7 downto 0);   --In1
           Divisor : in std_logic_vector(7 downto 0);   --In2
           Start :   in std_logic;
           Clk :     in std_logic;
			  CalcVal : out std_logic_vector(15 downto 0); -- (Q=CalcVal, CalcVal(7 downto 0)=Whole, CalcVal(15 downto 8)
           Done :    out std_logic);
end component; 


begin

--Portmap DeMux
demux_comp: DeMux port map (In1 => In1, In2 => In2, OpCode => OpCode, Add1 => Add1Con, Add2 => Add2Con, Sub1 => Sub1Con, Sub2 => Sub2Con, Mul1 => Mul1Con, Mul2 => Mul2Con, Div1 => Div1Con, Div2 => Div2Con);

--Portmap Ripple_Carry_Adder
add_comp: ripple_carry_adder port map (A => Add1Con, B => Add2Con, S => AddCalcVal, Start => Start, Done => AddDone); 

--Portmap Ripple_borrow_Subtractor
sub_comp: Ripple_Borrow_Subtractor port map (A => Sub1Con, B => Sub2Con, S => SubCalcVal, Done => SubDone, Start => Start); 

--Portmap MultiplySeq
mul_comp: MultiplySeq port map (A => Mul1Con, B => Mul2Con, C => MulCalcVal, Done => MulDone, Reset => Reset, Clk => Clk, Start => Start);
 
-- Portmap Divider
div_comp: Divider port map (Dividend => Div1Con, Divisor => Div2Con, Clk => Clk, Start => Start, CalcVal => DivCalcVal, Done => DivDone);

process (OpCode, AddDone, AddCalcVal, SubDone, SubCalcVal, MulDone, MulCalcVal, DivDone, DivCalcVal)
begin 


			Done <= '0';
			CalcVal <= "0000000000000000";
			case OpCode is
			when "001" =>
			Done <= AddDone;
			CalcVal(15 downto 8) <= "00000000";
			CalcVal(7 downto 0) <= AddCalcVal;
			when "010" =>
			Done <= SubDone;
			CalcVal(15 downto 8) <= "00000000";
			CalcVal(7 downto 0) <= SubCalcVal;
			when "011" => 
			Done <= MulDone;
			CalcVal <= MulCalcVal;
			when "100" => 
			Done <= DivDone;
			CalcVal(15 downto 8) <= "00000000";
			CalcVal(7 downto 0) <= DivCalcVal(7 downto 0);
			when others =>
			Done <= '0';
			CalcVal <= "0000000000000000";

			end Case; 
End Process;

end Behavioral;

