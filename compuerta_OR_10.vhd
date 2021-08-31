library ieee;
use ieee.std_logic_1164.all;

entity compuerta_OR_10 is
	PORT(A,B,C,D,E,F,G,H,I,J : in std_logic;
			             salida: out std_logic);
end compuerta_OR_10;

architecture funcion_logica of compuerta_OR_10 is
begin

	salida<= A OR B OR C OR D OR E OR F OR G OR H OR I OR J;
end funcion_logica;
