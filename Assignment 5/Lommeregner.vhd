----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:26 04/19/2021 
-- Design Name: 
-- Module Name:    Lommeregner - Behavioral 
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

entity Lommeregner is
    Port ( BTN0 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           MClk : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           An : out  STD_LOGIC_VECTOR (3 downto 0);
           Cat : out  STD_LOGIC_VECTOR (6 downto 0);
           LED : out  STD_LOGIC_VECTOR (7 downto 0));
end Lommeregner;

architecture Behavioral of Lommeregner is

signal DispClkCon : STD_LOGIC;
signal BTN2dCon : STD_LOGIC;
signal BTN1dCon : STD_LOGIC;
signal StartCon : STD_LOGIC;
signal DoneCon : STD_LOGIC;
signal OpCodeCon : STD_LOGIC_VECTOR(2 downto 0);
signal In1Con : STD_LOGIC_VECTOR(7 downto 0);
signal In2Con : STD_LOGIC_VECTOR(7 downto 0);
signal CalcValCon : STD_LOGIC_VECTOR(15 downto 0);
signal DispDataCon : STD_LOGIC_VECTOR(15 downto 0);

component Calc_Menu is
	 Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Enter : in  STD_LOGIC;
           Beregn : in  STD_LOGIC;
           Func : in  STD_LOGIC;
           Done : in  STD_LOGIC;
           DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           CalcVal : in  STD_LOGIC_VECTOR (15 downto 0);
           Start : out  STD_LOGIC;
           OpCode : out  STD_LOGIC_VECTOR (2 downto 0);
           In1 : out  STD_LOGIC_VECTOR (7 downto 0);
           In2 : out  STD_LOGIC_VECTOR (7 downto 0);
           DispData : out  STD_LOGIC_VECTOR (15 downto 0);
           Tilstand : out  STD_LOGIC_VECTOR (7 downto 0));
end component Calc_Menu;

component Calc_Data is
	 Port ( Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           Done  : out  STD_LOGIC;
           OpCode  : in  STD_LOGIC_VECTOR (2 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           CalcVal : out  STD_LOGIC_VECTOR (15 downto 0));
end component Calc_Data;

component Debounce is
	 Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           BTNd : out  STD_LOGIC);
end component Debounce;

component DivClk is
	 Port ( Reset: in STD_LOGIC;
           Clk: in STD_LOGIC;
           TimeP: in integer;
           Clk1: out STD_LOGIC);
end component DivClk;

component SevenSeg4 is
	 Port ( Rst,Clk: in  std_logic;    
	        Data :   in  std_logic_vector (15 downto 0);
           cat :    out std_logic_vector(6 downto 0);
           an :     out std_logic_vector(3 downto 0));
end component SevenSeg4;

begin

	U1: DivClk Port Map(
			 Reset => BTN3,
          Clk => MClk,
          TimeP => 50e3,
          Clk1 => DispClkCon);

	U2: SevenSeg4 Port Map(
			 Rst => BTN3,
			 Clk => DispClkCon,
	       Data => DispDataCon,
          cat => Cat,
          an  => An);

	U3: Debounce Port Map(
			 Reset => BTN3,
          Clk  => MClk,
          BTN  => BTN2,
          BTNd  => BTN2dCon);

	U4: Debounce Port Map(
			 Reset => BTN3,
          Clk  => MClk,
          BTN  => BTN1,
          BTNd  => BTN1dCon);

	U5: Calc_Menu Port Map(
			 Reset => BTN3,
          Clk => MClk,
          Enter => BTN0,
          Beregn => BTN2dCon,
          Func => BTN1dCon,
          Done => DoneCon,
          DataIn => SW,
          CalcVal => CalcValCon,
          Start => StartCon,
          OpCode => OpCodeCon,
          In1 => In1Con,
          In2 => In2Con,
          DispData => DispDataCon,
          Tilstand => LED);

	U6: Calc_Data Port Map(
			 Reset => BTN3,
          Clk => MClk,
          Start => StartCon,
          OpCode => OpCodeCon,
          In1 => In1Con,
          In2 => In2Con,
			 Done => DoneCon,
			 CalcVal => CalcValCon);

end Behavioral;

