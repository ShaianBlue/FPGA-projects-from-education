----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2022 10:26:58 AM
-- Design Name: 
-- Module Name: PWB - Behavioral
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

entity PWB is
    Port ( CLK, Reset : in STD_LOGIC;
           Address_In : in STD_LOGIC_VECTOR (7 downto 0);
           V, C, N, Z : in STD_LOGIC;
           Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
           DX, AX, BX, FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB, MD, RW, MM, MW : out STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Constant_Out : out STD_LOGIC_VECTOR (7 downto 0));
end PWB;

architecture Behavioral of PWB is

component ins_prog_filler is
   Port ( Address_in: in STD_LOGIC_VECTOR(7 downto 0);
          CLK: in STD_LOGIC;
          PS: in STD_LOGIC_VECTOR(1 downto 0);
          IL: in STD_LOGIC;
          Reset: in STD_LOGIC;
          Instruction_In: in STD_LOGIC_VECTOR(15 downto 0);
          constant_out: out STD_LOGIC_VECTOR(7 downto 0);
          Address_out: out STD_LOGIC_VECTOR(7 downto 0);
          IR: out STD_LOGIC_VECTOR(15 downto 0));
end component ins_prog_filler;

component InstructionDecoderController is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           DX : out STD_LOGIC_VECTOR (3 downto 0);
           AX : out STD_LOGIC_VECTOR (3 downto 0);
           BX : out STD_LOGIC_VECTOR (3 downto 0);
           FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB : out STD_LOGIC;
           MD : out STD_LOGIC;
           RW : out STD_LOGIC;
           MM : out STD_LOGIC;
           MW : out STD_LOGIC);
end component InstructionDecoderController;

signal IRcon : STD_LOGIC_VECTOR (15 downto 0);
signal PScon : STD_LOGIC_VECTOR (1 downto 0);
signal ILcon : STD_LOGIC;

begin

    TIlstandsmaskine : InstructionDecoderController port map(
    Reset => Reset,
    CLK => CLK,
    IR => IRcon,
    V => V,
    C => C,
    N => N,
    Z => Z,
    PS => PScon,
    IL  => ILcon,
    DX => DX,
    AX => AX,
    BX => BX,
    FS => FS,
    MB => MB,
    MD => MD,
    RW => RW,
    MM => MM,
    MW => MW
    );
    
    Det_andet : ins_prog_filler port map(
    Address_in => Address_In,
    CLK => CLK,
    PS => PScon,
    IL => ILcon,
    Reset => Reset,
    Instruction_In => Instruction_In,
    constant_out => Constant_Out,
    Address_out => Address_Out,
    IR => IRcon
    );

end Behavioral;
