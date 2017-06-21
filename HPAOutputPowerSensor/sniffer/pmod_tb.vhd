--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:09:15 06/21/2017
-- Design Name:   
-- Module Name:   C:/Users/KZM/Google Drive/Work/EEE4084F/YODA Code/YODA-Project/HPAOutputPowerSensor/sniffer/pmod_tb.vhd
-- Project Name:  sniffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pmodad1
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
 
ENTITY pmod_tb IS
END pmod_tb;
 
ARCHITECTURE behavior OF pmod_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pmodad1
    PORT(
         clk : IN  std_logic;
         pmod_cs : OUT  std_logic;
         pmod_data1 : IN  std_logic;
         pmod_data2 : IN  std_logic;
         pmod_clk : OUT  std_logic;
         data_ch1 : OUT  std_logic_vector(15 downto 0);
         data_ch2 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pmod_data1 : std_logic := '0';
   signal pmod_data2 : std_logic := '0';

 	--Outputs
   signal pmod_cs : std_logic;
   signal pmod_clk : std_logic;
   signal data_ch1 : std_logic_vector(15 downto 0);
   signal data_ch2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant pmod_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pmodad1 PORT MAP (
          clk => clk,
          pmod_cs => pmod_cs,
          pmod_data1 => pmod_data1,
          pmod_data2 => pmod_data2,
          pmod_clk => pmod_clk,
          data_ch1 => data_ch1,
          data_ch2 => data_ch2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   pmod_clk_process :process
   begin
		pmod_clk <= '0';
		wait for pmod_clk_period/2;
		pmod_clk <= '1';
		wait for pmod_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.


      -- insert stimulus here 
		pmod_data1 <= '1';
		
		for i in 0 to 5000 loop
		
			--wait for clk_period*2;
			
		end loop;

      wait;
      wait;
   end process;

END;
