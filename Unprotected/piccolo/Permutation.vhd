library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Permutation is
	GENERIC ( size: POSITIVE);
	port(
		data_in	: in  std_logic_vector(16*size-1 downto 0);
		data_out : out std_logic_vector(16*size-1 downto 0));
end entity Permutation;

architecture behavioral of Permutation is
	signal s0, s1, s2, s3     : STD_LOGIC_VECTOR (2*size-1 DOWNTO 0);
	signal s4, s5, s6, s7     : STD_LOGIC_VECTOR (2*size-1 DOWNTO 0);

BEGIN

	s0	 <= data_in(size*16-1  downto  size*14);
	s1	 <= data_in(size*14-1  downto  size*12);
	s2	 <= data_in(size*12-1  downto  size*10);
	s3	 <= data_in(size*10-1  downto   size*8);
	s4	 <= data_in( size*8-1  downto   size*6);
	s5	 <= data_in( size*6-1  downto   size*4);
	s6	 <= data_in( size*4-1  downto   size*2);
	s7	 <= data_in( size*2-1  downto       0);

	data_out <= s2 & s7 & s4 & s1 & s6 & s3 & s0 & s5;
					
end architecture behavioral;