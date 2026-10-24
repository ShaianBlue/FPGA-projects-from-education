--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:46:41 06/18/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30082 - Projektarbejde i Digitaldesign/Signalgenerator/SigGenSPIControl_tb.vhd
-- Project Name:  Signalgenerator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SigGenSPIControl
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
 
ENTITY SigGenSPIControl_tb IS
END SigGenSPIControl_tb;
 
ARCHITECTURE behavior OF SigGenSPIControl_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SigGenSPIControl
    PORT(
         Reset : IN  std_logic;
         SClk : IN  std_logic;
         Clk : IN  std_logic;
         MOSI : IN  std_logic;
         SS : IN  std_logic;
         BTN0 : IN  std_logic;
         BTN1 : IN  std_logic;
         BTN2 : IN  std_logic;
         Disp : OUT  std_logic_vector(19 downto 0);
         Shape : INOUT  std_logic_vector(1 downto 0);
         Ampl : INOUT  std_logic_vector(7 downto 0);
         Freq : INOUT  std_logic_vector(7 downto 0);
         Error : OUT  std_logic;
         SigEn : OUT  std_logic;
         Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal SClk : std_logic := '0';
   signal Clk : std_logic := '0';
   signal MOSI : std_logic := '0';
   signal SS : std_logic := '0';
   signal BTN0 : std_logic := '0';
   signal BTN1 : std_logic := '0';
   signal BTN2 : std_logic := '0';

	--BiDirs
   signal Shape : std_logic_vector(1 downto 0);
   signal Ampl : std_logic_vector(7 downto 0);
   signal Freq : std_logic_vector(7 downto 0);

 	--Outputs
   signal Disp : std_logic_vector(19 downto 0);
   signal Error : std_logic;
   signal SigEn : std_logic;
   signal Done : std_logic;

   -- Clock period definitions
   constant SClk_period : time := 10 ns;
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SigGenSPIControl PORT MAP (
          Reset => Reset,
          SClk => SClk,
          Clk => Clk,
          MOSI => MOSI,
          SS => SS,
          BTN0 => BTN0,
          BTN1 => BTN1,
          BTN2 => BTN2,
          Disp => Disp,
          Shape => Shape,
          Ampl => Ampl,
          Freq => Freq,
          Error => Error,
          SigEn => SigEn,
          Done => Done
        );

   -- Clock process definitions
   SClk_process :process
   begin
		SClk <= '0';
		wait for SClk_period/2;
		SClk <= '1';
		wait for SClk_period/2;
   end process;
 
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
      -- hold reset state
		SS <= '1';
      Reset <= '1';
		wait for SClk_period;
		Reset <= '0';
      -- insert stimulus here
		wait for SClk_period;
		SS <= '0';
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		SS <= '1';
		wait for SClk_period;
		SS <= '0';
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '0';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		MOSI <= '1';
		wait for SClk_period;
		SS <= '1';
      wait;
   end process;

END;
