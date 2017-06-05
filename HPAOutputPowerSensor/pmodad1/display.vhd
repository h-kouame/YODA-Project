----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:34 07/08/2016 
-- Design Name: 
-- Module Name:    display - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
	port(
		clk : in STD_LOGIC;
		data_ch1 : in STD_LOGIC_VECTOR(15 downto 0);
		data_ch2 : in STD_LOGIC_VECTOR(15 downto 0);
		output_ch1: out STD_LOGIC_VECTOR(15 downto 0);
		output_ch2: out STD_LOGIC_VECTOR(15 downto 0);
	);

end display;

architecture Behavioral of display is

begin
	process (clk) is
		variable cnt: Integer :=0;
		if rising_edge(clk) then
			if (cnt<4) then
				
				
				cnt<=cnt+1;
			else 
				cnt<=0;
		
		end if;	
	end process;
end Behavioral;

