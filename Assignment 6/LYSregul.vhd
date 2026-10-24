----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:50 05/05/2021 
-- Design Name: 
-- Module Name:    LYSregul - Behavioral 
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

entity LYSregul is
    Port ( BTN3 : in  STD_LOGIC;
           MClk : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC);
end LYSregul;

architecture Behavioral of LYSregul is

signal ClkCon : std_logic;

component PWMmodule is
	Generic ( PWMinc : std_logic_vector(7 downto 0) := "00000001");
	Port (  Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           SigAmpl : in  STD_LOGIC_VECTOR (7 downto 0);
           PWMout : out  STD_LOGIC);
end component;

component DivClk is
	Port (  Reset: in STD_LOGIC;
           Clk: in STD_LOGIC;
           TimeP: in integer;
           Clk1: out STD_LOGIC);
end component;

begin
	
	U1: PWMmodule Port Map(Reset => BTN3, Clk => ClkCon, SigAmpl => SW, PWMout => LED);
	U2: DIvClk Port Map(Reset => BTN3, Clk => MClk, TimeP => 4, Clk1 => ClkCon);
	
end Behavioral;

