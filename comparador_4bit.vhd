library ieee;
use ieee.std_logic_1164.all;

ENTITY comparador_4bit is
	port( A,B: in std_logic_vector(3 downto 0);
			AGB, ALB, AEB: out std_logic);

end comparador_4bit;

ARCHITECTURE funci of comparador_4bit is
begin
	AGB<='1' when (A>B) else '0';
	ALB<='1' when (A<B) else '0';
	AEB<='1' when (A=B) else '0';
end funci;
