----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:38 04/01/2021 
-- Design Name: 
-- Module Name:    Calc_Menu - Behavioral 
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

entity Calc_Menu is
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
end Calc_Menu;

architecture Behavioral of Calc_Menu is

signal InACon : STD_LOGIC;
signal InBCon : STD_LOGIC;
signal InCCon : STD_LOGIC;
signal OpACon : STD_LOGIC;
signal OpBCon : STD_LOGIC;
signal ResAogBCon : STD_LOGIC;
signal ResCon : STD_LOGIC;
signal InSelCon : STD_LOGIC;
signal DispSelCon : STD_LOGIC_VECTOR (2 downto 0);

component CalcState is
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
end component CalcState;

component DispSet is
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
end component DispSet;

begin

	Tilstandsmaskine: CalcState Port Map(
			  Reset => Reset,
           Clk => Clk,
           Enter => Enter,
           Beregn => Beregn,
           Func => Func,
           DataIn => DataIn(2 downto 0),
           Done => Done,
           Tilstand => Tilstand,
           Start => Start,
			  DispSel => DispSelCon,
			  InSel => InSelCon,
			  InAEn => InACon,
			  InBEn => InBCon,
			  InCEn => InCCon,
			  OpAEn => OpACon,
			  OpBEn => OpBCon,
			  ResAogBEn => ResAogBCon,
			  ResEn => ResCon);
		
	Output_Register: DispSet Port Map(
			  Reset => Reset,
			  Clk => Clk,
			  InAEn => InACon,
			  InBEn => InBCon,
			  InCEn => InCCon,
			  OpAEn => OpACon,
			  OpBEn => OpBCon,
			  ResAogBEn => ResAogBCon,
			  ResEn => ResCon,
           DataIn => DataIn,
			  CalcVal => CalcVal,
			  DispSel => DispSelCon,
			  InSel => InSelCon,
           DispData => DispData,
			  In1 => In1,
			  In2 => In2,
			  OpCode => OpCode);

end Behavioral;
