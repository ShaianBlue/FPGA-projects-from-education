----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 11:27:45 AM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA, AA, BA : in STD_LOGIC_VECTOR (3 downto 0);
           D_DATA : in STD_LOGIC_VECTOR (7 downto 0);
           A_DATA, B_DATA : out STD_LOGIC_VECTOR (7 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

component DestinationDecoder is
    Port ( WRITE : in STD_LOGIC;
           DA : in STD_LOGIC_VECTOR (3 downto 0);
           LOAD : out STD_LOGIC_VECTOR (15 downto 0));
end component DestinationDecoder;

component RegisterR16 is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LOAD : in STD_LOGIC_VECTOR (15 downto 0);
           D_Data : in STD_LOGIC_VECTOR (7 downto 0);
           R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR (7 downto 0);
           R8, R9, R10, R11, R12, R13, R14, R15 : out STD_LOGIC_VECTOR (7 downto 0));
end component RegisterR16;

component MUX16x1x8 is
    Port ( R0, R1, R2, R3, R4, R5, R6, R7 : in STD_LOGIC_VECTOR (7 downto 0);
           R8, R9, R10, R11, R12, R13, R14, R15 : in STD_LOGIC_VECTOR (7 downto 0);
           D_Select : in STD_LOGIC_VECTOR (3 downto 0);
           Y_Data : out STD_LOGIC_VECTOR (7 downto 0));
end component MUX16x1x8;

signal LOADRegister : STD_LOGIC_VECTOR (15 downto 0);
signal R0sig, R1sig, R2sig, R3sig, R4sig, R5sig, R6sig, R7sig : STD_LOGIC_VECTOR (7 downto 0);
signal R8sig, R9sig, R10sig, R11sig, R12sig, R13sig, R14sig, R15sig : STD_LOGIC_VECTOR (7 downto 0);

begin

    Destination_Decoder : DestinationDecoder port map(
    WRITE => RW,
    DA => DA,
    LOAD => LOADRegister);
    
    Registre : RegisterR16 port map(
    RESET => RESET,
    CLK => CLK,
    LOAD => LOADRegister,
    D_Data => D_Data,
    R0 => R0sig, R1 => R1sig, R2 => R2sig, R3 => R3sig, R4 => R4sig, R5 => R5sig, R6 => R6sig, R7 => R7sig,
    R8 => R8sig, R9 => R9sig, R10 => R10sig, R11 => R11sig, R12 => R12sig, R13 => R13sig, R14 => R14sig, R15 => R15sig);
    
    MUX_A : MUX16x1x8 port map(
    R0 => R0sig, R1 => R1sig, R2 => R2sig, R3 => R3sig, R4 => R4sig, R5 => R5sig, R6 => R6sig, R7 => R7sig,
    R8 => R8sig, R9 => R9sig, R10 => R10sig, R11 => R11sig, R12 => R12sig, R13 => R13sig, R14 => R14sig, R15 => R15sig,
    D_Select => AA,
    Y_Data => A_DATA);
    
    MUX_B : MUX16x1x8 port map(
    R0 => R0sig, R1 => R1sig, R2 => R2sig, R3 => R3sig, R4 => R4sig, R5 => R5sig, R6 => R6sig, R7 => R7sig,
    R8 => R8sig, R9 => R9sig, R10 => R10sig, R11 => R11sig, R12 => R12sig, R13 => R13sig, R14 => R14sig, R15 => R15sig,
    D_Select => BA,
    Y_Data => B_DATA);
    
end Behavioral;
