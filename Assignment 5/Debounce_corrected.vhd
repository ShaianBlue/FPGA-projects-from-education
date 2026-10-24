----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    2016/03/18
-- Design Name: 
-- Module Name:    Debounce - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Debounce is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           BTNd : out  STD_LOGIC);
end Debounce;

architecture Behavioral of Debounce is

constant CountMax: integer := 10e4;

signal BTNa, BTNb, BTNp, Cout1, Cout2:  STD_LOGIC;

begin

RegA: process(Reset, Clk)
begin
  if Reset = '1' then BTNa <= '0';
  elsif clk'event and clk = '1' then
    BTNa <= BTN;		
  end if;
end process;

RegB: process(Reset, Clk)
begin
  if Reset = '1' then BTNb <= '0';
  elsif clk'event and clk = '1' then
    BTNb <= BTNa;		
  end if;
end process;


BTNp <= BTNa xor BTNb;

CountReg: process(Reset, Clk)
variable Count: integer range 0 to 11e4;
begin
  if Reset = '1' then 
	Count := 0;
	Cout1 <= '0';
  elsif clk'event and clk = '1' then
    if BTNp = '1' then
	   Count := 0;
	 elsif Cout1 = '0' then
      Count := Count + 1;
	 end if;
    if Count < CountMax then
      Cout1 <= '0';
    else
      Cout1 <= '1';
    end if;		
  end if;
end process;

RegC: process(Reset, Clk)
begin
  if Reset = '1' then Cout2 <= '0';
  elsif clk'event and clk = '1' then
    Cout2 <= Cout1;		
  end if;
end process;

BTNd <= Cout2 and not (Cout1 or BTNb);

end Behavioral;

