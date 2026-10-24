


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity InstructionDecoderController is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V : in STD_LOGIC;
           C : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           IL : out STD_LOGIC;
           DX : out STD_LOGIC_VECTOR (3 downto 0);
           AX : out STD_LOGIC_VECTOR (3 downto 0);
           BX : out STD_LOGIC_VECTOR (3 downto 0);
           FS : out STD_LOGIC_VECTOR (3 downto 0);
           MB : out STD_LOGIC;
           MD : out STD_LOGIC;
           RW : out STD_LOGIC;
           MM : out STD_LOGIC;
           MW : out STD_LOGIC);
end InstructionDecoderController;

architecture Behavioral of InstructionDecoderController is

type Statetype is (Inf, EX0, EX1, EX2, EX3, EX4);
signal State, NextState: Statetype;
signal SuperSignal: STD_LOGIC_VECTOR (23 downto 0);

begin
    
    MW <= SuperSignal(0);
    MM <= SuperSignal(1);
    RW <= SuperSignal(2);
    MD <= SuperSignal(3);
    FS <= SuperSignal(7 downto 4);
    MB <= SuperSignal(8);
    BX <= SuperSignal(12 downto 9);
    AX <= SuperSignal(16 downto 13);
    DX <= SuperSignal(20 downto 17);
    PS <= SuperSignal(22 downto 21);
    IL <= SuperSignal(23);
    
    StateReg: process(Reset, Clk)
    begin
        if Reset = '1' then
            State <= Inf;
        elsif Clk'event and Clk = '1' then
            State <= NextState;
        end if;
    end process;
    
    StateDec: process(State, IR, V, C, N, Z)
    begin
    NextState <= State;
        case State is
            when Inf =>
                SuperSignal <= "1000" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000010"; -- fjerner don't cares ved at indsætte 0 siden det ikke burde gøre en forskel
                NextState <= EX0;
            
            when EX0 =>
                if IR(15 downto 9) = "0000000" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0000001" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000010100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0000010" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000100100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0000101" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "001010100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0000110" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "001100100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001000" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "010000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001001" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "010010100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001010" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "010100100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001011" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "010110100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001100" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "011000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0010000" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000001100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0100000" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000001";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1001100" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "111000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1000010" then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "100100100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1100000" and Z = '1' then
                    SuperSignal <= "0100" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000000";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1100000" and Z = '0' then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000000";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1100001" and N = '1' then
                    SuperSignal <= "0100" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000000";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1100001" and N = '0' then
                    SuperSignal <= "0010" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000000";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "1110000" then
                    SuperSignal <= "0110" & IR(8 downto 6) & '0' & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000000";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0010001" then
                    SuperSignal <= "00010000" & IR(5 downto 3) & '0' & IR(2 downto 0) & "000001100";
                    NextState <= EX1;
                elsif IR(15 downto 9) = "0001101" and Z = '0' then
                    SuperSignal <= "00010000" & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000100";
                    NextState <= EX1;
                elsif IR(15 downto 9) = "0001101" and Z = '1' then
                    SuperSignal <= "00110000" & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001110" and Z = '0' then
                    SuperSignal <= "00010000" & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000100";
                    NextState <= EX1;
                elsif IR(15 downto 9) = "0001110" and Z = '1' then
                    SuperSignal <= "00110000" & IR(5 downto 3) & '0' & IR(2 downto 0) & "000000100";
                    NextState <= Inf;
                        else 
                        SuperSignal<="000000000000000000000000";
                end if;
            
            when EX1 =>
                if IR(15 downto 9) = "0010001" then
                    SuperSignal <= "0010" & IR(8 downto 6) & "10000" & IR(2 downto 0) & "000001100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001101" and Z = '0' then
                    SuperSignal <= "00010010" & IR(5 downto 3) & '0' & IR(2 downto 0) & "111000100";
                    NextState <= EX2;
                elsif IR(15 downto 9) = "0001101" and Z = '1' then
                    SuperSignal <= "00110010" & IR(5 downto 3) & '0' & IR(2 downto 0) & "111000100";
                    NextState <= Inf;  
                elsif IR(15 downto 9) = "0001110" and Z = '0' then
                    SuperSignal <= "00010010" & IR(5 downto 3) & '0' & IR(2 downto 0) & "111000100";
                    NextState <= EX2;      
                elsif IR(15 downto 9) = "0001110" and Z = '1' then
                    SuperSignal <= "00110010" & IR(5 downto 3) & '0' & IR(2 downto 0) & "111000100";
                    NextState <= Inf;
                    else 
                          SuperSignal<="000000000000000000000000";
                end if;
                
            when EX2 =>
                if IR(15 downto 9) = "0001101" then
                    SuperSignal <= "00010000" & IR(5 downto 3) & "1000011010100";
                    NextState <= EX3;
                elsif IR(15 downto 9) = "0001110" then
                    SuperSignal <= "00010000" & IR(5 downto 3) & "1000011100100";
                    NextState <= EX3;
                    else 
                                 SuperSignal<="000000000000000000000000";
                end if;
            
            when EX3 =>
                if IR(15 downto 9) = "0001101" and Z = '0' then
                    SuperSignal <= "000100110010" & IR(2 downto 0) & "001100100";
                    NextState <= EX2;
                elsif IR(15 downto 9) = "0001101" and Z = '1' then
                    SuperSignal <= "000100110010" & IR(2 downto 0) & "001100100";
                    NextState <= EX4;
                elsif IR(15 downto 9) = "0001110" and Z = '0' then
                    SuperSignal <= "000100110010" & IR(2 downto 0) & "001100100";
                    NextState <= EX2;    
                elsif IR(15 downto 9) = "0001110" and Z = '1' then
                    SuperSignal <= "000100110010" & IR(2 downto 0) & "001100100";
                    NextState <= EX4;
                    else 
                                    SuperSignal<="000000000000000000000000";
                end if;    
                
            when EX4 =>
                if IR(15 downto 9) = "0001101" then
                    SuperSignal <= "0010" & IR(8 downto 6) & "10000" & IR(2 downto 0) & "000000100";
                    NextState <= Inf;
                elsif IR(15 downto 9) = "0001110" then
                    SuperSignal <= "0010" & IR(8 downto 6) & "10000" & IR(2 downto 0) & "000000100";
                    NextState <= Inf;
                         else 
                                SuperSignal<="000000000000000000000000";
                end if;
       
        end case;
    end process;
    
end Behavioral;