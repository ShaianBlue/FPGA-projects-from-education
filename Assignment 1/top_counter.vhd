----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:41 02/10/2021 
-- Design Name: 
-- Module Name:    top_counter - Behavioral 
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

entity top_counter is
    Port ( BTN0 : in  STD_LOGIC;
           CLK50 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : inout  STD_LOGIC_VECTOR (7 downto 0));
end top_counter;

architecture Behavioral of top_counter is
signal IntCLK: std_logic;

component counter is
    Port ( 
       DIR: in STD_LOGIC;
       CLK: in STD_LOGIC;
       RESET: in STD_LOGIC;
       CE, LOAD: in STD_LOGIC;
       DIN: in STD_LOGIC_VECTOR(7 downto 0);
       COUNT: inout STD_LOGIC_VECTOR(7 downto 0)
	 );
end component counter;

component DivClk is
    port ( Reset: in STD_LOGIC;   -- Global Reset
           Clk: in STD_LOGIC;     -- Master Clock
           TimeP: in integer;     -- Time periode of the divided clock
           Clk1: out STD_LOGIC);  -- Divided clock1 (Freq_Clk1 = Freq_Clk / TimeP)
end component DivClk;

begin
	U1: DivCLK PORT MAP(Reset => BTN0, CLK => CLK50, TimeP => 50, CLK1 => IntCLK );
	U2: counter PORT MAP(RESET => BTN0, CLK => IntCLK, CE => BTN1, DIR => BTN2, LOAD => BTN3, DIN => SW, COUNT => LED );

end Behavioral;

