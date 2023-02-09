--include required libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_1bit is
port (
	input_a, input_b, carry_in : in std_logic; -- adds up everything from these inputs
	fa_carry_out, fa_sum_out : out std_logic -- outputs the sum and carry

);
end full_adder_1bit;

architecture full_adder_1bit_logic of full_adder_1bit is

begin
	-- calculates the carry and sum using some logic gates
	fa_carry_out <=  (input_a AND input_b) OR ( (input_a XOR input_b) AND carry_in);
	fa_sum_out <= (input_a XOR input_b) XOR carry_in ;
	
end full_adder_1bit_logic;