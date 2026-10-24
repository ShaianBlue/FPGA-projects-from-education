----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:10 02/24/2021 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

entity Full_Adder is
    Port ( input1 : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           carryin : in  STD_LOGIC;
           output : out  STD_LOGIC;
           carryout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

	process(input1, input2, carryin)
	begin
	if input1 = '0' and input2 = '0' and carryin = '0' then
		output <= '0'; carryout <= '0';
	elsif input1 = '0' and input2 = '0' and carryin = '1' then
		output <= '1'; carryout <= '0';
	elsif input1 = '0' and input2 = '1' and carryin = '0' then
		output <= '1'; carryout <= '0';
	elsif input1 = '0' and input2 = '1' and carryin = '1' then
		output <= '0'; carryout <= '1';
	elsif input1 = '1' and input2 = '0' and carryin = '0' then
		output <= '1'; carryout <= '0';
	elsif input1 = '1' and input2 = '0' and carryin = '1' then
		output <= '0'; carryout <= '1';
	elsif input1 = '1' and input2 = '1' and carryin = '0' then
		output <= '0'; carryout <= '1';
	elsif input1 = '1' and input2 = '1' and carryin = '1' then
		output <= '1'; carryout <= '1';
	else
		output <= '-'; carryout <= '-';
	end if;
	end process;

end Behavioral;

