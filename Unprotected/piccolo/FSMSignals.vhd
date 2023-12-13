library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.functions.all;

entity FSMSignals is
    Port ( FSM   					: in   STD_LOGIC_VECTOR (4 downto 0);
			  last  					: out  STD_LOGIC;
			  done  					: out  STD_LOGIC;
  			  WhiteningKeySel0	: out  STD_LOGIC;
			  WhiteningKeySel1	: out  STD_LOGIC;
			  KeySelLeft0			: out  STD_LOGIC;
			  KeySelLeft1			: out  STD_LOGIC;
			  KeySelRight0			: out  STD_LOGIC;
			  KeySelRight1			: out  STD_LOGIC);
end FSMSignals;

architecture Behavioral of FSMSignals is
begin

	lastInst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignallastTable)
	PORT Map (FSM, last);

	doneInst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignaldoneTable)
	PORT Map (FSM, done);

	WhiteningKeySel0Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalWhiteningKeySelTable(0))
	PORT Map (FSM, WhiteningKeySel0);

	WhiteningKeySel1Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalWhiteningKeySelTable(1))
	PORT Map (FSM, WhiteningKeySel1);

	KeySelLeft0Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalKeySelLeftTable(0))
	PORT Map (FSM, KeySelLeft0);

	KeySelLeft1Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalKeySelLeftTable(1))
	PORT Map (FSM, KeySelLeft1);

	KeySelRight0Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalKeySelRightTable(0))
	PORT Map (FSM, KeySelRight0);

	KeySelRight1Inst: ENTITY work.LookUp
	GENERIC Map (size => 5, Table => MakeSignalKeySelRightTable(1))
	PORT Map (FSM, KeySelRight1);

end Behavioral;
