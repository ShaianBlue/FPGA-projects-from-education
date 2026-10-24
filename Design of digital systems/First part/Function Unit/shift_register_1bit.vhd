
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_register_1bit is
 Port ( 
    B: in STD_LOGIC;
    H0, H1, IR,IL: in STD_LOGIC;
    BopOut: out STD_LOGIC
 );
end shift_register_1bit;

architecture Behavioral of shift_register_1bit is
signal x,y,z,var, mellem: STD_LOGIC;
begin
x<=((not(H0)) and (not(H1))) and B;
y<=(H0 and not(H1)) and IR;
z<=(not(H0) and H1) and IL;
var<=(H0 and H1) and B;
BopOut<=x or y or z or var;

end Behavioral;
