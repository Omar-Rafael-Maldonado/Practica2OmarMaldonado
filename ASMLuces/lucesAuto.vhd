library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity lucesAuto is
    Port ( izq, vuelta, clk : in  STD_LOGIC;
           L1, L2, L3, R1, R2, R3 : out  STD_LOGIC;
           Q2, Q1, Q0 : inout  STD_LOGIC);
end lucesAuto;
architecture arq_luces of lucesAuto is
type estados is (A, B, C, D, E, F, G ,H);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, izq, vuelta)
begin
case edo_pres is
when A =>  L3 <= '0'; L2 <= '0'; L1 <= '0'; R3 <= '0'; R2 <= '0'; R1 <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '0'; 
	if vuelta = '1' then 															
	edo_fut <= B;
	else 
	edo_fut <= A;
	end if;
when B => L3 <= '0'; L2 <= '0'; L1 <= '0'; R3 <= '0'; R2 <= '0'; R1 <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '1'; 															--estado uno
	if izq = '1' then 															
	edo_fut <= C;
	else 
	edo_fut <= F;
	end if;
when C => L3 <= '0'; L2 <= '0'; L1 <= '1'; R3 <= '0'; R2 <= '0'; R1 <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 	
	edo_fut <= D;
when D => L3 <= '0'; L2 <= '1'; L1 <= '1'; R3 <= '0'; R2 <= '0'; R1 <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 
	edo_fut <= E;
when E => L3 <= '1'; L2 <= '1'; L1 <= '1'; R3 <= '0'; R2 <= '0'; R1 <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '0'; 
	edo_fut <= A;
when F => L3 <= '0'; L2 <= '0'; L1 <= '0'; R3 <= '1'; R2 <= '0'; R1 <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '1'; 
	edo_fut <= G;
when G => L3 <= '0'; L2 <= '0'; L1 <= '0'; R3 <= '1'; R2 <= '1'; R1 <= '0'; Q2 <= '1'; Q1 <= '1'; Q0 <= '0'; 
	edo_fut <= H;
when H => L3 <= '0'; L2 <= '0'; L1 <= '0'; R3 <= '1'; R2 <= '1'; R1 <= '1'; Q2 <= '1'; Q1 <= '1'; Q0 <= '1'; 
	edo_fut <= A;
end case;
end process p_estados;
--inicia segundo proceso
p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			edo_pres <= edo_fut;
	end if;
end process;
end arq_luces;

