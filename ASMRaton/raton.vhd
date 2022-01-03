library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity raton is
    Port ( x, clk: in  STD_LOGIC;
           z1, z2 : out  STD_LOGIC;
			  z : inout STD_LOGIC;
           Q1, Q0 : inout  STD_LOGIC);
end raton;

architecture arq_raton of raton is
type estados is (A, B, C, D);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, x)
begin
case edo_pres is
when A => z1 <= '0'; z2<= '0'; Q1 <= '0'; Q0 <= '0'; 											
	if x = '1' then
	edo_fut <= A;
	else 
	edo_fut <= B;
	end if;
when B => z1 <= '1'; z2<= '0'; Q1 <= '0'; Q0 <= '1'; 											
	if z = '1' then 	
	edo_fut <= C;
	else 
	edo_fut <= D;
	end if;
when C => z1 <= '0'; z2<= '0'; Q1 <= '1'; Q0 <= '0'; 	
	edo_fut <= A;
when D => z1 <= '0'; z2<= '1'; Q1 <= '1'; Q0 <= '1'; 
	edo_fut <= A;
end case;
end process p_estados;
p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			if z = '0' then 
			z <= '1';
			else 
			z <= '0';
			end if;
			edo_pres <= edo_fut;
	end if;
end process;
end arq_raton;

