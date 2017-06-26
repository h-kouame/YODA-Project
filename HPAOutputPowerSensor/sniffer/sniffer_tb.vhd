--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:34:44 06/20/2017
-- Design Name:   
-- Module Name:   C:/Users/KZM/Google Drive/Work/EEE4084F/YODA Code/YODA-Project/HPAOutputPowerSensor/sniffer/sniffer_tb.vhd
-- Project Name:  sniffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sniffer
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
 
ENTITY sniffer_tb IS
END sniffer_tb;
 
ARCHITECTURE behavior OF sniffer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sniffer
    PORT(
         clk : IN  std_logic;
         pmod_data1 : IN  std_logic;
         pmod_data2 : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         pmod_clk : OUT  std_logic;
         pmod_cs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pmod_data1 : std_logic := '0';
   signal pmod_data2 : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal pmod_clk : std_logic;
   signal pmod_cs : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant pmod_clk_period : time := 10 ns;
	
	-- Other
	shared variable count : integer := 0;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sniffer PORT MAP (
          clk => clk,
          pmod_data1 => pmod_data1,
          pmod_data2 => pmod_data2,
          led => led,
          pmod_clk => pmod_clk,
          pmod_cs => pmod_cs
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
		pmod_data1 <= '1';
		
		for i in 0 to 500 loop			
			if (clk = '1') then
				count := count + 1;
			end if;
			-- insert stimulus here 
			if (count = 160) then
				pmod_data1 <= '0';
			end if;
		end loop;
		
		pmod_data1 <= '0';

   end process;

END;
