library ieee;
use ieee.std_logic_1164.all;

entity compuerta_and is
	PORT(A,B: in std_logic;
			  C: out std_logic);
end compuerta_and;

architecture funcion_logica of compuerta_and is
begin
	C<=A and B;
	
end funcion_logica;
