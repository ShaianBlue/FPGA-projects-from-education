


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_register_8bit is
Port ( 
    H0,H1: in STD_LOGIC;
    B: in STD_LOGIC_VECTOR(7 downto 0);
    BOpOut : out STD_LOGIC_VECTOR(7 downto 0));
end shift_register_8bit;

architecture Behavioral of shift_register_8bit is
component shift_register_1bit
port (
   B: in STD_LOGIC;
 H0, H1, IR,IL: in STD_LOGIC;
 BopOut: out STD_LOGIC
);
end component;
begin
U0: shift_register_1bit port map(B=>B(0),H0=>H0,H1=>H1,IR=>B(1),IL=>'0',BopOut=>BOpOut(0));
U1: shift_register_1bit port map(IL=>B(0),IR=>B(2),B=>B(1),H0=>H0,H1=>H1,BopOut=>BOpOut(1));
U2: shift_register_1bit port map(IL=>B(1),IR=>B(3),B=>B(2),H0=>H0,H1=>H1,BopOut=>BOpOut(2));
U3: shift_register_1bit port map(IL=>B(2),IR=>B(4),B=>B(3),H0=>H0,H1=>H1,BopOut=>BOpOut(3));
U4: shift_register_1bit port map(IL=>B(3),IR=>B(5),B=>B(4),H0=>H0,H1=>H1,BopOut=>BOpOut(4));
U5: shift_register_1bit port map(IL=>B(4),IR=>B(6),B=>B(5),H0=>H0,H1=>H1,BopOut=>BOpOut(5));
U6: shift_register_1bit port map(IL=>B(5),IR=>B(7),B=>B(6),H0=>H0,H1=>H1,BopOut=>BOpOut(6));
U7: shift_register_1bit port map(IL=>B(6),IR=>'0',B=>B(7),H0=>H0,H1=>H1,BopOut=>BOpOut(7));
end Behavioral;
