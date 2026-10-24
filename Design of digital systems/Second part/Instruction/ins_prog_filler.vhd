----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2022 11:19:39 AM
-- Design Name: 
-- Module Name: ins_prog_filler - Behavioral
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

entity ins_prog_filler is
Port ( Address_in: in STD_LOGIC_VECTOR(7 downto 0);
        CLK: in STD_LOGIC;
          PS: in STD_LOGIC_VECTOR(1 downto 0);
          IL: in STD_LOGIC;
          Reset: in STD_LOGIC;
          Instruction_In: in STD_LOGIC_VECTOR(15 downto 0);
          constant_out: out STD_LOGIC_VECTOR(7 downto 0);
          Address_out: out STD_LOGIC_VECTOR(7 downto 0);
         IR: out STD_LOGIC_VECTOR(15 downto 0));
end ins_prog_filler;

architecture Behavioral of ins_prog_filler is

component reg_count
  Port (
  reset: in STD_LOGIC;
  PS: in STD_LOGIC_VECTOR(1 downto 0);
  CLK: in STD_LOGIC;
  Offset: in STD_LOGIC_VECTOR(7 downto 0);
  Address_in:in STD_LOGIC_VECTOR(7 downto 0);
  PC: out STD_LOGIC_VECTOR(7 downto 0));
  end component;
  
  component instruction_register
    Port ( 
    reset: in STD_LOGIC;
    CLK: in STD_LOGIC;
    Instruction_In: in STD_LOGIC_VECTOR(15 downto 0);
    IL: in STD_LOGIC;
    IR: out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    component zero_filler
      Port ( 
    IR: in STD_LOGIC_VECTOR(15 downto 0);
    ZeroFilled_8: out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    component sign_filler
      Port (    IR: in STD_LOGIC_VECTOR(15 downto 0);
              Extended_8: out STD_LOGIC_VECTOR(7 downto 0));
              end component;
   signal Offsetsig: STD_LOGIC_VECTOR(7 downto 0);
   signal IRsig: STD_LOGIC_VECTOR(15 downto 0);
begin

instruc: instruction_register port map(IL=>IL,Instruction_in=>Instruction_in,CLK=>CLK,reset=>reset,IR=>IRsig);
cont: Reg_count port map (reset=>reset,PS=>PS,CLK=>CLK, offset=>offsetsig,Address_in=>Address_in,PC=>Address_out);
zero: zero_filler port map (IR=>IRsig,ZeroFilled_8=>constant_out);
sign: sign_filler port map(IR=>IRsig,Extended_8=>offsetsig);
IR<=IRsig;

end Behavioral;
