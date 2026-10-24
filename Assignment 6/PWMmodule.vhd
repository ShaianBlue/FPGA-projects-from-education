----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:51 05/03/2021 
-- Design Name: 
-- Module Name:    PWMmodule - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWMmodule is
	 Generic( PWMinc : std_logic_vector(7 downto 0) := "00000001");
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           SigAmpl : in  STD_LOGIC_VECTOR (7 downto 0);
           PWMout : out  STD_LOGIC);
end PWMmodule;

architecture Behavioral of PWMmodule is

signal PWMcnt : std_logic_vector(7 downto 0);	

begin
		
	PWMcount: process(Reset, Clk)
	begin
		if Reset = '1' then
			PWMcnt <= "00000000";
		elsif Clk'event and Clk = '1' then
			PWMcnt <= PWMcnt + 1;
		end if;
	end process;
	
	PWMcompt: PWMout <= '1' when PWMcnt <= SigAmpl else '0';
	
end Behavioral;

