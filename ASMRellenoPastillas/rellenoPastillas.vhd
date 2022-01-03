library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity rellenoPastillas is
    Port ( clk, SensorA, SensorB, SensorC : in  STD_LOGIC;
				pastillas : inout integer;
           ValvulaA, ValvulaB, ValvulaC, motorCinta : out  STD_LOGIC;
           Q2, Q1, Q0 : inout  STD_LOGIC);
end rellenoPastillas;

architecture arq_relleno of rellenoPastillas is
type estados is (A, B, C, D, E, F, G);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, SensorA, SensorB, SensorC, pastillas)
begin
case edo_pres is
when A => ValvulaA <= '0'; ValvulaB <= '0'; ValvulaC <= '0'; motorCinta <= '0'; pastillas <= 0; Q2 <= '0'; Q1 <= '0'; Q0 <= '0'; 											
	edo_fut <= B;
when B => ValvulaA <= '1'; ValvulaB <= '0'; ValvulaC <= '0'; motorCinta <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '1'; 												
	if SensorA = '1' then
	if pastillas = 10 then 	
	edo_fut <= C;
	else 
	edo_fut <= B;
	end if;
	end if;
when C => ValvulaA <= '0'; ValvulaB <= '0'; ValvulaC <= '0'; motorCinta <= '1'; pastillas <= 10 ;Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 	
	edo_fut <= D;
when D => ValvulaA <= '0'; ValvulaB <= '1'; ValvulaC <= '0'; motorCinta <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 
	if SensorB = '1' then
	if pastillas = 10 then
	edo_fut <= E;
	else 	
	edo_fut <= D;
	end if;
	end if;
when E => ValvulaA <= '0'; ValvulaB <= '0'; ValvulaC <= '0'; motorCinta <= '1'; pastillas <= 10; Q2 <= '1'; Q1 <= '0'; Q0 <= '0'; 
	edo_fut <= F;
when F => ValvulaA <= '0'; ValvulaB <= '0'; ValvulaC <= '1'; motorCinta <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '1'; 
	if SensorC = '1' then
	if pastillas = 10 then	
	edo_fut <= G;
	else 
	edo_fut <= F;
	end if;
	end if;
when G => ValvulaA <= '0'; ValvulaB <= '0'; ValvulaC <= '0'; motorCinta <= '1'; Q2 <= '1'; Q1 <= '1'; Q0 <= '0'; 
	edo_fut <= A;
end case;
end process p_estados;
p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			edo_pres <= edo_fut;
	end if;
end process;
end arq_relleno;

