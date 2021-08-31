library ieee;
use ieee.std_logic_1164.all;

entity compuerta_not is
	PORT(A: in std_logic;
			  C: out std_logic);
end compuerta_not;

architecture funcion_logica of compuerta_not is
begin
	C <= not(A) ;
	
end funcion_logica;
