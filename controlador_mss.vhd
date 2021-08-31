library ieee;
use ieee.std_logic_1164.all;

ENTITY controlador_mss is 	 
	PORT(                           Resetn, Clock : in std_logic;
		                    Start, OR_10, Open_door: in std_logic;
		   EN_comparar1, EN_comparar2, EN_comparar3: in std_logic;
		  EN_comparar4, Error, ACT_alarma, Sensor_H: in std_logic;
		                         ACT_alar_open_door: in std_logic;
		     ENA_num1, ENA_num2, ENA_num3, ENA_num4: out std_logic;
		             EN_contador, Puerta_H, Error_H: out std_logic;
		       ENA_conta_error, Alarma_H, Alarma_1 : out std_logic;
		               Pantalla, EN_conta_open_door: out std_logic;
							LD_contador, LD_conta_error: out std_logic);

END controlador_mss;

ARCHITECTURE comportamiento of controlador_mss is
type state is(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S);
signal y: state;
begin

PROCESS(Resetn, Clock)
	BEGIN
		if resetn='0' then y<=A;
			elsif(clock'event and clock='1') then
			case y is
			
				when A=> if start='0' then y<= A;
							else y<=B; end if;
				when B=> if start='1' then y<= B;
							else y<= C; end if;
				when C=> if OR_10='1' then y<= D;
							else y<= C; end if;
				when D=> if OR_10='1' then y<=D;
							else y<= E; end if;
				
				when E=>	if EN_comparar1='1' then y<= F;
							else y<= F; end if;
				when F=> if OR_10='1' then y<= G;
							else y<= F; end if;
				when G=> if OR_10='1' then y<=G;
							else y<= H; end if;
				when H=>	if EN_comparar2='1' then y<= I;
							else y<= I; end if;
				when I=> if OR_10='1' then y<= J;
							else y<= I; end if;
				when J=> if OR_10='1' then y<= J;
							else y<= K; end if;
				when K=> if EN_comparar3='1' then y<= L;
							else y<= L; end if;
				when L=> if OR_10='1' then y<= M;
							else y<= L; end if;
				when M=> if OR_10='1' then y<= M;
							else y<= N; end if;
				when N=> if EN_comparar4='1' then y<= O;
							else y<= O; end if;
				
				when O=> if Open_door='1' then y<= R;
							else y<= P; end if;
							
				when P=> if Error='1'  then y<= Q;
							else y<= O; end if;
				
				when Q=> if ACT_alarma='1' then y<= C;
							else y<= C; end if;
				
				when R=> if Sensor_H='1' and ACT_alar_open_door='0' then y<= R;
							elsif Sensor_H='1' and ACT_alar_open_door='1' then y<= S;
							elsif Sensor_H='0' and ACT_alar_open_door='0' then y<= A;
							else y<= A; end if;
				
				when S=> y<= A;
				
			END CASE;
		END IF;
END PROCESS;

PROCESS(y, Start, OR_10,Open_door, EN_comparar1,EN_comparar2,EN_comparar3,EN_comparar4,ERROR, ACT_alarma,Sensor_H,ACT_alar_open_door)
BEGIN
	ENA_num1<='0'; ENA_num2<='0'; ENA_num3<='0'; ENA_num4<='0'; EN_contador<='0'; Puerta_H<='0';
	Error_H<='0'; ENA_conta_error<='0'; Alarma_H<='0'; Alarma_1<='0'; Pantalla<='0'; EN_conta_open_door<='0';
	LD_conta_error<='0'; LD_contador<='0'; 
	
	CASE y is
		
		
		when D=> if OR_10='1' then ENA_num1<='1'; end if;
					
		when E=> if EN_comparar1='1' then En_contador<='1'; end if;
		
		when G=> if OR_10='1'then ENA_num2<='1'; end if;
		
		when H=> if EN_comparar2='1' then EN_contador<='1'; end if;
		
		when J=> if OR_10='1' then ENA_num3<='1'; end if;
		
		when K=> if EN_comparar3='1' then EN_contador<='1'; end if;
		
		when M=> if OR_10='1' then ENA_num4<='1'; end if;
		
		when N=> if EN_comparar4='1' then EN_contador<='1'; end if;
		
		when Q=> Error_H<='1'; ENA_conta_error<='1'; EN_contador<='1'; LD_contador<='1';
					if ACT_alarma='1' then Alarma_H<='1'; end if;
		
		
		when R=> Puerta_H<='1'; ENA_conta_error<='1'; LD_conta_error<='1';
					if (Sensor_H='1'and ACT_alar_open_door='0') then EN_conta_open_door<='1'; end if;
					
		when S=> Alarma_H<='1'; Alarma_1<='1'; Pantalla<='1';
		
		when others=> ENA_num1<='0'; ENA_num2<='0'; ENA_num3<='0'; ENA_num4<='0'; EN_contador<='0'; Puerta_H<='0';
	Error_H<='0'; ENA_conta_error<='0'; Alarma_1<='0'; Pantalla<='0'; EN_conta_open_door<='0';
	LD_conta_error<='0'; LD_contador<='0'; 
	
	END CASE;
END PROCESS;
END comportamiento;

		
		
				
		

	