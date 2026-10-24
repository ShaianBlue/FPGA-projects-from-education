----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:25 03/15/2021 
-- Design Name: 
-- Module Name:    Ripple_Borrow_Subtractor - Behavioral 
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

entity Ripple_Borrow_Subtractor is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           S : out  STD_LOGIC_VECTOR(7 downto 0);
			  Start :   in STD_LOGIC;
			  Done : out STD_LOGIC);
end Ripple_Borrow_Subtractor;

architecture Behavioral of Ripple_Borrow_Subtractor is

component Full_Subtractor is
    Port ( input1 : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           borrowin : in  STD_LOGIC;
           output : out  STD_LOGIC;
           borrowout : out  STD_LOGIC;
			  count_done : out STD_LOGIC
			);
end component Full_Subtractor;

signal Count : STD_LOGIC_VECTOR (7 downto 0);
signal C : STD_LOGIC_VECTOR (7 downto 0); 

begin

	U1: Full_Subtractor PORT MAP(input1 => A(0), input2 => B(0), borrowin => '0', output => S(0), borrowout => C(0), count_done => count(0));
	U2: Full_Subtractor PORT MAP(input1 => A(1), input2 => B(1), borrowin => C(0), output => S(1), borrowout => C(1), count_done => count(1));
	U3: Full_Subtractor PORT MAP(input1 => A(2), input2 => B(2), borrowin => C(1), output => S(2), borrowout => C(2), count_done => count(2));
	U4: Full_Subtractor PORT MAP(input1 => A(3), input2 => B(3), borrowin => C(2), output => S(3), borrowout => C(3), count_done => count(3));
	U5: Full_Subtractor PORT MAP(input1 => A(4), input2 => B(4), borrowin => C(3), output => S(4), borrowout => C(4), count_done => count(4));
	U6: Full_Subtractor PORT MAP(input1 => A(5), input2 => B(5), borrowin => C(4), output => S(5), borrowout => C(5), count_done => count(5));
	U7: Full_Subtractor PORT MAP(input1 => A(6), input2 => B(6), borrowin => C(5), output => S(6), borrowout => C(6), count_done => count(6));
	U8: Full_Subtractor PORT MAP(input1 => A(7), input2 => B(7), borrowin => C(6), output => S(7), borrowout => C(7), count_done => count(7));
	
	-- Done
	process(Start, Count)
		begin
		
		Done <= '0';
		
		if Start = '0' then
			if Count = "11111111" then
				Done <= '1';
			end if;
		end if;
	end process;
	
end Behavioral;

