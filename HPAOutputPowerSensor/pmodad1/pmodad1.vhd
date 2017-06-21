----------------------------------------------------------------------------------
-- Company: University of Cape Town
-- Engineers: Tafadzwa Moyo, Lehlohonolo Phaphathisa
-- 
-- Create Date:    15:28:40 07/07/2016 
-- Design Name: 
-- Module Name:    pmodad1 - Behavioral 
-- Project Name: 
-- Target Devices: Nexys 3
-- Tool versions: 
-- Description: This program takes the value from a pmodad1 and dispay the 8 MSBs in the data on LEDS on the Nexys 3
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity pmodad1 is
		Generic(clk_div: Integer :=100;-- so that pmod_clk will run at .5MHZ-->100MHZ/(100*2)
												-- the two is for the rising and falling edges
				  pmod_clk_cycles:Integer  :=16
		
		);
		-- for pinlayout of the spartan 6 visit http://www.xilinx.com/support/documentation/user_guides/ug385.pdf, page 281
		-- for the pin layout of the pmod_ad1 visit https://reference.digilentinc.com/_media/pmod:pmod:pmodAD1_rm.pdf 
		-- for the pin layout of the pmods on the nexys 3 visit https://reference.digilentinc.com/_media/nexys:nexys3:nexys3_rm.pdf, page 21
		Port ( clk : in  STD_LOGIC;-- will run at 100MHZ -- Suggested pin B9
		
			  -- these are the ports connected to the pmod_ad1
           pmod_cs 		: out  STD_LOGIC; -- -- suggested pin T12
           pmod_data1 	: in  STD_LOGIC; -- -- suggested pin V12
           pmod_data2 	: in  STD_LOGIC; -- -- suggested pin N10
			  pmod_clk 		: out  STD_LOGIC; -- -- suggested pin P11
			  
			  --these are the ports taking the output of the process
			  data_ch1   	: out STD_LOGIC_VECTOR(15 downto 0);
           data_ch2   	: out STD_LOGIC_VECTOR(15 downto 0)
			  
			  --this one I don't know why its here
           --data_new : out  STD_LOGIC
			  );
end pmodad1;

architecture Behavioral of pmodad1 is

type machine is (setup, ready, execute); 
signal state		 	: machine 								:= setup;
signal pmod_clk_sig	: STD_LOGIC 							:='0'; -- used to keep track of the rising and falling edges
signal pmod_cs_sig	: STD_LOGIC 							:='1'; -- keeps track of pmod_cs
signal data_ch1_sig  : STD_LOGIC_VECTOR(15 downto 0)	:="0000000000000000";
signal data_ch2_sig  : STD_LOGIC_VECTOR(15 downto 0)	:="0000000000000000";
signal prev : STD_LOGIC := '1';

begin
	process(clk) is
		--clk_cnt will be used to count up to clk_div, when its at clk_div pmod_cs will be changed
		variable clk_cnt: Integer := 100;
		variable pmod_clk_cycles_var: Integer:=16;
		begin
		-- Divide Clock
--						if ((prev = '1') and (pmod_data2 = '0')) then
--					state <= ready;
--					pmod_cs_sig <= '0';
--					pmod_clk_cycles_var:=16;
--					prev <= '0';
--				--end if;
				
			if falling_edge(clk) then 	
				clk_cnt := clk_cnt - 1;
				if (clk_cnt =0) then
					pmod_clk_sig<= not pmod_clk_sig;
					pmod_clk 	<= pmod_clk_sig;
					clk_cnt:=100;
				end if;
				
				if falling_edge(pmod_clk_sig) then
					prev <= '1';
-- with cases the outputs changed in one of the cases must be changed in the other cases
-- even if the value at that output is the same as what it was previously

					case state is	
						when setup =>
							pmod_cs_sig<='1';
							state<= ready;
							
						when ready =>		
							pmod_cs_sig<='0';
							data_ch1_sig <= data_ch1_sig(data_ch1_sig'high - 1 downto 0) & pmod_data1;
							data_ch2_sig <= data_ch2_sig(data_ch1_sig'high - 1 downto 0) & pmod_data2;
							state<= execute;
							
						when execute=>
							if (pmod_clk_cycles_var >0) then
								data_ch1_sig <= data_ch1_sig(data_ch1_sig'high - 1 downto 0) & pmod_data1;
								data_ch2_sig <= data_ch2_sig(data_ch1_sig'high - 1 downto 0) & pmod_data2;							
								pmod_clk_cycles_var:= pmod_clk_cycles_var-1;
								state<=execute;
							else
								pmod_clk_cycles_var:=16;
								state<=setup;
							end if;
						
						when others =>
							state<=setup;
					end case;
					data_ch1 <= data_ch1_sig;
					data_ch2 <= data_ch2_sig;
					pmod_cs<=pmod_cs_sig;
			end if;
		end if;		
	end process;
end Behavioral;