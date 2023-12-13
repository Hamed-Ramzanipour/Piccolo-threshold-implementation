LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY KeyMUX IS
	GENERIC ( size : POSITIVE);
	PORT ( sel0 	: IN  STD_LOGIC;
			 sel1 	: IN  STD_LOGIC;
			 D0 	 	: IN  STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);
			 D1 	 	: IN  STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);
			 D2 	 	: IN  STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);
			 D3 	 	: IN  STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);
			 Q 	 	: OUT STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0));			 
END KeyMUX;

ARCHITECTURE behavioral OF KeyMUX IS

	signal Q1	: STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);
	signal Q2	: STD_LOGIC_VECTOR ((size*4-1) DOWNTO 0);

BEGIN

	MUX1: ENTITY work.MUX
	GENERIC Map ( size => size*4)
	PORT Map ( 
		sel	=> sel0,
		D0   	=> D0,
		D1 	=> D1,
		Q 		=> Q1);

	MUX2: ENTITY work.MUX
	GENERIC Map ( size => size*4)
	PORT Map ( 
		sel	=> sel0,
		D0   	=> D2,
		D1 	=> D3,
		Q 		=> Q2);

	MUX3: ENTITY work.MUX
	GENERIC Map ( size => size*4)
	PORT Map ( 
		sel	=> sel1,
		D0   	=> Q1,
		D1 	=> Q2,
		Q 		=> Q);
	
END;