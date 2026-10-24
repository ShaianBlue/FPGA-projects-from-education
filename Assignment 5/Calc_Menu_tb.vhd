-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DispSet
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

ENTITY Calc_Menu_tb IS
END Calc_Menu_tb;

ARCHITECTURE behavior OF Calc_Menu_tb IS 

	 -- Component Declaration for the Unit Under Test (UUT)
	 
	 COMPONENT Calc_Menu
    PORT(
			Reset : in  STD_LOGIC;
         Clk : in  STD_LOGIC;
         Enter : in  STD_LOGIC;
         Beregn : in  STD_LOGIC;
         Func : in  STD_LOGIC;
         Done : in  STD_LOGIC;
         DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
			CalcVal : in  STD_LOGIC_VECTOR (15 downto 0);
         Start : out  STD_LOGIC;
         OpCode : out  STD_LOGIC_VECTOR (2 downto 0);
         In1 : out  STD_LOGIC_VECTOR (7 downto 0);
         In2 : out  STD_LOGIC_VECTOR (7 downto 0);
         DispData : out  STD_LOGIC_VECTOR (15 downto 0);
         Tilstand : out  STD_LOGIC_VECTOR (7 downto 0)
        );
	 END COMPONENT;

    
	--Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Enter : std_logic := '0';
   signal Beregn : std_logic := '0';
   signal Func : std_logic := '0';
   signal DataIn : std_logic_vector(7 downto 0) := (others => '0');
   signal Done : std_logic := '0';
	signal CalcVal : std_logic_vector(15 downto 0) := (others => '0');


 	--Outputs
   signal Tilstand : std_logic_vector(7 downto 0);
   signal Start : std_logic;
   signal OpCode : std_logic_vector(2 downto 0);
   signal In1 : std_logic_vector(7 downto 0);
   signal In2 : std_logic_vector(7 downto 0);
	signal DispData : std_logic_vector(15 downto 0);

	-- Clock period definitions
   constant Clk_period : time := 10 ns;
	
  BEGIN

  -- Instantiate the Unit Under Test (UUT)
   uut: Calc_Menu PORT MAP (
          Reset => Reset,
          Clk => Clk,
          Enter => Enter,
          Beregn => Beregn,
          Func => Func,
			 Done => Done,
          DataIn => DataIn,
			 CalcVal => CalcVal,
          Start => Start,
          OpCode => OpCode,
          In1 => In1,
          In2 => In2,
			 DispData => DispData,
			 Tilstand => Tilstand
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
      -- insert stimulus here 
		Reset <= '1';
		wait for Clk_period;
		Reset <= '0';
		wait for Clk_period;
		DataIn <= "01101001";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*2;
		Func <= '1';
		wait for Clk_period;
		Func <= '0';
		wait for Clk_period*3;
		DataIn <= "01101000";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*3;
		DataIn <= "01101100";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*2;
		Func <= '1';
		wait for Clk_period;
		Func <= '0';
		wait for Clk_period*3;
		DataIn <= "00000101";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*2;
		Beregn <= '1';
		wait for Clk_period;
		Beregn <= '0';
		wait for Clk_period;
		Done <= '1';
		Calcval <= "0000000000010101";
		wait for Clk_period*2;
		Func <= '1';
		wait for Clk_period;
		Func <= '0';
		wait for Clk_period*3;
		DataIn <= "01011010";
		wait for Clk_period*2;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*2;
		DataIn <= "01011001";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period;
		Func <= '1';
		wait for Clk_period;
		Func <= '0';
		wait for Clk_period*3;
		DataIn <= "00011000";
		wait for Clk_period;
		Enter <= '1';
		wait for Clk_period;
		Enter <= '0';
		wait for Clk_period*2;
		Beregn <= '1';
		Done <= '0';
		wait for Clk_period;
		Beregn <= '0';
		wait for Clk_period;
		Done <= '1';
		Calcval <= "0000000000101101";
		wait for Clk_period*10;
		Func <= '1';
		wait for Clk_period;
		Func <= '0';
      wait;
   end process;

END;
