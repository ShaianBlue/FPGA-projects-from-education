

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity logic_gate_8bit is
  Port (
     S1: in STD_LOGIC;
     Cin: in STD_LOGIC;
     A,B: in STD_LOGIC_VECTOR(7 downto 0);
     OPout: out STD_LOGIC_VECTOR(7 downto 0)
   );
end logic_gate_8bit;

architecture Behavioral of logic_gate_8bit is
component logic_1bit
port (
S0,Cin: in STD_LOGIC;
  A,B : in STD_LOGIC;
  opout: out STD_LOGIC); 
end component;
begin
M0: logic_1bit port map (A=>A(0),B=>B(0),Cin=>Cin,S0=>S1,opout=>OPout(0));
M1: logic_1bit port map (A=>A(1),B=>B(1),Cin=>Cin,S0=>S1,opout=>OPout(1));
M2: logic_1bit port map (A=>A(2),B=>B(2),Cin=>Cin,S0=>S1,opout=>OPout(2));
M3: logic_1bit port map (A=>A(3),B=>B(3),Cin=>Cin,S0=>S1,opout=>OPout(3));
M4: logic_1bit port map (A=>A(4),B=>B(4),Cin=>Cin,S0=>S1,opout=>OPout(4));
M5: logic_1bit port map (A=>A(5),B=>B(5),Cin=>Cin,S0=>S1,opout=>OPout(5));
M6: logic_1bit port map (A=>A(6),B=>B(6),Cin=>Cin,S0=>S1,opout=>OPout(6));
M7: logic_1bit port map (A=>A(7),B=>B(7),Cin=>Cin,S0=>S1,opout=>OPout(7));

end Behavioral;
