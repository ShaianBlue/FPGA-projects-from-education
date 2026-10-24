--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:32 05/05/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D6/LYSregul_tb.vhd
-- Project Name:  D6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LYSregul
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
 
ENTITY LYSregul_tb IS
END LYSregul_tb;
 
ARCHITECTURE behavior OF LYSregul_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LYSregul
    PORT(
         BTN3 : IN  std_logic;
         MClk : IN  std_logic;
         SW : IN  std_logic_vector(7 downto 0);
         LED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BTN3 : std_logic := '0';
   signal MClk : std_logic := '0';
   signal SW : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal LED : std_logic;

   -- Clock period definitions
   constant MClk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LYSregul PORT MAP (
          BTN3 => BTN3,
          MClk => MClk,
          SW => SW,
          LED => LED
        );

   -- Clock process definitions
   MClk_process :process
   begin
		MClk <= '0';
		wait for MClk_period/2;
		MClk <= '1';
		wait for MClk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		SW <= "00100010";
		wait for 700 ns;
		SW <= "00001000";
      wait;
   end process;

END;
