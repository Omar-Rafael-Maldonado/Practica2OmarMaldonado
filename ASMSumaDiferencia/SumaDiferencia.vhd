library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SumaDiferencia is
    Port ( clk, W, R, I, C, Z : in  STD_LOGIC;
           Wa, Wb,Ra,Rb,Wacc,Racc,Zacc : inout  STD_LOGIC;
           Q2, Q1, Q0 : inout  STD_LOGIC);
end SumaDiferencia;

architecture arq_sumDif of SumaDiferencia is
type estados is (A, B, C1, D, E, F, G ,H);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, W, R, I, C, Z)
begin
case edo_pres is
when A => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '0'; Q1 <= '0'; Q0 <= '0'; 
	if Ra = '1' then 															
	edo_fut <= B;
	else 
	edo_fut <= C1;
	end if;
when B => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '0'; Q1 <= '0'; Q0 <= '1'; 															
	if Rb = '1' and W = '1' then 															
	edo_fut <= D;
	else 
	edo_fut <= C1;
	end if;
when C1 => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 	
	edo_fut <= A;
when D => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 
	if R = '1' and Wacc = '1' then 															
	edo_fut <= E;
	else 
	edo_fut <= A;
	end if;
when E => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '1'; Q1 <= '0'; Q0 <= '0'; 
	edo_fut <= F;
when F => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '1'; Q1 <= '0'; Q0 <= '1'; 
	if Racc = '1' and Wa = '1' then 															
	edo_fut <= G;
	else 
	edo_fut <= H;
	end if;
when G => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '1'; Q1 <= '1'; Q0 <= '0'; 
	edo_fut <= A;
when H => Wa <= '0'; Wb <= '0'; Ra <= '0'; Rb <= '0'; Wacc <= '0'; Racc <= '0'; Zacc <= '0';
				Q2 <= '1'; Q1 <= '1'; Q0 <= '1'; 
	edo_fut <= A;
end case;
end process p_estados;
--inicia segundo proceso
p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			edo_pres <= edo_fut;
	end if;
end process;
end arq_sumDif;

