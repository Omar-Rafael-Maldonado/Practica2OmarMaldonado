--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:24 01/02/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASMLuces/lucesTB.vhd
-- Project Name:  ASMLuces
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lucesAuto
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
 
ENTITY lucesTB IS
END lucesTB;
 
ARCHITECTURE behavior OF lucesTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lucesAuto
    PORT(
         izq : IN  std_logic;
         vuelta : IN  std_logic;
         clk : IN  std_logic;
         L1 : OUT  std_logic;
         L2 : OUT  std_logic;
         L3 : OUT  std_logic;
         R1 : OUT  std_logic;
         R2 : OUT  std_logic;
         R3 : OUT  std_logic;
         Q2 : INOUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal izq : std_logic := '0';
   signal vuelta : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

 	--Outputs
   signal L1 : std_logic;
   signal L2 : std_logic;
   signal L3 : std_logic;
   signal R1 : std_logic;
   signal R2 : std_logic;
   signal R3 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lucesAuto PORT MAP (
          izq => izq,
          vuelta => vuelta,
          clk => clk,
          L1 => L1,
          L2 => L2,
          L3 => L3,
          R1 => R1,
          R2 => R2,
          R3 => R3,
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
