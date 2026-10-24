----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 10:37:14 AM
-- Design Name: 
-- Module Name: multiplexer2_1 - Behavioral
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



entity multiplexer2_1 is
  Port ( B,S0,S1 : in STD_LOGIC;
        Y :out STD_LOGIC);
end multiplexer2_1;

architecture Behavioral of multiplexer2_1 is

begin
Y<=(B and S0) OR (not(B) and S1);

end Behavioral;
