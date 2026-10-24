----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:23 03/22/2021 
-- Design Name: 
-- Module Name:    Enable_Register - Behavioral 
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

entity Enable_Register is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           En : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end Enable_Register;

architecture Behavioral of Enable_Register is

begin
	process (Reset, Clk)
	begin
		if Reset = '1' then
			Q <= "0000000000000000";
		elsif Clk'event and Clk = '1' then
			if En = '1' then
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

