--Group Members: Tony Cai, Karl Gonsalves

--include required libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--define the entity's I/O
entity mux_2to1 is
port (
	in0, in1 : in std_logic_vector(3 downto 0); --two inputs with 4bit bus
	mux_select : in std_logic; --mux input
	output : out std_logic_vector(3 downto 0) --4bit output

);
end mux_2to1;

--define how the output is computed
architecture mux_2to1_logic of mux_2to1 is

begin
	-- circuit where the output is selected based off of `mux_select`
	with mux_select select --switch inputs passed to ouput based on the value of the mux input
	output <= in0 when '0',
				 in1 when '1';
	
end mux_2to1_logic;