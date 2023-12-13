LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY WhiteningKeyMUX IS
	GENERIC ( size : POSITIVE);
	PORT ( sel0 	: IN  STD_LOGIC;
			 sel1 	: IN  STD_LOGIC;
			 D0 	 	: IN  STD_LOGIC_VECTOR ((size*8-1) DOWNTO 0);
			 D1 	 	: IN  STD_LOGIC_VECTOR ((size*8-1) DOWNTO 0);
			 Q 	 	: OUT STD_LOGIC_VECTOR ((size*8-1) DOWNTO 0));			 
END WhiteningKeyMUX;

ARCHITECTURE behavioral OF WhiteningKeyMUX IS

	signal Q1,allZero : STD_LOGIC_VECTOR ((size*8-1) DOWNTO 0);

BEGIN

	MUX1: ENTITY work.MUX
	GENERIC Map ( size => size*8)
	PORT Map ( 
		sel	=> sel0,
		D0   	=> D0,
		D1 	=> D1,
		Q 		=> Q1);

	allZero	<= (others => '0');

	MUX2: ENTITY work.MUX
	GENERIC Map ( size => size*8)
	PORT Map ( 
		sel	=> sel1,
		D0   	=> Q1,
		D1 	=> allZero,
		Q 		=> Q);
	
END;
