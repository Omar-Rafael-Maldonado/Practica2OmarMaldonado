library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RemachadorElec is
    Port ( CP,MENOR,IGUAL, PDR,CR, CLK : in  STD_LOGIC;
           RESET, MAPA, SAL2, SALPDR, SALCR,CTRL,LOAD : out  STD_LOGIC);
			  
end RemachadorElec;

architecture ARQ_RemachadorElec of RemachadorElec is
	type estados is(a,b,c,d,e,f,g);
	signal edo_pres, edo_fut:estados;

begin
	p_estados:process (edo_pres,CP,MENOR,IGUAL, PDR,CR)
begin
case edo_pres is
	when a => RESET <='1'; MAPA<='0';SAL2<='0';SALPDR<='0';SALCR<='0';CTRL<='0';LOAD<='0';
		if CP='1' then 
			edo_fut<=b;
			else edo_fut<=a;
		end if;
	when b => RESET <='0'; MAPA<='1';SAL2<='0';SALPDR<='0';SALCR<='0';CTRL<='0';LOAD<='0';
		if CP='1' then 
			edo_fut<=b;
			else edo_fut<=c;
		end if;
	when c => RESET <='0'; MAPA<='0';SAL2<='1';SALPDR<='0';SALCR<='0';CTRL<='0';LOAD<='0';
		if MENOR='1' then 
			edo_fut<=a;
		elsif IGUAL='1' then
			edo_fut<=D;
							
		else edo_fut<=f;
		end if;
		when d => RESET <='0'; MAPA<='0';SAL2<='0';SALPDR<='1';SALCR<='0';CTRL<='0';LOAD<='0';
				if PDR='0' then 
					edo_fut<=d;
				else edo_fut<=e;
				end if;
		when e => RESET  <='0'; MAPA<='0';SAL2<='0';SALPDR<='0';SALCR<='0';CTRL<='1';LOAD<='0';

				edo_fut<=a;
		when f => RESET <='0'; MAPA<='0';SAL2<='0';SALPDR<='0';SALCR<='1';CTRL<='0';LOAD<='0';
	
				if PDR='0' then 
					edo_fut<=d;
				else edo_fut<=g;
				end if;
		when g => RESET  <='1'; MAPA<='0';SAL2<='0';SALPDR<='0';SALCR<='0';CTRL<='0';LOAD<='1';
				edo_fut<=a;

	end case;
	end process p_estados;
	
	p_reloj: process (CLK) begin
		if(CLK'EVENT and CLK='1') then
			edo_pres<= edo_fut;
			end if;
			end process p_reloj;

end ARQ_RemachadorElec;

