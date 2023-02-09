--include required libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_4bit is 
port (
	BUS0, BUS1 : in std_logic_vector(3 downto 0); -- `BUS0` and `BUS1` contains the two values to be summed
	carry_out3 : out std_logic; -- any overflow, adding 1+1
	sum : out std_logic_vector(3 downto 0) -- outputs sum of the two values
);
end full_adder_4bit;


architecture full_adder_4bit_logic of full_adder_4bit is

	-- components
	component full_adder_1bit port (
		input_a, input_b, carry_in : in std_logic;
		fa_carry_out, fa_sum_out : out std_logic
	);
	end component;
	
	-- signals for the connecting the carries of the full adders together
	signal carry_out0: std_logic;
	signal carry_out1: std_logic;
	signal carry_out2: std_logic;
	

begin
	-- circuit that adds the values of BUS0 and BUS1
	INST0: full_adder_1bit port map(BUS0(0), BUS1(0), '0', carry_out0, sum(0));
	INST1: full_adder_1bit port map(BUS0(1), BUS1(1), carry_out0, carry_out1, sum(1));
	INST2: full_adder_1bit port map(BUS0(2), BUS1(2), carry_out1, carry_out2, sum(2));
	INST3: full_adder_1bit port map(BUS0(3), BUS1(3), carry_out2, carry_out3, sum(3));
	
end full_adder_4bit_logic;

