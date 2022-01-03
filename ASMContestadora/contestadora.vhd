library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity contestadora is
    Port ( clk, llamada, mensaje: in  STD_LOGIC;
				timbre : inout integer;
           LED, grabacion, display, activado : out  STD_LOGIC;
			  Q2, Q1, Q0 : inout  STD_LOGIC);
end contestadora;

architecture arq_contesta of contestadora is
type estados is (A, B, C, D, E, F);
	signal edo_pres, edo_fut: estados;
begin
	p_estados: process (edo_pres, llamada, mensaje)
begin
case edo_pres is
when A => activado <= '1'; LED <= '0'; timbre <= 0; grabacion <= '0'; display <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '0'; 
	if LLAMADA = '1' then 															
	edo_fut <= B;
	else 
	edo_fut <= A;
	end if;
when B => activado <= '0'; LED <= '1'; timbre <= 0; grabacion <= '0'; display <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '1'; 															--estado uno
	edo_fut <= C;
when C => activado <= '0'; LED <= '1'; timbre <= timbre; grabacion <= '0'; display <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 	
	if timbre <= 3 then 															
	timbre <= timbre+1;
	edo_fut <= C;
	else 
	edo_fut <= D;
	end if;
when D => activado <= '0'; LED <= '1'; timbre <= 3; grabacion <= '1'; display <= '0'; Q2 <= '0'; Q1 <= '1'; Q0 <= '0'; 
	if mensaje = '1' then 														
	edo_fut <= E;
	else 
	edo_fut <= A;
	end if;
when E => activado <= '0'; LED <= '1'; timbre <= 3; grabacion <= '0'; display <= '1'; Q2 <= '1'; Q1 <= '0'; Q0 <= '0'; 
	edo_fut <= F;
when F => activado <= '0'; LED <= '0'; timbre <= 0; grabacion <= '0'; display <= '0'; Q2 <= '1'; Q1 <= '0'; Q0 <= '1'; 
	edo_fut <= A;
end case;
end process p_estados;
--inicia segundo proceso
p_reloj: process (clk) begin
	if (clk'event and clk = '1') then 
			edo_pres <= edo_fut;
	end if;
end process;
end arq_contesta;

