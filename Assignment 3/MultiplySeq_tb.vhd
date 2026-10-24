--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:28:42 02/26/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D3/MultiplySeq_tb.vhd
-- Project Name:  D3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MultiplySeq
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
 
ENTITY MultiplySeq_tb IS
END MultiplySeq_tb;
 
ARCHITECTURE behavior OF MultiplySeq_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MultiplySeq
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Start : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Done : OUT  std_logic;
         Error : OUT  std_logic;
         C : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Start : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Done : std_logic;
   signal Error : std_logic;
   signal C : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MultiplySeq PORT MAP (
          Reset => Reset,
          Clk => Clk,
          Start => Start,
          A => A,
          B => B,
          Done => Done,
          Error => Error,
          C => C
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Reset <= '1';
		Start <= '1';
		A <= "00001000";
		B <= "00000110";
		wait for 10 ns;
		Reset <= '0';
		wait for 10 ns;
		Start <= '0';

      -- insert stimulus here 
		
      wait;
   end process;

END;
