----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:16 01/22/2013 
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
           Clk50 : in  STD_LOGIC;
           BTN1 : in  STD_LOGIC;
           BTN2 : in  STD_LOGIC;
           BTN3 : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : inout  STD_LOGIC_VECTOR (7 downto 0);
			  Cathode : out STD_LOGIC_VECTOR (7 downto 0);
			  Anode : out STD_LOGIC_VECTOR (3 downto 0));
end top_counter;

architecture Behavioral of top_counter is
signal IntClk: std_logic;
signal LEDlsb : STD_LOGIC_VECTOR(3 downto 0);

component counter is
    Port (
       CLK: in STD_LOGIC;
       RESET: in STD_LOGIC;
       CE, LOAD: in STD_LOGIC;
       DIR: in STD_LOGIC;
       DIN: in STD_LOGIC_VECTOR(7 downto 0);
       COUNT: inout STD_LOGIC_VECTOR(7 downto 0)
       );
end component counter;

component DivClk is
    port ( 
       Reset: in STD_LOGIC;     -- Global Reset (BTN1)
       Clk: in STD_LOGIC;     -- Master Clock (50 MHz)
       TimeP: in integer;     -- Time periode of the divided clock (50e6)
       Clk1: out STD_LOGIC);   -- Divided clock1 (1 Hz)
end component DivClk;

component SevenSeg is
    port (
       Data: in STD_LOGIC_VECTOR(3 downto 0);
		 Cat: out STD_LOGIC_VECTOR(7 downto 0);
		 An: out STD_LOGIC_VECTOR(3 downto 0)
		 );
end component SevenSeg;

begin

U4: LEDlsb <= LED(3 downto 0); -- least significant nibble 
U3: sevenseg PORT MAP(Data => LEDlsb, Cat => Cathode, An => Anode);
U1: divclk PORT MAP(Reset => BTN0, Clk => Clk50, TimeP => 50, Clk1 => IntClk );
U2: counter PORT MAP(Reset => BTN0, Clk => IntClk, CE => BTN1, Dir => BTN2, Load => BTN3, Din => SW, Count => LED);

end Behavioral;

