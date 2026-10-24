-----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2022 08:45:16 PM
-- Design Name: 
-- Module Name: PWA - Behavioral
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

entity PWA is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA, AA, BA : in STD_LOGIC_VECTOR (3 downto 0);
           MB, MD : in STD_LOGIC;
           FS0, FS1, FS2, FS3 : in STD_LOGIC;
           Constant_In : in STD_LOGIC_VECTOR (7 downto 0);
           Data_In : in STD_LOGIC_VECTOR (7 downto 0);
           Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (7 downto 0);
           V, C, N, Z : out STD_LOGIC);
end PWA;

architecture Behavioral of PWA is

component RegisterFile is
    Port ( RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA, AA, BA : in STD_LOGIC_VECTOR (3 downto 0);
           D_DATA : in STD_LOGIC_VECTOR (7 downto 0);
           A_DATA, B_DATA : out STD_LOGIC_VECTOR (7 downto 0));
end component RegisterFile;

component top_blok is
 Port ( 
            A,B : in STD_LOGIC_VECTOR(7 downto 0);
            FS3,FS2,FS1,FS0: in STD_LOGIC;
            V,C,N,Z: out STD_LOGIC;
            F: inout STD_LOGIC_VECTOR(7 downto 0));
end component top_blok;

component MUX2x1x8 is
    Port ( M : in STD_LOGIC;
           A, B : in STD_LOGIC_VECTOR (7 downto 0);
           X : out STD_LOGIC_VECTOR (7 downto 0));
end component MUX2x1x8;

signal A_Datasig, B_Datasig, F_Datasig : STD_LOGIC_VECTOR (7 downto 0);
signal MUX_Bsig, MUX_Dsig : STD_LOGIC_VECTOR (7 downto 0);

begin

    Register_File : RegisterFile port map(
    RESET => RESET,
    CLK => CLK,
    RW => RW,
    DA => DA, AA => AA, BA => BA,
    D_DATA => MUX_Dsig,
    A_DATA => A_Datasig, B_DATA => B_Datasig);
    
    Function_Unit : top_blok port map(
    A => A_Datasig, B => MUX_Bsig,
    FS0 => FS0, FS1 => FS1, FS2 => FS2, FS3 => FS3,
    V => V, C => C, N => N, Z => Z,
    F => F_Datasig);
    
    MUX_B : MUX2x1x8 port map(
    M => MB,
    A => B_Datasig, B => Constant_In,
    X => MUX_Bsig);
    
    MUX_D : MUX2x1x8 port map(
    M => MD,
    A => F_Datasig, B => Data_In,
    X => MUX_Dsig);
    
    Address_Out <= A_Datasig;
    Data_Out <= MUX_Bsig;
    
end Behavioral;
