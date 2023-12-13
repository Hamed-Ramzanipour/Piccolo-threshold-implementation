library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity KeyPermutation is
	port(
		data_in	: in  std_logic_vector(127 downto 0);
		data_out : out std_logic_vector(127 downto 0));
end entity KeyPermutation;

architecture behavioral of KeyPermutation is
begin

	data_out <=	data_in(66 downto 0) & data_in(127 downto 67);
					
end architecture behavioral;