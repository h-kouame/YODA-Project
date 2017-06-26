----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:07 06/16/2017 
-- Design Name: 
-- Module Name:    sniffer - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity sniffer is
    Port ( clk : in STD_LOGIC;
           pmod_data1 : in STD_LOGIC;
           pmod_data2 : in STD_LOGIC;
			  btns : in STD_LOGIC := '0';
           led : out STD_LOGIC_VECTOR (7 downto 0) := x"00";
			  pmod_clk : out STD_LOGIC;
			  pmod_cs : out STD_LOGIC
			 );
end sniffer;

architecture Behavioral of sniffer is

-- Signals to register the inputs
signal cs : STD_LOGIC := '0';
signal s_clk : STD_LOGIC;
signal s_pmod_data1 : STD_LOGIC;
signal s_pmod_data2 : STD_LOGIC;
signal s_led : STD_LOGIC_VECTOR (7 downto 0);
signal s_pmod_clk : STD_LOGIC;

-- Connecting signals
signal data_ch1, data_ch2 : STD_LOGIC_VECTOR (15 downto 0);

begin
-- Assign the inputs to the signals
pmod_cs <= cs;
s_clk <= clk;
s_pmod_data1 <= pmod_data1;
s_pmod_data2 <= pmod_data2;
led <= s_led;
pmod_clk <= s_pmod_clk;

-- Connect everything up
pmod : entity work.pmodad1 port map(s_clk, cs, s_pmod_data1, s_pmod_data2, s_pmod_clk, data_ch1, data_ch2);
detector : entity work.detector port map(s_clk, cs, btns, data_ch1, data_ch2, s_led);

end Behavioral;

