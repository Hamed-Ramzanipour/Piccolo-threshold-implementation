library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY MC IS
	PORT ( state  : IN  STD_LOGIC_VECTOR (4*4-1 DOWNTO 0);
			 result : OUT STD_LOGIC_VECTOR (4*4-1 DOWNTO 0));
END MC;

ARCHITECTURE behavioral OF MC IS	
	signal s0, s1, s2, s3     : STD_LOGIC_VECTOR (4-1 DOWNTO 0);
	signal r0, r1, r2, r3     : STD_LOGIC_VECTOR (4-1 DOWNTO 0);

BEGIN

	s0 <= state(4*4-1   downto  4*3);
	s1 <= state(4*3-1   downto  4*2);
	s2 <= state(4*2-1   downto  4*1);
	s3 <= state(4*1-1   downto  4*0);

	------------------------------------------
	
	MC0: entity work.MixOneColumn
	PORT Map( s0, s1, s2, s3, r0, r1, r2, r3);

	------------------------------------------
	
	result <= r0 & r1 & r2 & r3;

END behavioral;
