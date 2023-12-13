LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX2to1 IS
	PORT ( sel 	: IN  STD_LOGIC;
			 D0   : IN  STD_LOGIC;
			 D1 	: IN  STD_LOGIC;
			 Q 	: OUT STD_LOGIC);
END MUX2to1;

ARCHITECTURE behavioral OF MUX2to1 IS
BEGIN

	Q <= D0 when sel = '0' else D1;	
		
END;