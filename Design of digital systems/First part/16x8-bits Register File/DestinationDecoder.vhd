----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 10:35:02 AM
-- Design Name: 
-- Module Name: DestinationDecoder - Behavioral
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

entity DestinationDecoder is
    Port ( WRITE : in STD_LOGIC;
           DA : in STD_LOGIC_VECTOR (3 downto 0);
           LOAD : out STD_LOGIC_VECTOR (15 downto 0));
end DestinationDecoder;

architecture Behavioral of DestinationDecoder is
signal TwoFour1, TwoFour2 : STD_LOGIC_VECTOR (3 downto 0);
begin
    TwoFour1(0) <= NOT DA(0) AND NOT DA(1);
    TwoFour1(1) <= DA(0) AND NOT DA(1);
    TwoFour1(2) <= NOT DA(0) AND DA(1);
    TwoFour1(3) <= DA(0) AND DA(1);
    TwoFour2(0) <= NOT DA(2) AND NOT DA(3);
    TwoFour2(1) <= DA(2) AND NOT DA(3);
    TwoFour2(2) <= NOT DA(2) AND DA(3);
    TwoFour2(3) <= DA(2) AND DA(3);
    LOAD(0) <= TWOFOUR1(0) AND TwoFour2(0) AND WRITE;
    LOAD(1) <= TWOFOUR1(1) AND TwoFour2(0) AND WRITE;
    LOAD(2) <= TWOFOUR1(2) AND TwoFour2(0) AND WRITE;
    LOAD(3) <= TWOFOUR1(3) AND TwoFour2(0) AND WRITE;
    LOAD(4) <= TWOFOUR1(0) AND TwoFour2(1) AND WRITE;
    LOAD(5) <= TWOFOUR1(1) AND TwoFour2(1) AND WRITE;
    LOAD(6) <= TWOFOUR1(2) AND TwoFour2(1) AND WRITE;
    LOAD(7) <= TWOFOUR1(3) AND TwoFour2(1) AND WRITE;
    LOAD(8) <= TWOFOUR1(0) AND TwoFour2(2) AND WRITE;
    LOAD(9) <= TWOFOUR1(1) AND TwoFour2(2) AND WRITE;
    LOAD(10) <= TWOFOUR1(2) AND TwoFour2(2) AND WRITE;
    LOAD(11) <= TWOFOUR1(3) AND TwoFour2(2) AND WRITE;
    LOAD(12) <= TWOFOUR1(0) AND TwoFour2(3) AND WRITE;
    LOAD(13) <= TWOFOUR1(1) AND TwoFour2(3) AND WRITE;
    LOAD(14) <= TWOFOUR1(2) AND TwoFour2(3) AND WRITE;
    LOAD(15) <= TWOFOUR1(3) AND TwoFour2(3) AND WRITE;
end Behavioral;
