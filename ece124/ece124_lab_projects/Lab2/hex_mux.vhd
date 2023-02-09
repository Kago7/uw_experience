--include required libraries
library ieee;
use ieee.std_logic_1164.all;

--define the entity's I/O
entity hex_mux is
port (
	hex_num3, hex_num2, hex_num1, hex_num0 : in std_logic_vector(3 downto 0); -- inputs to choose from
	mux_select										: in std_logic_vector(1 downto 0); -- choice
	hex_out											: out std_logic_vector(3 downto 0) -- outputs the chosen input
);
end hex_mux;

--define how the output is computed
architecture mux_logic of hex_mux is

begin
	-- circuit that selects output based off of `mux_select`
	with mux_select(1 downto 0) select
	hex_out <= hex_num0 when "00",
				hex_num1 when "01",
	            hex_num2 when "10",
				hex_num3 when "11";
end mux_logic;

