library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Divider is
    Port ( Dividend :in std_logic_vector(7 downto 0);   --In1
           Divisor : in std_logic_vector(7 downto 0);   --In2
           Start :   in std_logic;
           Clk :     in std_logic;
			  CalcVal : out std_logic_vector(15 downto 0); -- (Q=CalcVal, CalcVal(7 downto 0)=Whole, CalcVal(15 downto 8)
           Done :    out std_logic
			  );
end Divider;

architecture Behavioral of Divider is
   signal Q:      std_logic_vector(15 downto 0);         -- Shift register
   signal Diff:    std_logic_vector( 8 downto 0);
	signal Count:  std_logic_vector( 3 downto 0);         -- Counter vector
	
begin

	-- Subtractor
	Diff <= ('0'&Q(14 downto 7)) - ('0'&Divisor); -- Similar to (Dend - Dsor) in paralell division. Q is set to Div
																-- when Start = '0'
   -- Shift
	process( Clk, Start, Dividend) 
	begin
      if Start = '1' then
		   Q <= "00000000" & Dividend; 
		elsif rising_edge(Clk) then
		   if Count(3)='0' then -- Check if DONE
		      if Diff(8)='1' then 
               Q <= Q(14 downto 0) & '0'; 
			   else
			      Q <= Diff(7 downto 0) & Q(6 downto 0) & '1';
				end if;
			end if;
		end if;
	end process;

	-- Counter
   process(Clk, Start)
	begin
	   if Start = '1' then
		   Count <= "0000";
		elsif rising_edge(Clk) then
		   if Count(3)='0' then
			   Count <= Count+1;
			end if;
		end if;
	end process;
	
	-- Output
	CalcVal <= Q;
	
	Done <= Count(3);
	
end Behavioral;