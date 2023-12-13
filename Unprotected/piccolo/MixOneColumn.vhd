library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.functions.all;

ENTITY MixOneColumn IS
	PORT ( s0  : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			 s1  : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			 s2  : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			 s3  : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			 r0  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			 r1  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			 r2  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			 r3  : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END MixOneColumn;

ARCHITECTURE behavioral OF MixOneColumn IS	
	signal v0_0, v0_1, v0_2, v0_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	signal v1_0, v1_1, v1_2, v1_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	signal v2_0, v2_1, v2_2, v2_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	signal v3_0, v3_1, v3_2, v3_3 : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN


	GEN :
	FOR BitNumber IN 0 TO 3 GENERATE
		v0_0Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"2", BitNumber))
		PORT Map (s0, v0_0(BitNumber));

		v0_1(BitNumber) <= s0(BitNumber); -- MUL by 1

		v0_2(BitNumber) <= s0(BitNumber); -- MUL by 1

		v0_3Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"3", BitNumber))
		PORT Map (s0, v0_3(BitNumber));
		
		------
		
		v1_0Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"3", BitNumber))
		PORT Map (s1, v1_0(BitNumber));

		v1_1Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"2", BitNumber))
		PORT Map (s1, v1_1(BitNumber));

		v1_2(BitNumber) <= s1(BitNumber); -- MUL by 1

		v1_3(BitNumber) <= s1(BitNumber); -- MUL by 1
		
		------

		v2_0(BitNumber) <= s2(BitNumber); -- MUL by 1

		v2_1Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"3", BitNumber))
		PORT Map (s2, v2_1(BitNumber));

		v2_2Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"2", BitNumber))
		PORT Map (s2, v2_2(BitNumber));

		v2_3(BitNumber) <= s2(BitNumber); -- MUL by 1
		
		------

		v3_0(BitNumber) <= s3(BitNumber); -- MUL by 1

		v3_1(BitNumber) <= s3(BitNumber); -- MUL by 1

		v3_2Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"3", BitNumber))
		PORT Map (s3, v3_2(BitNumber));

		v3_3Inst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeGF16_MulTable( x"2", BitNumber))
		PORT Map (s3, v3_3(BitNumber));
			
	END GENERATE;
	
	------------------------------------------
	
	r0Inst: ENTITY work.XOR_4n
	GENERIC Map (size => 4, count => 1)
	PORT Map (v0_0, v1_0, v2_0, v3_0, r0);
	
	r1Inst: ENTITY work.XOR_4n
	GENERIC Map (size => 4, count => 1)
	PORT Map (v0_1, v1_1, v2_1, v3_1, r1);

	r2Inst: ENTITY work.XOR_4n
	GENERIC Map (size => 4, count => 1)
	PORT Map (v0_2, v1_2, v2_2, v3_2, r2);

	r3Inst: ENTITY work.XOR_4n
	GENERIC Map (size => 4, count => 1)
	PORT Map (v0_3, v1_3, v2_3, v3_3, r3);
	
END behavioral;
