library ieee;
use ieee.std_logic_1164.all;

entity mux2a_1 is
	generic(n:integer:=7); 
	port(I_0, I_1 : in std_logic_vector(n-1 downto 0);
			sel : in std_logic;
				Z: out std_logic_vector(n-1 downto 0));

end mux2a_1;

architecture comport of mux2a_1 is
begin
process(I_0,I_1,sel)
	begin
		if (sel='0') then z<=I_0;
		else z<=I_1;
		end if;
end process;
end comport;
