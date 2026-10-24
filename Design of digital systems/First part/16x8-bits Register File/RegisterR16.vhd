----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/05/2022 07:51:53 PM
-- Design Name: 
-- Module Name: RegisterR16 - Behavioral
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

entity RegisterR16 is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LOAD : in STD_LOGIC_VECTOR (15 downto 0);
           D_Data : in STD_LOGIC_VECTOR (7 downto 0);
           R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR (7 downto 0);
           R8, R9, R10, R11, R12, R13, R14, R15 : out STD_LOGIC_VECTOR (7 downto 0));
end RegisterR16;

architecture Behavioral of RegisterR16 is
begin
    process(RESET, CLK, LOAD, D_Data)
    begin
        if RESET = '1' then
            R0 <= "00000000";
            R1 <= "00000000";
            R2 <= "00000000";
            R3 <= "00000000";
            R4 <= "00000000";
            R5 <= "00000000";
            R6 <= "00000000";
            R7 <= "00000000";
            R8 <= "00000000";
            R9 <= "00000000";
            R10 <= "00000000";
            R11 <= "00000000";
            R12 <= "00000000";
            R13 <= "00000000";
            R14 <= "00000000";
            R15 <= "00000000";
        elsif CLK'event and CLK = '1' then
            if LOAD = "0000000000000001" then
                R0 <= D_Data;
            elsif LOAD = "0000000000000010" then
                R1 <= D_Data;
            elsif LOAD = "0000000000000100" then
                R2 <= D_Data;
            elsif LOAD = "0000000000001000" then
                R3 <= D_Data;
            elsif LOAD = "0000000000010000" then
                R4 <= D_Data;
            elsif LOAD = "0000000000100000" then
                R5 <= D_Data;
            elsif LOAD = "0000000001000000" then
                R6 <= D_Data;
            elsif LOAD = "0000000010000000" then
                R7 <= D_Data;
            elsif LOAD = "0000000100000000" then
                R8 <= D_Data;
            elsif LOAD = "0000001000000000" then
                R9 <= D_Data;
            elsif LOAD = "0000010000000000" then
                R10 <= D_Data;
            elsif LOAD = "0000100000000000" then
                R11 <= D_Data;
            elsif LOAD = "0001000000000000" then
                R12 <= D_Data;
            elsif LOAD = "0010000000000000" then
                R13 <= D_Data;
            elsif LOAD = "0100000000000000" then
                R14 <= D_Data;
            elsif LOAD = "1000000000000000" then
                R15 <= D_Data;
            end if;
        end if;
    end process;
end Behavioral;
