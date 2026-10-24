----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 10:38:25 AM
-- Design Name: 
-- Module Name: MUX16x1x8 - Behavioral
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

entity MUX16x1x8 is
    Port ( 
           R0, R1, R2, R3, R4, R5, R6, R7 : in std_logic_vector (7 downto 0);
           R8, R9, R10, R11, R12, R13, R14, R15 : in std_logic_vector (7 downto 0);
           D_Select : in std_logic_vector (3 downto 0);
           Y_Data : out std_logic_vector (7 downto 0));
end MUX16x1x8;

architecture Behavioral of MUX16x1x8 is

signal A0_not : std_logic;
signal A1_not : std_logic;
signal A2_not : std_logic;
signal A3_not : std_logic;

signal twofour0 : std_logic;
signal twofour1 : std_logic;
signal twofour2 : std_logic;
signal twofour3 : std_logic;
signal twofour4 : std_logic;
signal twofour5 : std_logic;
signal twofour6 : std_logic;
signal twofour7 : std_logic;
signal twofour8 : std_logic;
signal twofour9 : std_logic;
signal twofour10 : std_logic;
signal twofour11 : std_logic;
signal twofour12 : std_logic;
signal twofour13 : std_logic;
signal twofour14 : std_logic;
signal twofour15 : std_logic;

signal foursixteendec0 : std_logic;
signal foursixteendec1 : std_logic;
signal foursixteendec2 : std_logic;
signal foursixteendec3 : std_logic;
signal foursixteendec4 : std_logic;
signal foursixteendec5 : std_logic;
signal foursixteendec6 : std_logic;
signal foursixteendec7 : std_logic;
signal foursixteendec8 : std_logic;
signal foursixteendec9 : std_logic;
signal foursixteendec10 : std_logic;
signal foursixteendec11 : std_logic;
signal foursixteendec12 : std_logic;
signal foursixteendec13 : std_logic;
signal foursixteendec14 : std_logic;
signal foursixteendec15 : std_logic;

signal foursixteenvec0 : std_logic_vector (7 downto 0);
signal foursixteenvec1 : std_logic_vector (7 downto 0);
signal foursixteenvec2 : std_logic_vector (7 downto 0);
signal foursixteenvec3 : std_logic_vector (7 downto 0);
signal foursixteenvec4 : std_logic_vector (7 downto 0);
signal foursixteenvec5 : std_logic_vector (7 downto 0);
signal foursixteenvec6 : std_logic_vector (7 downto 0);
signal foursixteenvec7 : std_logic_vector (7 downto 0);
signal foursixteenvec8 : std_logic_vector (7 downto 0);
signal foursixteenvec9 : std_logic_vector (7 downto 0);
signal foursixteenvec10 : std_logic_vector (7 downto 0);
signal foursixteenvec11 : std_logic_vector (7 downto 0);
signal foursixteenvec12 : std_logic_vector (7 downto 0);
signal foursixteenvec13 : std_logic_vector (7 downto 0);
signal foursixteenvec14 : std_logic_vector (7 downto 0);
signal foursixteenvec15 : std_logic_vector (7 downto 0);

signal andout0 : std_logic_vector (7 downto 0); 
signal andout1 : std_logic_vector (7 downto 0);
signal andout2 : std_logic_vector (7 downto 0);
signal andout3 : std_logic_vector (7 downto 0);
signal andout4 : std_logic_vector (7 downto 0);
signal andout5 : std_logic_vector (7 downto 0);
signal andout6 : std_logic_vector (7 downto 0);
signal andout7 : std_logic_vector (7 downto 0);
signal andout8 : std_logic_vector (7 downto 0);
signal andout9 : std_logic_vector (7 downto 0);
signal andout10 : std_logic_vector (7 downto 0);
signal andout11 : std_logic_vector (7 downto 0);
signal andout12 : std_logic_vector (7 downto 0);
signal andout13 : std_logic_vector (7 downto 0);
signal andout14 : std_logic_vector (7 downto 0);
signal andout15 : std_logic_vector (7 downto 0);

begin

A0_not <= NOT D_Select(0); 
A1_not <= NOT D_Select(1);
A2_not <= NOT D_Select(2);
A3_not <= NOT D_Select(3);

twofour0 <= A0_not AND A1_not;
twofour1 <= D_Select(0) AND A1_not;
twofour2 <= A0_not AND D_Select(1);
twofour3 <= D_Select(0) AND D_Select(1);
twofour4 <= A2_not AND A3_not;
twofour5 <= D_Select(2) AND A3_not;
twofour6 <= A2_not AND D_Select(3);
twofour7 <= D_Select(2) AND D_Select(3);

foursixteendec0 <= twofour0 AND twofour4;
foursixteendec1 <= twofour1 AND twofour4;
foursixteendec2 <= twofour2 AND twofour4;
foursixteendec3 <= twofour3 AND twofour4;
foursixteendec4 <= twofour0 AND twofour5;
foursixteendec5 <= twofour1 AND twofour5;
foursixteendec6 <= twofour2 AND twofour5;
foursixteendec7 <= twofour3 AND twofour5;
foursixteendec8 <= twofour0 AND twofour6;
foursixteendec9 <= twofour1 AND twofour6;
foursixteendec10 <= twofour2 AND twofour6;
foursixteendec11 <= twofour3 AND twofour6;
foursixteendec12 <= twofour0 AND twofour7;
foursixteendec13 <= twofour1 AND twofour7;
foursixteendec14 <= twofour2 AND twofour7;
foursixteendec15 <= twofour3 AND twofour7;

foursixteenvec0 <= foursixteendec0 & foursixteendec0 & foursixteendec0 & foursixteendec0 & foursixteendec0 & foursixteendec0 & foursixteendec0 & foursixteendec0;
foursixteenvec1 <= foursixteendec1 & foursixteendec1 & foursixteendec1 & foursixteendec1 & foursixteendec1 & foursixteendec1 & foursixteendec1 & foursixteendec1;
foursixteenvec2 <= foursixteendec2 & foursixteendec2 & foursixteendec2 & foursixteendec2 & foursixteendec2 & foursixteendec2 & foursixteendec2 & foursixteendec2;
foursixteenvec3 <= foursixteendec3 & foursixteendec3 & foursixteendec3 & foursixteendec3 & foursixteendec3 & foursixteendec3 & foursixteendec3 & foursixteendec3;
foursixteenvec4 <= foursixteendec4 & foursixteendec4 & foursixteendec4 & foursixteendec4 & foursixteendec4 & foursixteendec4 & foursixteendec4 & foursixteendec4;
foursixteenvec5 <= foursixteendec5 & foursixteendec5 & foursixteendec5 & foursixteendec5 & foursixteendec5 & foursixteendec5 & foursixteendec5 & foursixteendec5;
foursixteenvec6 <= foursixteendec6 & foursixteendec6 & foursixteendec6 & foursixteendec6 & foursixteendec6 & foursixteendec6 & foursixteendec6 & foursixteendec6;
foursixteenvec7 <= foursixteendec7 & foursixteendec7 & foursixteendec7 & foursixteendec7 & foursixteendec7 & foursixteendec7 & foursixteendec7 & foursixteendec7;
foursixteenvec8 <= foursixteendec8 & foursixteendec8 & foursixteendec8 & foursixteendec8 & foursixteendec8 & foursixteendec8 & foursixteendec8 & foursixteendec8;
foursixteenvec9 <= foursixteendec9 & foursixteendec9 & foursixteendec9 & foursixteendec9 & foursixteendec9 & foursixteendec9 & foursixteendec9 & foursixteendec9;
foursixteenvec10 <= foursixteendec10 & foursixteendec10 & foursixteendec10 & foursixteendec10 & foursixteendec10 & foursixteendec10 & foursixteendec10 & foursixteendec10;
foursixteenvec11 <= foursixteendec11 & foursixteendec11 & foursixteendec11 & foursixteendec11 & foursixteendec11 & foursixteendec11 & foursixteendec11 & foursixteendec11;
foursixteenvec12 <= foursixteendec12 & foursixteendec12 & foursixteendec12 & foursixteendec12 & foursixteendec12 & foursixteendec12 & foursixteendec12 & foursixteendec12;
foursixteenvec13 <= foursixteendec13 & foursixteendec13 & foursixteendec13 & foursixteendec13 & foursixteendec13 & foursixteendec13 & foursixteendec13 & foursixteendec13;
foursixteenvec14 <= foursixteendec14 & foursixteendec14 & foursixteendec14 & foursixteendec14 & foursixteendec14 & foursixteendec14 & foursixteendec14 & foursixteendec14;
foursixteenvec15 <= foursixteendec15 & foursixteendec15 & foursixteendec15 & foursixteendec15 & foursixteendec15 & foursixteendec15 & foursixteendec15 & foursixteendec15;

andout0 <= R0 AND foursixteenvec0;
andout1 <= R1 AND foursixteenvec1;
andout2 <= R2 AND foursixteenvec2;
andout3 <= R3 AND foursixteenvec3;
andout4 <= R4 AND foursixteenvec4;
andout5 <= R5 AND foursixteenvec5;
andout6 <= R6 AND foursixteenvec6;
andout7 <= R7 AND foursixteenvec7;
andout8 <= R8 AND foursixteenvec8;
andout9 <= R9 AND foursixteenvec9;
andout10 <= R10 AND foursixteenvec10;
andout11 <= R11 AND foursixteenvec11;
andout12 <= R12 AND foursixteenvec12;
andout13 <= R13 AND foursixteenvec13;
andout14 <= R14 AND foursixteenvec14;
andout15 <= R15 AND foursixteenvec15;

Y_Data <= (andout0 OR andout1 OR andout2 OR andout3 OR andout4 OR andout5 OR andout6 OR andout7 OR andout8 OR andout9 OR andout10 OR andout11 OR andout12 OR andout13 OR andout14 OR andout15);


end Behavioral;