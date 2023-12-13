LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR_5 IS
	PORT ( in0 	 : IN  STD_LOGIC;
			 in1 	 : IN  STD_LOGIC;
			 in2 	 : IN  STD_LOGIC;
			 in3 	 : IN  STD_LOGIC;
			 in4 	 : IN  STD_LOGIC;
			 Q 	 : OUT STD_LOGIC;
			 const : IN  STD_LOGIC := '0');
END XOR_5;

ARCHITECTURE behavioral OF XOR_5 IS
BEGIN

	Q	<= in0 XOR in1 XOR in2 XOR in3 XOR in4 XOR const;
	
END;