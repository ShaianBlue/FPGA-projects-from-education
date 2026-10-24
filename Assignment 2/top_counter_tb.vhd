--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:49:10 02/17/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D2/top_counter_tb.vhd
-- Project Name:  D2
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
         Clk50 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         BTN3 : IN  std_logic;
         SW : IN  std_logic_vector(7 downto 0);
         LED : INOUT  std_logic_vector(7 downto 0);
         Cathode : OUT  std_logic_vector(7 downto 0);
         Anode : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BTN0 : std_logic := '0';
   signal Clk50 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal BTN3 : std_logic := '0';
   signal SW : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal LED : std_logic_vector(7 downto 0);

 	--Outputs
   signal Cathode : std_logic_vector(7 downto 0);
   signal Anode : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk50_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_counter PORT MAP (
          BTN0 => BTN0,
          Clk50 => Clk50,
          BTN1 => BTN1,
          BTN2 => BTN2,
          BTN3 => BTN3,
          SW => SW,
          LED => LED,
          Cathode => Cathode,
          Anode => Anode
        );

   -- Clock process definitions
   Clk50_process :process
   begin
		Clk50 <= '0';
		wait for Clk50_period/2;
		Clk50 <= '1';
		wait for Clk50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk50_period*10;

      -- insert stimulus here 
		BTN1 <= '1';
		BTN2 <= '1';
      wait;
   end process;

END;
