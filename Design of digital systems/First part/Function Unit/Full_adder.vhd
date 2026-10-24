----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 10:03:53 AM
-- Design Name: 
-- Module Name: Full_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout0 : out STD_LOGIC;
           Y0 : out STD_LOGIC);
end Full_adder;

architecture Behavioral of Full_adder is
component half_ad is
Port (A,B : in STD_LOGIC;
    c,Y: out STD_LOGIC);
    end component;
 signal Cout1, Cout2, Y1, z: std_logic;
begin
u1: Half_ad port map (A=>A,B=>B,Y=>Y1,C=>Cout1 );
u2: Half_ad port map (A=>Y1, B=>Cin,Y=>Y0,C=>Cout2);
Cout0<=Cout1 or Cout2;
end Behavioral;
