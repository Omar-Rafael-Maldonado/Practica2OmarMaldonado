--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:37:54 01/02/2022
-- Design Name:   
-- Module Name:   C:/.Xilinx/ASMRellenoPastillas/rellenoTB.vhd
-- Project Name:  ASMRellenoPastillas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rellenoPastillas
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
 
ENTITY rellenoTB IS
END rellenoTB;
 
ARCHITECTURE behavior OF rellenoTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rellenoPastillas
    PORT(
         clk : IN  std_logic;
         SensorA : IN  std_logic;
         SensorB : IN  std_logic;
         SensorC : IN  std_logic;
         pastillas : INOUT  integer;
         ValvulaA : OUT  std_logic;
         ValvulaB : OUT  std_logic;
         ValvulaC : OUT  std_logic;
         motorCinta : OUT  std_logic;
         Q2 : INOUT  std_logic;
         Q1 : INOUT  std_logic;
         Q0 : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal SensorA : std_logic := '0';
   signal SensorB : std_logic := '0';
   signal SensorC : std_logic := '0';

	--BiDirs
   signal pastillas : integer;
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;

 	--Outputs
   signal ValvulaA : std_logic;
   signal ValvulaB : std_logic;
   signal ValvulaC : std_logic;
   signal motorCinta : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rellenoPastillas PORT MAP (
          clk => clk,
          SensorA => SensorA,
          SensorB => SensorB,
          SensorC => SensorC,
          pastillas => pastillas,
          ValvulaA => ValvulaA,
          ValvulaB => ValvulaB,
          ValvulaC => ValvulaC,
          motorCinta => motorCinta,
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
