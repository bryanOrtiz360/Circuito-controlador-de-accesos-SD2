library ieee;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY registro_sost is
	generic(n:integer:=4);
	PORT(Clock, Resetn: in std_logic;
			         En : in std_logic;                        -- entrada habilitadora
			     Entrada: in std_logic_vector(n-1 downto 0);
			          Q : out std_logic_vector(n-1 downto 0));
END registro_sost;

ARCHITECTURE funcionamiento of registro_sost is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then Q<= (others => '0');
		elsif (Clock'event and Clock ='1') then 
			if En='1' THEN 
				Q <= Entrada;
			end if; end if;
	end process;
end funcionamiento;

