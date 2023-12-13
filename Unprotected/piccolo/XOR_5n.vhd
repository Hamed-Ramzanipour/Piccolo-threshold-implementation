LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR_5n IS
	GENERIC ( size  : POSITIVE;
				 count : POSITIVE);
	PORT ( in0 	 : IN  STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
			 in1 	 : IN  STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
			 in2 	 : IN  STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
			 in3 	 : IN  STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
			 in4 	 : IN  STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
			 q 	 : OUT STD_LOGIC_VECTOR ((size*count-1) DOWNTO 0);
		    const : IN  STD_LOGIC_VECTOR ((size-1)       DOWNTO 0) := (others => '0'));			 
END XOR_5n;

ARCHITECTURE behavioral OF XOR_5n IS
BEGIN

	GEN1:
	FOR j IN 0 TO count-1 GENERATE
		GEN2:
		FOR i IN 0 TO size-1 GENERATE
			XORInst: ENTITY work.XOR_5
			Port Map (
				in0	=> in0(j*size+i),
				in1	=> in1(j*size+i),
				in2	=> in2(j*size+i),
				in3	=> in3(j*size+i),
				in4	=> in4(j*size+i),
				q		=> q(j*size+i),
				const => const(i));
		END GENERATE;
	END GENERATE;
	
END;