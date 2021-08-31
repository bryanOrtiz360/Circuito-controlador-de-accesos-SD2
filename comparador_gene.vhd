library ieee;
use ieee.std_logic_1164.all;

ENTITY comparador_gene is
	generic(n:integer:=4);
	PORT(A,B: in std_logic_vector(n-1 downto 0);
		  AGB, ALB, AEB: out std_logic);

end comparador_gene;

ARCHITECTURE funcionamiento of comparador_gene is
begin
	AGB<='1' WHEN (A>B) ELSE '0';
	ALB<='1' WHEN (A<B) ELSE '0';
	AEB<='1' WHEN (A=B) ELSE '0';

end funcionamiento;

