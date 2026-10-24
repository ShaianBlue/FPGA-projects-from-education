library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_register is
  Port ( 
    reset: in STD_LOGIC;
    CLK: in STD_LOGIC;
    Instruction_In: in STD_LOGIC_VECTOR(15 downto 0);
    IL: in STD_LOGIC;
    IR: out STD_LOGIC_VECTOR(15 downto 0));
end instruction_register;

architecture Behavioral of instruction_register is
signal IRsig: STD_LOGIC_VECTOR(15 downto 0);
begin
IR<=IRsig;

process (clk, reset, Instruction_In, IL)
begin
    if reset='1' then
    IRsig<="0000000000000000";
        elsif CLK'event and CLK='1' then
            if  IL='0' then
               IRsig<=IRsig;
               else
               IRsig<= Instruction_In;
          
               
                end if;
         end if;
end process;

end Behavioral;
