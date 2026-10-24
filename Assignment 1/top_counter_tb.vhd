--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:30:14 02/10/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D1/top_counter_tb.vhd
-- Project Name:  D1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_counter
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
 
ENTITY top_counter_tb IS
END top_counter_tb;
 
ARCHITECTURE behavior OF top_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_counter
    PORT(
         BTN0 : IN  std_logic;
         CLK50 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         BTN3 : IN  std_logic;
         SW : IN  std_logic_vector(7 downto 0);
         LED : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN0 : std_logic := '0';
   signal CLK50 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal BTN3 : std_logic := '0';
   signal SW : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_counter PORT MAP (
          BTN0 => BTN0,
          CLK50 => CLK50,
          BTN1 => BTN1,
          BTN2 => BTN2,
          BTN3 => BTN3,
          SW => SW,
          LED => LED
        );

   -- Clock process definitions
   CLK50_process :process
   begin
		CLK50 <= '0';
		wait for CLK50_period/2;
		CLK50 <= '1';
		wait for CLK50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 0,8 ns.
      BTN0 <= '1';
		wait for 800 ms;
		BTN0 <= '0';
		
		-- Assert CE and DIR
		wait for 3000 ms;
		BTN1 <= '1';
		BTN2 <= '1';
		
		-- Sidste to tal af dit studienummer
		SW <= "01010000"; -- 80
		
		-- Make a load pulse
		wait for 3000 ms;
		BTN3 <= '1';
		wait for 1000 ms;
		BTN3 <= '0';
		
		-- Unassert DIR (Change the count direction)
		wait for 3000 ms;
		BTN2 <= '0';
		
      wait;
   end process;

END;
