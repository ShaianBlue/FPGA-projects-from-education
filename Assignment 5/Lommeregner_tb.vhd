--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:05 04/26/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D5/Lommeregner_tb.vhd
-- Project Name:  D5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lommeregner
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
 
ENTITY Lommeregner_tb IS
END Lommeregner_tb;
 
ARCHITECTURE behavior OF Lommeregner_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lommeregner
    PORT(
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         BTN3 : IN  std_logic;
         MClk : IN  std_logic;
         SW : IN  std_logic_vector(7 downto 0);
         An : OUT  std_logic_vector(3 downto 0);
         Cat : OUT  std_logic_vector(6 downto 0);
         LED : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal BTN3 : std_logic := '0';
   signal MClk : std_logic := '0';
   signal SW : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal An : std_logic_vector(3 downto 0);
   signal Cat : std_logic_vector(6 downto 0);
   signal LED : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant MClk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lommeregner PORT MAP (
          BTN0 => BTN0,
          BTN1 => BTN1,
          BTN2 => BTN2,
          BTN3 => BTN3,
          MClk => MClk,
          SW => SW,
          An => An,
          Cat => Cat,
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
		BTN3 <= '1';
		wait for MClk_period;
		BTN3 <= '0';
		wait for MClk_period;
		SW <= "01101001";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*2;
		BTN1 <= '1';
		wait for MClk_period;
		BTN1 <= '0';
		wait for MClk_period*3;
		SW <= "01101000";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*3;
		SW <= "01101100";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*2;
		BTN1 <= '1';
		wait for MClk_period;
		BTN1 <= '0';
		wait for MClk_period*3;
		SW <= "00000101";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*2;
		BTN2 <= '1';
		wait for MClk_period;
		BTN2 <= '0';
		wait for MClk_period*10;
		BTN1 <= '1';
		wait for MClk_period;
		BTN1 <= '0';
		wait for MClk_period*3;
		SW <= "01011010";
		wait for MClk_period*2;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*2;
		SW <= "01011001";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period;
		BTN1 <= '1';
		wait for MClk_period;
		BTN1 <= '0';
		wait for MClk_period*3;
		SW <= "00011000";
		wait for MClk_period;
		BTN0 <= '1';
		wait for MClk_period;
		BTN0 <= '0';
		wait for MClk_period*2;
		BTN2 <= '1';
		wait for MClk_period;
		BTN2 <= '0';
		wait for MClk_period*10;
		BTN1 <= '1';
		wait for MClk_period;
		BTN1 <= '0';
      wait;
   end process;

END;
