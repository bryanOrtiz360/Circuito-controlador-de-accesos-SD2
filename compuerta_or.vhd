library ieee;
use ieee.std_logic_1164.all;

entity compuerta_or is
	PORT(A,B: in std_logic;
			  C: out std_logic);
end compuerta_or;

architecture funcion_logica of compuerta_or is
begin
	C<=A or B;
	
end funcion_logica;
