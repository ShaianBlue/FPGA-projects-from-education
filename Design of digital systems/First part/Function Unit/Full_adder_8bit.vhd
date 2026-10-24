----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2022 11:03:14 AM
-- Design Name: 
-- Module Name: Full_adder_8bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_adder_8bit is
    Port ( A   : in STD_LOGIC_VECTOR (7 downto 0);
            B : in STD_LOGIC_VECTOR (7 downto 0);
            Cin : in STD_LOGIC;
            sum: out STD_LOGIC_VECTOR (7 downto 0);
            V : out STD_LOGIC;
            Co : out STD_LOGIC);
end Full_adder_8bit;

architecture Behavioral of Full_adder_8bit is

component half_ad
    Port(A,B : in STD_LOGIC;
    c,Y: out STD_LOGIC);
    end component;
component Full_adder
 Port ( A : in STD_LOGIC;
          B : in STD_LOGIC;
          Cin : in STD_LOGIC;
          Cout0 : out STD_LOGIC;
          Y0 : out STD_LOGIC);
  end component;
signal cc: STD_LOGIC_VECTOR (7 downto 0);
begin

U1: Full_adder port map (A=>A(0),B=>B(0),Cin=>Cin,Y0=>sum(0),Cout0=>cc(0));
U2: Full_adder port map (A=>A(1),B=>B(1),Cin=>cc(0),Y0=>sum(1),Cout0=>cc(1));
U3: Full_adder port map (A=>A(2),B=>B(2),Cin=>cc(1),Y0=>sum(2),Cout0=>cc(2));
U4: Full_adder port map (A=>A(3),B=>B(3),Cin=>cc(2),Y0=>sum(3),Cout0=>cc(3));
U5: Full_adder port map (A=>A(4),B=>B(4),Cin=>cc(3),Y0=>sum(4),Cout0=>cc(4));
U6: Full_adder port map (A=>A(5),B=>B(5),Cin=>cc(4),Y0=>sum(5),Cout0=>cc(5));
U7: Full_adder port map (A=>A(6),B=>B(6),Cin=>cc(5),Y0=>sum(6),Cout0=>cc(6));
U8: Full_adder port map (A=>A(7),B=>B(7),Cin=>cc(6),Y0=>sum(7),Cout0=>Co);
V<=cc(6) xor cc(5);
-- det ser ud til at virke.
end Behavioral;
 
--GEN_ADD: for i in 0 to width generate

--LOW_bit: if i=0 generate
 --   U0: Full_adder port map
 --   (A(i),B(i),Cin,cc(0),sum(i));
  --  end generate Low_bit;
 --UPPER_bits: if (i>0 and i<width) generate
  --  UX: Full_adder port map
   -- (A(i),B(i),cc(i-1),cc(i),sum(i));
    --end generate upper_bits;
  --  msb: if i=width generate
   -- Umsb:Full_adder port map
    --(B(i),A(i),cc(i-1),co,sum(i));
    --end generate msb;
    --end generate GEN_ADD;

