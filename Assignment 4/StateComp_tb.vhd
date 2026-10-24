--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:52 03/02/2021
-- Design Name:   
-- Module Name:   C:/Users/shaia/OneDrive/Bachelor/2. Semester/30081 - Digitalteknik/Opgaver/D4/StateComp_tb.vhd
-- Project Name:  D4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: StateComp
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
 
ENTITY StateComp_tb IS
END StateComp_tb;
 
ARCHITECTURE behavior OF StateComp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StateComp
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Func : IN  std_logic;
         Enter : IN  std_logic;
         Play : IN  std_logic;
         Done : IN  std_logic;
         Start : OUT  std_logic;
         DispSel : OUT  std_logic_vector(1 downto 0);
         BetEn : OUT  std_logic;
         SatsEn : OUT  std_logic;
         PointEn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Func : std_logic := '0';
   signal Enter : std_logic := '0';
   signal Play : std_logic := '0';
   signal Done : std_logic := '0';

 	--Outputs
   signal Start : std_logic;
   signal DispSel : std_logic_vector(1 downto 0);
   signal BetEn : std_logic;
   signal SatsEn : std_logic;
   signal PointEn : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StateComp PORT MAP (
          Reset => Reset,
          Clk => Clk,
          Func => Func,
          Enter => Enter,
          Play => Play,
          Done => Done,
          Start => Start,
          DispSel => DispSel,
          BetEn => BetEn,
          SatsEn => SatsEn,
          PointEn => PointEn
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
      wait for Clk_period;
		Reset <= '0';
		wait for Clk_period;
      -- insert stimulus here 
		wait for 1 ns;
		Enter <= '1';
		wait for 30 ns;
		Enter <= '0';
		Func <= '1';
		wait for 10 ns;
		Func <= '0';
		wait for 10 ns;
		Enter <= '1';
		wait for 30 ns;
		Enter <= '0';
		Play <= '1';
		wait for 30 ns;
		Done <= '1';
		wait for 60 ns;
		Play <= '0';
		wait for 10 ns;
		Func <= '1';
		wait for 40 ns;
		Play <= '1';
		wait for 40 ns;
		Func <= '1';
		
      wait;
   end process;

END;
