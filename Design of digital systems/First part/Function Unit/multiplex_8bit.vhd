----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 10:51:43 AM
-- Design Name: 
-- Module Name: multiplex_8bit - Behavioral
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

entity multiplex_8bit is
  Port ( S0,S1 : in STD_LOGIC;
        B : in STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0));
end multiplex_8bit;

architecture Behavioral of multiplex_8bit is
component multiplexer2_1 is
    Port(B,S0,S1 : in STD_LOGIC;
        Y :out STD_LOGIC);
        end component;
begin
U1: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(0),Y=>Y(0));
U2: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(1),Y=>Y(1));
U3: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(2),Y=>Y(2));
U4: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(3),Y=>Y(3));
U5: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(4),Y=>Y(4));
U6: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(5),Y=>Y(5));
U7: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(6),Y=>Y(6));
U8: multiplexer2_1 port map(S0=>S0,S1=>S1,B=>B(7),Y=>Y(7));

end Behavioral;
