----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 09:42:34 AM
-- Design Name: 
-- Module Name: Top_modul - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_modul is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (4 downto 0);
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           An : out STD_LOGIC_VECTOR (7 downto 0);
           Cat : out STD_LOGIC_VECTOR (6 downto 0));
end Top_modul;

architecture Behavioral of Top_modul is

component PWA is
    Port ( RESET : in STD_LOGIC;
       CLK : in STD_LOGIC;
       RW : in STD_LOGIC;
       DA, AA, BA : in STD_LOGIC_VECTOR (3 downto 0);
       MB, MD : in STD_LOGIC;
       FS0, FS1, FS2, FS3 : in STD_LOGIC;
       Constant_In : in STD_LOGIC_VECTOR (7 downto 0);
       Data_In : in STD_LOGIC_VECTOR (7 downto 0);
       Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
       Data_Out : out STD_LOGIC_VECTOR (7 downto 0);
       V, C, N, Z : out STD_LOGIC);
end component PWA;

component PWB is
    Port ( CLK, Reset : in STD_LOGIC;
       Address_In : in STD_LOGIC_VECTOR (7 downto 0);
       V, C, N, Z : in STD_LOGIC;
       Instruction_In : in STD_LOGIC_VECTOR (15 downto 0);
       DX, AX, BX, FS : out STD_LOGIC_VECTOR (3 downto 0);
       MB, MD, RW, MM, MW : out STD_LOGIC;
       Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
       Constant_Out : out STD_LOGIC_VECTOR (7 downto 0));
end component PWB;

component Ram256x16 is
    port( CLK, Reset : in STD_LOGIC;
      Data_In : in STD_LOGIC_VECTOR(15 downto 0);
      Address_In : in STD_LOGIC_VECTOR(7 downto 0);
      MW : in STD_LOGIC;
      Data_Out : out STD_LOGIC_VECTOR(15 downto 0));
end component Ram256x16;

component MUX2x1x8 is
    Port ( M : in STD_LOGIC;
       A : in STD_LOGIC_VECTOR (7 downto 0);
       B : in STD_LOGIC_VECTOR (7 downto 0);
       X : out STD_LOGIC_VECTOR (7 downto 0));
end component MUX2x1x8;

component SevenSeg4 is
    Port ( Rst,Clk: in  std_logic;    
      Data :   in  std_logic_vector (15 downto 0);
      cat :    out std_logic_vector(6 downto 0);
      an :     out std_logic_vector(7 downto 0));
end component SevenSeg4;

component DivClk is
    port ( Reset: in STD_LOGIC;
           Clk: in STD_LOGIC;
           TimeP: in integer;
           Clk1: out STD_LOGIC);
end component DivClk;



component port_register is
    Port ( 
        clk, MW, Reset: in STD_LOGIC;
        DATA_in, Address_in, SW : in STD_LOGIC_VECTOR(7 downto 0);
        BTNC, BTNU, BTNL,BTNR, BTND: in STD_LOGIC;   --BTNC=BTNS
        MMR: out STD_LOGIC;
        D_word, Data_outR: out  STD_LOGIC_VECTOR(15 downto 0);
        LED: out STD_LOGIC_VECTOR(7 downto 0));
end component port_register;

--component Debounce is
-- Port ( Reset : in  STD_LOGIC;
--          Clk : in  STD_LOGIC;
--          BTN : in  STD_LOGIC;
--          BTNd : out  STD_LOGIC);
--          end component Debounce;

signal Resetcon : STD_LOGIC;
signal RWcon : STD_LOGIC;
signal DAcon : STD_LOGIC_VECTOR(3 downto 0);
signal AAcon : STD_LOGIC_VECTOR(3 downto 0);
signal BAcon : STD_LOGIC_VECTOR(3 downto 0);
signal MBcon : STD_LOGIC;
signal MDcon : STD_LOGIC;
signal MMcon : STD_LOGIC;
signal MWcon : STD_LOGIC;
signal MMRcon : STD_LOGIC;
signal FScon : STD_LOGIC_VECTOR(3 downto 0);
signal Constantcon : STD_LOGIC_VECTOR (7 downto 0);
signal Instructioncon : STD_LOGIC_VECTOR (15 downto 0);
signal AddressIncon : STD_LOGIC_VECTOR (7 downto 0);
signal AddressOutcon : STD_LOGIC_VECTOR (7 downto 0);
signal AddressMulcon : STD_LOGIC_VECTOR (7 downto 0);
signal DataIncon : STD_LOGIC_VECTOR (7 downto 0);
signal DataOutcon : STD_LOGIC_VECTOR (7 downto 0);
signal DataMulMcon : STD_LOGIC_VECTOR (15 downto 0);
signal DataMulRcon : STD_LOGIC_VECTOR (15 downto 0);
signal Statuscon : STD_LOGIC_VECTOR(3 downto 0);
signal CLKdivide : STD_LOGIC;
signal ZeroFilled_16 : STD_LOGIC_VECTOR(15 downto 0);
signal Dwordcon : STD_LOGIC_VECTOR(15 downto 0);
signal timing: STD_LOGIC;
signal CLKdivideDis: STD_LOGIC;
signal BTNRsig: STD_LOGIC;
begin

    Datapath : PWA port map(
    RESET => Resetcon,
    CLK => CLKdivide,
    RW => RWcon,
    DA => DAcon,
    AA => AAcon,
    BA => BAcon,
    MB => MBcon,
    MD => MDcon,
    FS0 => FScon(0),
    FS1 => FScon(1),
    FS2 => FScon(2),
    FS3 => FScon(3),
    Constant_In => Constantcon,
    Data_In => DataIncon,
    Address_Out => AddressIncon,    
    Data_Out => DataOutcon,
    V => Statuscon(0),
    C => Statuscon(1),
    N => Statuscon(2),
    Z => Statuscon(3));

    Control : PWB port map(
    CLK => CLKdivide,
    Reset => Resetcon,
    Address_In => AddressIncon,
    V => Statuscon(0),
    C => Statuscon(1),
    N => Statuscon(2),
    Z => Statuscon(3),
    Instruction_In => Instructioncon,
    DX => DAcon,
    AX => AAcon,
    BX => BAcon,
    FS => FScon,
    MB => MBcon,
    MD => MDcon,
    RW => RWcon,
    MM => MMcon,
    MW => MWcon,
    Address_Out => AddressOutcon,
    Constant_Out => Constantcon);
    
    timing<= NOT (CLK);
    
    RAM : Ram256x16 port map(
    CLK => timing,
    Reset => Resetcon,
    Data_In => ZeroFilled_16,
    Address_In => AddressMulcon,
    MW => MWcon,
    Data_Out => DataMulMcon);

    Zerofiller : ZeroFilled_16 <= "00000000" & DataOutcon;
    
    MUX_M : MUX2x1x8 port map(
    M => MMcon,
    A => AddressIncon,
    B => AddressOutcon,
    X => AddressMulcon);

    MUX_MR1 : MUX2x1x8 port map(
    M => MMRcon,
    A => DataMulMcon(7 downto 0),
    B => DataMulRcon(7 downto 0),
    X => Instructioncon(7 downto 0));
    
    MUX_MR2 : MUX2x1x8 port map(
    M => MMRcon,
    A => DataMulMcon(15 downto 8),
    B => DataMulRcon(15 downto 8),
    X => Instructioncon(15 downto 8));
    
    Display : SevenSeg4 port map(
    Rst => Resetcon,
    Clk => clkdivideDis,
    Data => Dwordcon,
    cat => Cat,
    an => An);
    
    Divider : DivClk port map(
    Reset => Resetcon,
    Clk => CLK,
    TimeP => 2,
    Clk1 => CLKdivide);
    
    Dividerdiplay : DivClk port map(
    Reset => Resetcon,
    Clk => CLK,
    TimeP => 100000,
    Clk1 => CLKdivideDis);
    
    Portreg : port_register port map(
    clk => CLK,
    MW => MWcon,
    Reset => Resetcon,
    DATA_in => DataOutcon,
    Address_in => AddressMulcon,
    SW => SW,
    BTNC => BTN(0),
    BTNU => BTN(1),
    BTNL => BTN(2),
    BTNR => BTN(3),
    BTND => BTN(4),
    MMR => MMRcon,
    D_word => Dwordcon,
    Data_outR => DataMulRcon,
    LED => LED);
    
    DataIncon <= Instructioncon(7 downto 0);
    
    Resetcon <= NOT (Reset);
    
end Behavioral;
