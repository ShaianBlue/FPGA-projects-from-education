----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2022 11:15:53 AM
-- Design Name: 
-- Module Name: port_register - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity port_register is
 Port ( 
    clk, MW, Reset: in STD_LOGIC;
    DATA_in, Address_in, SW : in STD_LOGIC_VECTOR(7 downto 0);
    BTNC, BTNU, BTNL,BTNR, BTND: in STD_LOGIC;   --BTNC=BTNS
    MMR: out STD_LOGIC;
    D_word: out  STD_LOGIC_VECTOR(15 downto 0);
    Data_outR: out STD_LOGIC_VECTOR(15 downto 0);
    LED: out STD_LOGIC_VECTOR(7 downto 0));
end port_register;

architecture Behavioral of port_register is
component reg
port (
clk, reset, flag: in STD_LOGIC;
 regout: out STD_LOGIC_VECTOR(7 downto 0);
input: in STD_LOGIC_VECTOR(7 downto 0));
end component;
signal  input0, input1, input2, input3, input4, input5, input6, input7 : STD_LOGIC_VECTOR(7 downto 0);
signal rego0,rego1,rego2,rego3,rego4,rego5,rego6,rego7: STD_LOGIC_VECTOR(7 downto 0);
signal test: STD_LOGIC_VECTOR(15 downto 0);
signal flag0, flag1 , flag2 , flag3 , flag4 , flag5 , flag6, flag7 : STD_LOGIC;
begin


regs0: reg port map (clk=>clk,reset=>reset,input=>input0,regout=>rego0, flag=>flag0);
regs1: reg port map (clk=>clk,reset=>reset,input=>input1,regout=>rego1,flag=>flag1);
regs2: reg port map (clk=>clk,reset=>reset,input=>input2,regout=>rego2, flag=>flag2);
regs3: reg port map (clk=>clk,reset=>reset,input=>input3,regout=>rego3, flag=>flag3);
regs4: reg port map (clk=>clk,reset=>reset,input=>input4,regout=>rego4, flag=>flag4);
regs5: reg port map (clk=>clk,reset=>reset,input=>input5,regout=>rego5, flag=>flag5);
regs6: reg port map (clk=>clk,reset=>reset,input=>input6,regout=>rego6, flag=>flag6);
regs7: reg port map (clk=>clk,reset=>reset,input=>input7,regout=>rego7, flag=>flag7);



 -- read 
process (clk, MW,Reset,Rego0,Rego1,Rego2,Rego3,Rego4,Rego5,Rego6,Rego7,address_in)
begin
if reset = '1' then
data_outR <= x"0000";
D_word <= x"0000";
    
 elsif CLK'event and CLK = '1' then
 D_word<=Rego1&Rego0;
  if (MW = '0') and (address_in > x"F7") then
  MMR <= '1';
    if (address_in = "11111000") then 
        data_outR <= x"00"&Rego0;
    elsif (address_in = "11111001") then 
         data_outR<= x"00"&Rego1;
    elsif (address_in = "11111010") then 
        data_outR <= x"00"&Rego2;
    elsif (address_in = "11111011") then 
        data_outR <= x"00"&Rego3;
    elsif (address_in = "11111100") then 
        data_outR <= x"00"&Rego4;
    elsif (address_in = "11111101") then 
        data_outR <= x"00"&Rego5;
   elsif (address_in = "11111110") then 
        data_outR <= x"00"&Rego6;
    elsif (address_in = "11111111") then 
        data_outR<= x"00"&Rego7;
   
    end if;
     else 
       MMR<='0';
  end if;
end if; 
end process;




-- de 3 første send 
testA: process(clk, reset, MW, address_in, data_in) 
begin
  if reset = '1' then
LED <= x"00";
flag0<='0';
flag1<='0';
flag2<='0';
   elsif CLK'event and CLK = '1' and MW='1' then 
  LED<=Rego2;
     if  (address_in = "11111000") then
        flag0<='1'; 
         input0 <= data_in;
     elsif ( address_in = "11111001") then
        flag1<='1'; 
         input1 <= data_in;
      elsif (address_in = "11111010") then
        flag2<='1';
         input2 <= data_in;
         
      end if;
    end if;
    
end process;


-- de sidste sende ting.
 process(reset, address_in,sw, BTNR,BTNL, BTND, BTNU, BTNC) 
begin
    if reset = '1' then
     flag3<='0';
     flag4<='0';
     flag5<='0';
     flag6<='0';
     flag7<='0';
   else 
        if (BTNR = '1') then
            flag3<='1';
            input3 <= sw;
        elsif (BTNL = '1') then 
            flag4<='1';
            input4 <= sw;
        elsif (BTND = '1') then
            flag5<='1';
            input5 <= sw; 
       elsif (BTNU = '1') then 
            flag6<='1';
            input6 <= sw;
        elsif (BTNC = '1') then 
           flag7<='1';
           input7 <= sw; 
      end if;   
      
    end if;
end process;

end Behavioral;
