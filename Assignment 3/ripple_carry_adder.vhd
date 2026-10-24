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
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : inout  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is

component Full_Adder is
    Port ( input1 : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           carryin : in  STD_LOGIC;
           output : out  STD_LOGIC;
           carryout : out  STD_LOGIC
       );
end component Full_Adder;

begin
	U1: Full_Adder PORT MAP(input1 => A(0), input2 => B(0), carryin => '0', output => S(0), carryout => C(0));
	U2: Full_Adder PORT MAP(input1 => A(1), input2 => B(1), carryin => C(0), output => S(1), carryout => C(1));
	U3: Full_Adder PORT MAP(input1 => A(2), input2 => B(2), carryin => C(1), output => S(2), carryout => C(2));
	U4: Full_Adder PORT MAP(input1 => A(3), input2 => B(3), carryin => C(2), output => S(3), carryout => C(3));
end Behavioral;

