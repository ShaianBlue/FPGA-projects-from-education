


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity logic_1bit is
  port  (S0,Cin: in STD_LOGIC;
  A,B : in STD_LOGIC;
  opout: out STD_LOGIC); 
   
end logic_1bit;

architecture Behavioral of logic_1bit is
signal x,y,z,var: STD_LOGIC;
begin
x<=((not(Cin)) and (not(S0))) and (A or B);
y<=(Cin and not(S0)) and (A and B);
z<=(not(Cin) and S0) and (A xor B);
var<=(Cin and S0) and not(A);
opout<=x or y or z or var;
end Behavioral;
