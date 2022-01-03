--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:31:40 01/02/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASMSumaDiferencia/TB.vhd
-- Project Name:  ASMSumaDiferencia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SumaDiferencia
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
 
ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SumaDiferencia
    PORT(
         clk : IN  std_logic;
         W : IN  std_logic;
         R : IN  std_logic;
         I : IN  std_logic;
         C : IN  std_logic;
         Z : IN  std_logic;
         Wa : INOUT  std_logic;
         Wb : INOUT  std_logic;
         Ra : INOUT  std_logic;
         Rb : INOUT  std_logic;
         Wacc : INOUT  std_logic;
         Racc : INOUT  std_logic;
         Zacc : INOUT  std_logic;
         Q2 : INOUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal W : std_logic := '0';
   signal R : std_logic := '0';
   signal I : std_logic := '0';
   signal C : std_logic := '0';
   signal Z : std_logic := '0';

	--BiDirs
   signal Wa : std_logic;
   signal Wb : std_logic;
   signal Ra : std_logic;
   signal Rb : std_logic;
   signal Wacc : std_logic;
   signal Racc : std_logic;
   signal Zacc : std_logic;
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SumaDiferencia PORT MAP (
          clk => clk,
          W => W,
          R => R,
          I => I,
          C => C,
          Z => Z,
          Wa => Wa,
          Wb => Wb,
          Ra => Ra,
          Rb => Rb,
          Wacc => Wacc,
          Racc => Racc,
          Zacc => Zacc,
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
