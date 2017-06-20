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
           data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end detector;

architecture Behavioral of detector is

type machine is (search, found); 
signal state		 	: machine 								:= search;
type INPUT_BUFFER_TYPE is array (0 to 2) of STD_LOGIC_VECTOR (7 downto 0);
-- Sequence "BEEF"  
signal input_buffer : INPUT_BUFFER_TYPE;
signal temp : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
shared variable buffer_index : integer range 1 to 0;
shared variable word_index : integer range 0 to 7 := 0;

begin
	process(clk) is
	begin
	
		if falling_edge(clk) then 
		
			case state is
					when search =>
					-- On the falling edge of cs shift old data along the buffer then read in new data
--						if falling_edge(cs) then 
--							for i in 3 to 2 loop
--								input_buffer(2) <= input_buffer(0);
--							end loop;
--							
--							input_buffer(0) <= data_in(15 downto 8);
--							input_buffer(1) <= data_in(7 downto 0);
					-- Else check pairs if equal to sequence
					-- If pair equal set state to found and exit loop
--						end if;
						if falling_edge(cs) then
							if (buffer_index = 0) then
								input_buffer(2) <= input_buffer(0);
							end if;
							
							if (word_index = 7) then
								buffer_index := buffer_index + 1;
								temp <= "00000000";
							end if;
						
							if (data_in >= x"800") then
								temp <= temp(temp'high - 1 downto 0) & '1';
								--input_buffer(buffer_index) <= input_buffer(buffer_index)
							else
								temp <= temp(temp'high - 1 downto 0) & '0';
							end if;
							
							input_buffer(buffer_index) <= temp;
							word_index := word_index + 1;
							
						end if;
--							for i in 0 to 1 loop
--								if ((input_buffer(i) = x"BE") and 
--								(input_buffer(i + 1) = x"EF")) then
--									state <= found;
--									exit;
--								end if;
--							end loop;
						--end if;
						
						if (input_buffer(0) > 0) then
							led <= x"AA";
						else
							led <= x"00";
						end if;
			
					when found =>
						led <= x"AA";
						
					when others =>
						led <= x"81";
			end case;
		end if;
		
	end process;

end Behavioral;

