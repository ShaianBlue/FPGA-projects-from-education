----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2022 05:26:47 PM
-- Design Name: 
-- Module Name: multiplex_normal_function8bit - Behavioral
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

entity multiplex_normal_function8bit is
 Port ( 
 in0,in1 : in STD_LOGIC_VECTOR(7 downto 0);
 J_select3: in STD_LOGIC;
 Y: out STD_LOGIC_VECTOR(7 downto 0));
end multiplex_normal_function8bit;

architecture Behavioral of multiplex_normal_function8bit is

component multiplex_normal_function_1bit
port (
in0,in1 : in STD_LOGIC;
    S3:  in STD_LOGIC;
    y: out STD_LOGIC);
end component;

begin
u1: multiplex_normal_function_1bit port map(in0=>in0(0),in1=>in1(0),S3=>J_select3,Y=>Y(0));
u2: multiplex_normal_function_1bit port map(in0=>in0(1),in1=>in1(1),S3=>J_select3,Y=>Y(1));
u3: multiplex_normal_function_1bit port map(in0=>in0(2),in1=>in1(2),S3=>J_select3,Y=>Y(2));
u4: multiplex_normal_function_1bit port map(in0=>in0(3),in1=>in1(3),S3=>J_select3,Y=>Y(3));
u5: multiplex_normal_function_1bit port map(in0=>in0(4),in1=>in1(4),S3=>J_select3,Y=>Y(4));
u6: multiplex_normal_function_1bit port map(in0=>in0(5),in1=>in1(5),S3=>J_select3,Y=>Y(5));
u7: multiplex_normal_function_1bit port map(in0=>in0(6),in1=>in1(6),S3=>J_select3,Y=>Y(6));
u8: multiplex_normal_function_1bit port map(in0=>in0(7),in1=>in1(7),S3=>J_select3,Y=>Y(7));








end Behavioral;
