


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_blok is
 Port ( 
 A,B : in STD_LOGIC_VECTOR(7 downto 0);
 FS3,FS2,FS1,FS0: in STD_LOGIC;
 V,C,N,Z: out STD_LOGIC;
 F: inout STD_LOGIC_VECTOR(7 downto 0));
end top_blok;

architecture Behavioral of top_blok is

component Au is
port(
J_select0,J_select1,J_select2: in STD_LOGIC;
        J: out STD_LOGIC_VECTOR(7 downto 0);
        Co,V: out STD_LOGIC;
        A,B: in STD_LOGIC_VECTOR(7 downto 0));
end component;


component logic_gate_8bit
port (
S1: in STD_LOGIC;
     Cin: in STD_LOGIC;
     A,B: in STD_LOGIC_VECTOR(7 downto 0);
     OPout: out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component shift_register_8bit
port (
H0,H1: in STD_LOGIC;
    B: in STD_LOGIC_VECTOR(7 downto 0);
    BOpOut : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;
component multiplex_normal_function8bit
port(
in0,in1 : in STD_LOGIC_VECTOR(7 downto 0);
J_select3: in STD_LOGIC;
 Y: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component NegZerp
port (
MuxF: in STD_LOGIC_VECTOR(7 downto 0);
 N,Z: out STD_LOGIC);
end component;
signal test,test2,test3,Fmiddel: STD_LOGIC_VECTOR(7 downto 0);
signal S: STD_LOGIC;
begin
S<=FS3 and FS2; 
A1: Au port map (A=>A,B=>B,J_select0=>FS0,J_select1=>FS1,J_select2=>FS2,Co=>C,V=>V,J=>test);
A2: logic_gate_8bit port map(A=>A,B=>B,Cin=>FS0,Opout=>test2,S1=>FS1);
A3: shift_register_8bit port map (B=>B,BOpOut=>test3,H0=>FS0,H1=>FS1);
A4: multiplex_normal_function8bit port map (in0=>test,in1=>test2,J_select3=>FS3,y=>Fmiddel);
A5: multiplex_normal_function8bit port map (in0=>Fmiddel,in1=>test3,J_select3=>S,y=>F);
A6: NegZerp port map (MuxF=>F,N=>N,Z=>Z);
end Behavioral;
