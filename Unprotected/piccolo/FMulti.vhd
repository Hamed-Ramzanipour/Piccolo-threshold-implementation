LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FMulti IS
	GENERIC ( count : POSITIVE; 
	          Table : STD_LOGIC_VECTOR (63 DOWNTO 0));
	PORT ( input:  IN  STD_LOGIC_VECTOR (4*count-1 DOWNTO 0);
			 output: OUT STD_LOGIC_VECTOR (4*count-1 DOWNTO 0));
END FMulti;

ARCHITECTURE behavioral OF FMulti IS
BEGIN

	GEN :
	FOR i IN 0 TO count-1 GENERATE
		LFInst: ENTITY work.LookUp4x16
		Generic Map ( Table => Table)
		Port Map (
			input		=> input ((i+1)*4-1 downto i*4),
			output	=> output((i+1)*4-1 downto i*4));
			
	END GENERATE;
			
END behavioral;