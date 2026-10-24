
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( 
       DIR: in STD_LOGIC;
       CLK: in STD_LOGIC;
       RESET: in STD_LOGIC;
       CE, LOAD: in STD_LOGIC;
       DIN: in STD_LOGIC_VECTOR(7 downto 0);
       COUNT: inout STD_LOGIC_VECTOR(7 downto 0)
	 );
end counter;

architecture Behavioral of counter is
begin

process (CLK, RESET)
begin
    if RESET='1' then
        COUNT <= "00000000";
    elsif CLK='1' and CLK'event then
        if LOAD='1' then
            COUNT <= DIN;
        else
            if CE='1' and DIR='1' then
               COUNT <= COUNT + 1;
				elsif CE='1' and DIR='0' then
					COUNT <= COUNT - 1;
           end if;
        end if;
    end if;
end process;

end Behavioral;
