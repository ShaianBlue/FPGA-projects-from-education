


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Au is
  Port (
        J_select0,J_select1,J_select2: in STD_LOGIC;
        J: out STD_LOGIC_VECTOR(7 downto 0);
        Co,V: out STD_LOGIC;
        A,B: in STD_LOGIC_VECTOR(7 downto 0));
end Au;

architecture Behavioral of Au is
component Full_adder_8bit is
    port( A   : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           sum: out STD_LOGIC_VECTOR (7 downto 0);
           V : out STD_LOGIC;
           Co : out STD_LOGIC);
end component;

component multiplex_8bit is
    port(S0,S1 : in STD_LOGIC;
        B : in STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)  );
end component;
signal mout :STD_LOGIC_VECTOR (7 downto 0);
begin
A1: multiplex_8bit port map (B=>B,S0=>J_select1,S1=>J_select2,Y=>mout);
A2: full_adder_8bit port map (B=>mout,A=>A,Cin=>J_select0,Co=>Co,V=>V,sum=>J);




end Behavioral;
