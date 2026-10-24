----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2022 10:39:14 AM
-- Design Name: 
-- Module Name: zero_filler - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity zero_filler is
  Port ( 
  IR: in STD_LOGIC_VECTOR(15 downto 0);
  ZeroFilled_8: out STD_LOGIC_VECTOR(7 downto 0));
end zero_filler;

architecture Behavioral of zero_filler is
signal zero: STD_LOGIC_VECTOR(4 downto 0);
begin
zero<="00000";
ZeroFilled_8<=zero&IR(2)&IR(1)&IR(0);

end Behavioral;
