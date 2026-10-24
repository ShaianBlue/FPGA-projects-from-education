--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:01:02 04/27/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D5/Calc_Data_tb.vhd
-- Project Name:  D5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Calc_Data
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Calc_Data_tb IS
END Calc_Data_tb;
 
ARCHITECTURE behavior OF Calc_Data_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Calc_Data
    PORT(
         Reset : IN  std_logic;
         CLK : IN  std_logic;
         Start : IN  std_logic;
         Done : OUT  std_logic;
         OpCode : IN  std_logic_vector(2 downto 0);
         In1 : IN  std_logic_vector(7 downto 0);
         In2 : IN  std_logic_vector(7 downto 0);
         CalcVal : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Start : std_logic := '0';
   signal OpCode : std_logic_vector(2 downto 0) := (others => '0');
   signal In1 : std_logic_vector(7 downto 0) := (others => '0');
   signal In2 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Done : std_logic;
   signal CalcVal : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Calc_Data PORT MAP (
          Reset => Reset,
          CLK => CLK,
          Start => Start,
          Done => Done,
          OpCode => OpCode,
          In1 => In1,
          In2 => In2,
          CalcVal => CalcVal
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		wait for CLK_period*10;
		In1 <= "01011100";
		wait for CLK_period;
		OpCode <= "010";
		wait for CLK_period*2;
		In2 <= "00010101";
		wait for CLK_period;
		Start <= '1';
		wait for CLK_period;
		Start <= '0';
		In1 <= CalcVal(7 downto 0);
		wait for CLK_period;
		OpCode <= "011";
		wait for CLK_period*2;
		In2 <= "00101001";
		wait for CLK_period;
		Start <= '1';
		wait for CLK_period;
		Start <= '0';
      wait;
   end process;

END;
