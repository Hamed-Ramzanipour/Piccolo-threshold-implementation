library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.functions.all;

entity StateUpdate is
    Port ( FSM       : in  STD_LOGIC_VECTOR (4 downto 0);
           FSMUpdate : out STD_LOGIC_VECTOR (4 downto 0));
end StateUpdate;

architecture Behavioral of StateUpdate is
begin

	GEN :
	FOR i IN 0 TO 4 GENERATE
		StateUpdateInst: ENTITY work.LookUp
		GENERIC Map (size => 5, Table => MakeStateUpdateTable(i))
		PORT Map (FSM, FSMUpdate(i));
	END GENERATE;

end Behavioral;