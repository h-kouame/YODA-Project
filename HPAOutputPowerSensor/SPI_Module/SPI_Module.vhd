----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:37 07/17/2016 
-- Design Name: 
-- Module Name:    SPI_Module - Behavioral 
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
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_Module is
port(
clk		: in std_logic;
data_in_0: in std_logic_vector(15 downto 0);
data_in_1: in std_logic_vector(15 downto 0);

mosi		: out std_logic
);
end SPI_Module;

architecture Behavioral of SPI_Module is

begin
	process(clk)
		variable tracker	: integer :=0;
		variable input		: integer :=0;
		begin 
		if rising_edge(clk) then
			if (input= 0) then
				mosi<=data_in_0(tracker);
				tracker:=tracker+1;
				if (tracker=16) then
					tracker:=0;
					input:=1;
				end if;
			else 
				mosi<=data_in_1(tracker);
				tracker:=tracker+1;
				if (tracker=16) then
					tracker:=0;
					input:=0;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

