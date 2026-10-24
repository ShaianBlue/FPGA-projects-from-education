----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:10 03/15/2021 
-- Design Name: 
-- Module Name:    Full_Subtractor - Behavioral 
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

entity Full_Subtractor is
    Port ( input1  : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           borrowin : in  STD_LOGIC;
           output : out  STD_LOGIC;
           borrowout : out  STD_LOGIC;
			  count_done : out STD_LOGIC);
end Full_Subtractor;

architecture Behavioral of Full_Subtractor is

begin

		process(input1, input2, borrowin)
			begin
				count_done <= '0';
				  if input1 = '0' and input2 = '0' and borrowin = '0' then 
						output <= '0'; borrowout <= '0'; count_done <= '1';
				  elsif input1 = '0' and input2 = '0' and borrowin = '1' then
						output <= '1'; borrowout <= '1'; count_done <= '1';
				  elsif input1 = '0' and input2 = '1' and borrowin = '0' then
						output <= '1'; borrowout <= '1'; count_done <= '1';
				  elsif input1 = '0' and input2 = '1' and borrowin = '1' then
						output <= '0'; borrowout <= '1'; count_done <= '1';
				  elsif input1 = '1' and input2 = '0' and borrowin = '0' then
						output <= '1'; borrowout <= '0'; count_done <= '1';
				  elsif input1 = '1' and input2 = '0' and borrowin = '1' then
						output <= '0'; borrowout <= '0'; count_done <= '1';
				  elsif input1 = '1' and input2 = '1' and borrowin = '0' then
						output <= '0'; borrowout <= '0'; count_done <= '1';
				  elsif input1 = '1' and input2 = '1' and borrowin = '1' then
						output <= '1'; borrowout <= '1'; count_done <= '1';
				  else output <='-'; borrowout <= '-';
				 end if;
				  
			end process;
			
end Behavioral;

