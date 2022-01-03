--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:14:48 01/02/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASMRaton/TB_Raton.vhd
-- Project Name:  ASMRaton
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: raton
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
 
ENTITY TB_Raton IS
END TB_Raton;
 
ARCHITECTURE behavior OF TB_Raton IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT raton
    PORT(
         x : IN  std_logic;
         clk : IN  std_logic;
         z1 : OUT  std_logic;
         z2 : OUT  std_logic;
         z : INOUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal z : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

 	--Outputs
   signal z1 : std_logic;
   signal z2 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: raton PORT MAP (
          x => x,
          clk => clk,
          z1 => z1,
          z2 => z2,
          z => z,
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
