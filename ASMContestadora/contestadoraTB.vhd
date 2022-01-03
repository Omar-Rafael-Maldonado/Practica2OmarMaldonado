--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:40 01/02/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASMContestadora/contestadoraTB.vhd
-- Project Name:  ASMContestadora
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contestadora
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY contestadoraTB IS
END contestadoraTB;
 
ARCHITECTURE behavior OF contestadoraTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contestadora
    PORT(
         clk : IN  std_logic;
         llamada : IN  std_logic;
         mensaje : IN  std_logic;
         timbre : INOUT  integer;
         LED : OUT  std_logic;
         grabacion : OUT  std_logic;
         display : OUT  std_logic;
         activado : OUT  std_logic;
         Q2 : INOUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal llamada : std_logic := '0';
   signal mensaje : std_logic := '0';

	--BiDirs
   signal timbre : integer;
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

 	--Outputs
   signal LED : std_logic;
   signal grabacion : std_logic;
   signal display : std_logic;
   signal activado : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contestadora PORT MAP (
          clk => clk,
          llamada => llamada,
          mensaje => mensaje,
          timbre => timbre,
          LED => LED,
          grabacion => grabacion,
          display => display,
          activado => activado,
          Q2 => Q2,
          Q1 => Q1,
          Q0 => Q0
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
