--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:41:14 06/19/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30082 - Projektarbejde i Digitaldesign/Signalgenerator/SigGenTop_tb.vhd
-- Project Name:  Signalgenerator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SigGenTop
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
 
ENTITY SigGenTop_tb IS
END SigGenTop_tb;
 
ARCHITECTURE behavior OF SigGenTop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SigGenTop
    PORT(
         BTN3 : IN  std_logic;
         Clk : IN  std_logic;
         SCK : IN  std_logic;
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         MOSI : IN  std_logic;
         SS : IN  std_logic;
         An : OUT  std_logic_vector(3 downto 0);
         Cat : OUT  std_logic_vector(7 downto 0);
         LD : OUT  std_logic;
         Error : OUT  std_logic;
         PWMOut : INOUT  std_logic;
         Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BTN3 : std_logic := '0';
   signal Clk : std_logic := '0';
   signal SCK : std_logic := '0';
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';
   signal MOSI : std_logic := '0';
   signal SS : std_logic := '0';

	--BiDirs
   signal PWMOut : std_logic;

 	--Outputs
   signal An : std_logic_vector(3 downto 0);
   signal Cat : std_logic_vector(7 downto 0);
   signal LD : std_logic;
   signal Error : std_logic;
   signal Done : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
	constant SCK_period : time := 2 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SigGenTop PORT MAP (
          BTN3 => BTN3,
          Clk => Clk,
          SCK => SCK,
          BTN0 => BTN0,
          BTN1 => BTN1,
          BTN2 => BTN2,
          MOSI => MOSI,
          SS => SS,
          An => An,
          Cat => Cat,
          LD => LD,
          Error => Error,
          PWMOut => PWMOut,
          Done => Done
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
	
	SCK_process :process
   begin
		SCK <= '0';
		wait for SCK_period/2;
		SCK <= '1';
		wait for SCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		-- hold BTN3 state
		SS <= '1';
      BTN3 <= '1';
		wait for SCK_period;
		BTN3 <= '0';
		-- insert stimulus here
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		SS <= '1';
		wait for SCK_period;
		SS <= '0';
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '0';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		MOSI <= '1';
		wait for SCK_period;
		SS <= '1';
      wait;
   end process;

END;
