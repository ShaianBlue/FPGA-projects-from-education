----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:21 02/25/2021 
-- Design Name: 
-- Module Name:    ripple_carry_adder - Behavioral 
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

entity ripple_carry_adder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
			  Start : in STD_LOGIC;
			  Done : out STD_LOGIC
			  );
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is

component Full_Adder is
    Port ( input1 : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           carryin : in  STD_LOGIC;
			  count_done : out STD_LOGIC;
           output : out  STD_LOGIC;
           carryout : out  STD_LOGIC
			);
end component Full_Adder;

signal Count : STD_LOGIC_VECTOR (7 downto 0);
signal C : STD_LOGIC_VECTOR (7 downto 0);

begin
	U1: Full_Adder PORT MAP(input1 => A(0), input2 => B(0), carryin => '0', output => S(0), carryout => C(0), count_done => Count(0));
	U2: Full_Adder PORT MAP(input1 => A(1), input2 => B(1), carryin => C(0), output => S(1), carryout => C(1), count_done => Count(1));
	U3: Full_Adder PORT MAP(input1 => A(2), input2 => B(2), carryin => C(1), output => S(2), carryout => C(2), count_done => Count(2));
	U4: Full_Adder PORT MAP(input1 => A(3), input2 => B(3), carryin => C(2), output => S(3), carryout => C(3), count_done => Count(3));
	U5: Full_Adder PORT MAP(input1 => A(4), input2 => B(4), carryin => C(3), output => S(4), carryout => C(4), count_done => Count(4));
	U6: Full_Adder PORT MAP(input1 => A(5), input2 => B(5), carryin => C(4), output => S(5), carryout => C(5), count_done => Count(5));
	U7: Full_Adder PORT MAP(input1 => A(6), input2 => B(6), carryin => C(5), output => S(6), carryout => C(6), count_done => Count(6));
	U8: Full_Adder PORT MAP(input1 => A(7), input2 => B(7), carryin => C(6), output => S(7), carryout => C(7), count_done => Count(7));
	
		
	-- Done
	process (Start, Count)
		begin
		
	Done <= '0';
		
		if Start = '0' then
			if Count = "11111111" then
				Done <= '1';
			end if;
		end if;
	end process;
	
end Behavioral;

