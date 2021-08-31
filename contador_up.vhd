library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY contador_up is
	generic(m:integer:=4);
	port(Resetn, Clock, En_cont, Ld_cont: in std_logic;
		                   Entrada_conta : in std_logic_vector(m-1 downto 0);
		                    Salida_conta : buffer std_logic_vector(m-1 downto 0));
end contador_up;

ARCHITECTURE comportamiento of contador_up is
begin
	process(Resetn, Clock)
	begin
		if Resetn='0' then Salida_conta <= (others=>'0');
		elsif (Clock'event and Clock ='1') then 
			if En_cont ='1' then
				if Ld_cont='1' then Salida_conta <= Entrada_conta;
					else Salida_conta <= Salida_conta +'1';
				end if;
			end if;
		end if;
	end process;
end comportamiento;
