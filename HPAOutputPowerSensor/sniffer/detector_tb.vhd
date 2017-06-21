--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:38:31 06/20/2017
-- Design Name:   
-- Module Name:   C:/Users/KZM/Google Drive/Work/EEE4084F/YODA Code/YODA-Project/HPAOutputPowerSensor/sniffer/detector_tb.vhd
-- Project Name:  sniffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: detector
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
 
ENTITY detector_tb IS
END detector_tb;
 
ARCHITECTURE behavior OF detector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detector
    PORT(
         clk : IN  std_logic;
         cs : IN  std_logic;
         data_in : IN  std_logic_vector(15 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cs : std_logic := '0';
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	-- Other
	shared variable count : integer range 0 to 9 := 0;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detector PORT MAP (
          clk => clk,
          cs => cs,
          data_in => data_in,
          led => led
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
      -- hold reset state for 100 ns
		--wait;
		data_in <= x"FFFF";
		cs <= not cs;
		cs <= not cs;
		
		for i in 0 to 500 loop
		
			wait for clk_period*2;
			cs <= not cs;
			
			if (cs = '1') then
				count := count + 1;
			end if;
			-- insert stimulus here 
			if (count = 10) then
				data_in <= x"0000";
			end if;
		end loop;


      --wait;
   end process;

END;
