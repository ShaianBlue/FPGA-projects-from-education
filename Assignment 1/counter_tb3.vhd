--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:03:30 02/10/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D1/counter_tb3.vhd
-- Project Name:  D1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY counter_tb3 IS
END counter_tb3;
 
ARCHITECTURE behavior OF counter_tb3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         DIR : IN  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         CE : IN  std_logic;
         LOAD : IN  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         COUNT : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DIR : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CE : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal COUNT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          DIR => DIR,
          CLK => CLK,
          RESET => RESET,
          CE => CE,
          LOAD => LOAD,
          DIN => DIN,
          COUNT => COUNT
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
      -- hold reset state for 15 ns.
		RESET <= '1';
		wait for 15 ns;
		RESET <= '0';

      wait for CLK_period*4;

      -- insert stimulus here 
		CE <= '1';
		DIN <= "00000111";
		wait for 45 ns;
		LOAD <= '1';
		wait for CLK_period;
		LOAD <= '0';
		wait for 20 ns;
		DIR <= '1';
      wait;
   end process;

END;
