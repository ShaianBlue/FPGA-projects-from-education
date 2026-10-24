----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2022 10:11:26 AM
-- Design Name: 
-- Module Name: Reg_count - Behavioral
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
use IEEE.STD_LOGIC_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_count is
  Port (
    reset: in STD_LOGIC;
    PS: in STD_LOGIC_VECTOR(1 downto 0);
    CLK: in STD_LOGIC;
    Offset: in STD_LOGIC_VECTOR(7 downto 0);
    Address_in:in STD_LOGIC_VECTOR(7 downto 0);
    PC: out STD_LOGIC_VECTOR(7 downto 0));
end Reg_count;

architecture Behavioral of Reg_count is
signal PCsig: STD_LOGIC_VECTOR(7 downto 0);
begin

process (clk, reset, PS, offset, address_in)
begin
if reset ='1' then
    PCsig<="00000000";
        elsif CLK'event and CLK = '1' then
    if PS="00" then
    PCsig<=PCsig;
        elsif PS="01" then
         PCsig<=PCsig+'1';
        elsif PS="10" then
          PCsig<=PCsig+offset;
          else -- PS="11"
            PCsig<=address_in;
        end if;
      end if;      
    end process;
    PC<=PCsig; 
end Behavioral;
