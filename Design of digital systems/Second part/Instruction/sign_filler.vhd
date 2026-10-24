----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2022 10:52:02 AM
-- Design Name: 
-- Module Name: sign_filler - Behavioral
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

entity sign_filler is
  Port (    IR: in STD_LOGIC_VECTOR(15 downto 0);
            Extended_8: out STD_LOGIC_VECTOR(7 downto 0));
end sign_filler;

architecture Behavioral of sign_filler is

component multiplex_normal_function8bit
 Port ( 
in0,in1 : in STD_LOGIC_VECTOR(7 downto 0);
J_select3 : in STD_LOGIC;
Y: out STD_LOGIC_VECTOR(7 downto 0));
end component;


signal zeroExtended_8: STD_LOGIC_VECTOR(7 downto 0);
signal oneExtended_8: STD_LOGIC_VECTOR(7 downto 0);
begin
zeroExtended_8<="000"&IR(7)&IR(6)&IR(2)&IR(1)&IR(0);
oneExtended_8<="111"&IR(7)&IR(6)&IR(2)&IR(1)&IR(0);
S1: multiplex_normal_function8bit port map(in0=>zeroExtended_8,in1=>oneExtended_8,J_select3=>IR(8),Y=>Extended_8);

end Behavioral;
