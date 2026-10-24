----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2022 10:55:46 AM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
 Port ( 
 clk, reset, flag: in STD_LOGIC;
 regout: out STD_LOGIC_VECTOR(7 downto 0);
 input: in STD_LOGIC_VECTOR(7 downto 0));
end reg;

architecture Behavioral of reg is
signal regsig: STD_LOGIC_VECTOR(7 downto 0);
begin

-- registrer
process(clk, reset, input)
begin
if reset='1' then
   regout<=X"00";
   regsig<=X"00";
    elsif CLK'event and CLK = '1' then
        if flag='1' then
     regsig<=input;
        else
        regsig<=regsig;
        end if;
        regout<=regsig;
    end if;
end process;
end Behavioral;
