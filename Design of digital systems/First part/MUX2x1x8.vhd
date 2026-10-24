----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 09:59:53 AM
-- Design Name: 
-- Module Name: MUX2x1x8 - Behavioral
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

entity MUX2x1x8 is
    Port ( M : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           X : out STD_LOGIC_VECTOR (7 downto 0));
end MUX2x1x8;

architecture Behavioral of MUX2x1x8 is
signal MB : STD_LOGIC_VECTOR (7 downto 0);
begin
    MB <= M & M & M & M & M & M & M & M;
    X <= (NOT MB AND A) OR (MB AND B);
end Behavioral;
