----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:48 06/15/2021 
-- Design Name: 
-- Module Name:    SigGenSPIControl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SigGenSPIControl is
	Port ( Reset : in  STD_LOGIC;
				  SClk : in  STD_LOGIC;
				  Clk : in  STD_LOGIC;
				  MOSI : in  STD_LOGIC;
				  SS : in  STD_LOGIC;
				  BTN0 : in STD_LOGIC;
				  BTN1 : in STD_LOGIC;
				  BTN2 : in STD_LOGIC;
				  Disp : out STD_LOGIC_VECTOR (19 downto 0);
				  Shape : inout  STD_LOGIC_VECTOR (1 downto 0);
				  Ampl : inout  STD_LOGIC_VECTOR (7 downto 0);
				  Freq : inout  STD_LOGIC_VECTOR (7 downto 0);
				  Error : out  STD_LOGIC;
				  SigEn : out STD_LOGIC;
				  Done : out STD_LOGIC);
end SigGenSPIControl;

architecture Behavioral of SigGenSPIControl is

signal ShapeEn, FreqEn, AmplEn, CheckEn, DataEn, AdrEn, DoneEn, ErrorEn : STD_LOGIC;
signal SSD, SSD2, BTN0db, BTN1db, BTN2db : STD_LOGIC;
signal DataCon, SPIdata, Adr, Data, Check : STD_LOGIC_VECTOR(7 downto 0);
signal DispSel : STD_LOGIC_VECTOR (1 downto 0);
type Statetype is (Run, Address, ShapeState, Amplitude, Frequency, DataState, CheckState,
		ShapeShow, AmplShow, FreqShow, AddressNOT, DataNOT, CheckNOT, ErrorState, CompState);
signal State, Nextstate: Statetype; 

component BTNdb
  port( Reset, Clk: in std_logic;
        BTNin: in std_logic;
        BTNout: out std_logic);
end component;

begin

	StateReg : process (Reset, Clk)	--Tilstandsregister
	begin
		if Reset = '1' then State <= Run;
		elsif rising_edge(Clk) then 
			State <= Nextstate;
		end if; 
	end process; 

	StateDec: process (SPIdata, SSD2, Adr, State, Data, Check, BTN0db, BTN1db, BTN2db) --Tilstansdekoder
	variable CheckSum : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
	begin
		ShapeEN <= '0';
		AmplEN <= '0';
		FreqEN <= '0';
		AdrEn <= '0';
		DataEn <= '0';
		CheckEN <= '0';
		ErrorEn <= '0';
		SigEn <= '0';
		DoneEn <= '0';
		DispSel <= "00";
			case State is
			
				when Run =>				--Tilstand for afsending af PWM
				SigEn <= '1';
				DispSel <= "00";
					if SPIdata = "10101010" and SSD2 = '1' then 
						Nextstate <= AddressNOT;
					elsif BTN2db = '1' then 
						Nextstate <= ShapeShow;
					else
						Nextstate <= State; 
					end if;
				
				when Address =>		--Tilstand for at gemme adresse
					if SSD2 = '1' then 
						AdrEn <= '1';
						Nextstate <= DataNOT;
					else 
						Nextstate <= State;
					end if;

				when ShapeState => 	--Tilstand for at gemme signalform
						ShapeEn <= '1';
						DoneEn <= '1';
						Nextstate <= Run;

				when Amplitude =>		--Tilstand for at gemme amplitude
						AmplEn <= '1';
						DoneEn <= '1';
						Nextstate <= Run;
					
				when Frequency =>		--Tilstand for at gemme frekvens
						FreqEn <= '1';
						DoneEn <= '1';
						Nextstate <= Run;
					
				when DataState =>		--Tilstand for at gemme data
					if SSD2 = '1' then
						DataEn <= '1';
						Nextstate <= CheckNOT;
					else
						Nextstate <= State;
					end if;
					
				when CheckState =>	--Tilstand for at gemme checksum
					if SSD2 = '1' then 
						CheckEn <= '1';
						Nextstate <= Compstate;
					else
						Nextstate <= State;
					end if; 

				when CompState =>  	--Tilstand for at tjekke gyldigheden af modtagning
					CheckSum := ("10101010" xor Adr) xor Data;
					if CheckSum = Check then
						if Adr = "00000001" then 
							Nextstate <= ShapeState; 
						elsif Adr = "00000010" then 
							Nextstate <= Amplitude; 
						elsif Adr = "00000011" then 
							Nextstate <= Frequency;
						else 
							Nextstate <= ErrorState;
						end if;
					else
						Nextstate <= ErrorState;
					end if;
				
				when ErrorState =>	--Tilstand for fejl af modtagning
					ErrorEn <= '1';
					Nextstate <= Run;
					
				when AddressNOT =>	--Tilstand for at vente på SS bliver lav
					if SSD2 = '0' then
						Nextstate <= Address;
					else 
						Nextstate <= State;
					end if;
					
				when DataNOT =>		--Tilstand for at vente på SS bliver lav
					if SSD2 = '0' then
						Nextstate <= DataState;
					else 
						Nextstate <= State;
					end if;
					
				when CheckNOT =>		--Tilstand for at vente på SS bliver lav
					if SSD2 = '0' then
						Nextstate <= CheckState;
					else 
						Nextstate <= State;
					end if;
						
				when ShapeShow =>		--Tilstand for at vise signalform på display
					SigEn <= '1';
					DispSel <= "01";
					if BTN0db = '1' then 
						Nextstate <= FreqShow;
					elsif BTN1db = '1' then 
						Nextstate <= AmplShow;
					elsif BTN2db = '1' then 
						Nextstate <= Run;
					else 
						Nextstate <= State; 
					end if;
					
				when AmplShow =>		--Tilstand for at vise amplitude på display
					SigEn <= '1';
					DispSel <= "10";
					if BTN0db = '1' then 
						Nextstate <= ShapeShow;
					elsif BTN1db = '1' then 
						Nextstate <= FreqShow;
					elsif BTN2db = '1' then 
						Nextstate <= Run;
					else 
						Nextstate <= State; 
					end if;
					
				when FreqShow =>		--Tilstand for at vise frekvens på display
					SigEn <= '1';
					DispSel <= "11";
					if BTN0db = '1' then 
						Nextstate <= AmplShow;
					elsif BTN1db = '1' then 
						Nextstate <= ShapeShow;
					elsif BTN2db = '1' then 
						Nextstate <= Run;
					else 
						Nextstate <= State; 
					end if;

					
			end case;
	end process;

		Data <= DataCon;		--En måde at bruge data som inout
		
		ShapeReg: process (Reset, Clk)		--Register for at gemme signalform
		begin
		  if Reset = '1' then Shape <= "00";
		  elsif Clk'event and Clk = '1' then
			 if ShapeEn = '1' then
				Shape <= DataCon(1 downto 0);
			 end if;
		  end if;
		end process;

		AmplReg: process (Reset, Clk)			--Register for at gemme amplitude
		begin
		  if Reset = '1' then Ampl <= X"00";
		  elsif Clk'event and Clk = '1' then
			 if AmplEn = '1' then
				Ampl <= DataCon;
			 end if;
		  end if;
		end process;

		FreqReg: process (Reset, Clk)			--Register for at gemme frekvens
		begin
		  if Reset = '1' then Freq <= X"00";
		  elsif Clk'event and Clk = '1' then
			 if FreqEn = '1' then
				Freq <= DataCon;
			 end if;
		  end if;
		end process;

		AdrReg: process (Reset, Clk)			--Register for at gemme adresse
		begin
		  if Reset = '1' then Adr <= X"00";
		  elsif Clk'event and Clk = '1' then
			 if AdrEn = '1' then
				Adr <= SPIdata;
			 end if;
		  end if;
		end process;

		DataReg: process (Reset, Clk)			--Register for at gemme data
		begin
		  if Reset = '1' then DataCon <= X"00";
		  elsif Clk'event and Clk = '1' then
			 if DataEn = '1' then
				DataCon <= SPIdata;
			 end if;
		  end if;
		end process;

		CheckReg: process (Reset, Clk)		--Register for at gemme checksum
		begin
		  if Reset = '1' then Check <= X"00";
		  elsif Clk'event and Clk = '1' then
			 if CheckEn = '1' then
				Check <= SPIdata;
			 end if;
		  end if;
		end process;

	ShiftReg: process(SClk, Reset)		--Skifteregister for modtagning
		begin
		if Reset = '1' then
			SPIData <= "00000000";
		elsif SClk'event and SClk = '1' then
			if SS = '0' then
				SPIData <= SPIData(6 downto 0) & MOSI ;
			end if;
		end if;
	end process;
	
	DoneReg: process(Clk, SPIdata, Reset, SSD2)		--Register for Done-signalet
	begin
		if Reset = '1' or (SPIdata = "10101010" and SSD2 = '1') then
			Done <= '0';
		elsif Clk'event and Clk = '1' then
			if DoneEn = '1' then
				Done <= '1';
			end if;
		end if;
	end process;
	
	ErrorReg: process(Clk, SPIdata, Reset, SSD2)		--Register for Error-signalet
	begin
		if Reset = '1' or (SPIdata = "10101010" and SSD2 = '1') then
			Error <= '0';
		elsif Clk'event and Clk = '1' then
			if ErrorEn = '1' then
				Error <= '1';
			end if;
		end if;
	end process;
	
	Puls: process(Reset, Clk, SS, SSD)					--Pulsregisteret
		begin
			if Reset = '1' then SSD <= '0';
			elsif rising_edge(Clk) then 
				SSD <= SS;
			end if;
		end process;
		
	SSD2 <= not SSD and SS;
		
	DispMux: Disp <= X"F1230" when DispSel = "00" else			--Multiplexer for display
            X"450" & "000000" & Shape when DispSel = "01" else
            X"4A0" & Ampl when DispSel = "10" else
            X"4F0" & Freq;
	
	--Debounce for knapper
	Deb0: BTNdb port map (Reset => Reset, Clk => Clk, BTNin => BTN0, BTNout => BTN0db);
	
	Deb1: BTNdb port map (Reset => Reset, Clk => Clk, BTNin => BTN1, BTNout => BTN1db);
	
	Deb2: BTNdb port map (Reset => Reset, Clk => Clk, BTNin => BTN2, BTNout => BTN2db);
			
end Behavioral;

