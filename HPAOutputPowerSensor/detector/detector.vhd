----------------------------------------------------------------------------------
-- Company: YODA Project 09
-- Engineer: Khwezi Majola
-- 
-- Create Date:    20:56:37 06/11/2017 
-- Design Name: 
-- Module Name:    detector - Behavioral 
-- Project Name: 
-- Target Devices: Nexys 3
-- Tool versions: 
-- Description: This module takes in data values and detects a sequence
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

entity detector is
    Port ( clk : in  STD_LOGIC;
           cs : in  STD_LOGIC;
			  btns : in STD_LOGIC := '0';
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  ss : in STD_LOGIC_VECTOR (15 downto 0) := x"FFFF";
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end detector;

architecture Behavioral of detector is

type machine is (setup, waiting, search, found); 
signal state		 	: machine 								:= setup;
type INPUT_BUFFER_TYPE is array (0 to 3) of STD_LOGIC_VECTOR (7 downto 0);
-- Sequence "BEEF"  
signal input_buffer : INPUT_BUFFER_TYPE;
signal prev : STD_LOGIC_VECTOR (15 downto 0) := x"FFFF";

shared variable buffer_index : integer range 0 to 2 := 0;
shared variable word_index : integer range 0 to 8 := 0;
shared variable num_inputs : integer range 0 to 3 := 0;

begin

	process(clk) is
	begin
	
		if falling_edge(clk) then 
			case state is
					when setup =>
					-- During setup reset the LEDs and wait for the first CS falling edge
					-- Move to waiting 
					-- The first CS falling edge occurs as part of the pmodad setup and must be ignored
					led <= x"00";
					if falling_edge(cs) then
						state <= waiting;
						buffer_index := 0;
						word_index := 0;
						num_inputs := 0;
					end if;
					
					when waiting =>
					led <= x"00";
					-- During waiting, wait for falling edge on SS
					if ((prev > x"0800") and (ss < x"0010")) then
						prev <= x"0000";
						state <= search;
					end if;
					
					when search =>
					-- On the falling edge of cs shift old data along the buffer then read in new data
					-- Else check pairs if equal to sequence
					-- If pair equal set state to found and exit loop
					led <= x"00";
						if falling_edge(cs) then
							
							if (word_index = 8) then
								if (buffer_index = 3) then
									buffer_index := 0;
								else
									buffer_index := buffer_index + 1;
								end if;
												
								if (num_inputs < 2) then
									num_inputs := num_inputs + 1;
								end if;
								word_index := 0;

							else								
								word_index := word_index + 1;
							end if;
							
							if (data_in >= x"800")then
								--led <= x"80";
								input_buffer(buffer_index) <= input_buffer(buffer_index)(input_buffer(buffer_index)'high - 1 downto 0) & '1';
							else
								--led <= x"01";
								input_buffer(buffer_index) <= input_buffer(buffer_index)(input_buffer(buffer_index)'high - 1 downto 0) & '0';
							end if;
							
						end if;
						if (num_inputs = 2) then
							for i in 0 to 2 loop
								if ((input_buffer(i + 1) = x"FF") and 
								(input_buffer(i) = x"00")) then
									state <= found;
									exit;
								end if;
							end loop;							
						end if;
						
					when found =>
						if (btns = '1') then
							state <= waiting;
							prev <= x"FFFF";
						end if;
						led <= x"AA";
						
					when others =>
						led <= x"81";
			end case;
		end if;
		
	end process;

end Behavioral;

