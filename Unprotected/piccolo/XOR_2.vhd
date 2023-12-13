LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR_2 IS
	PORT ( in0 	 : IN  STD_LOGIC;
			 in1 	 : IN  STD_LOGIC;
			 Q 	 : OUT STD_LOGIC;
			 const : IN  STD_LOGIC := '0');
END XOR_2;

ARCHITECTURE behavioral OF XOR_2 IS
BEGIN

	Q	<= in0 XOR in1 XOR const;
	
END;
