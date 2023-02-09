--include required libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--define the entity's I/O
entity logic_proc is
port (
	logic_in0, logic_in1 : in std_logic_vector(3 downto 0); --2 inputs with 4bit address
	mux_select : in std_logic_vector(1 downto 0); --1 mux input with 2bit address
	logic_out : out std_logic_vector(3 downto 0) --1 output with 4bit address

);
end logic_proc;

--define how the output is computed
architecture proc_logic of logic_proc is

begin
	-- circuit that selects output base off of `mux_select`	
	with mux_select(1 downto 0) select --define each statement based on all possible input values of the mux select
	logic_out <= (logic_in0 AND logic_in1) when "00",
					(logic_in0 OR logic_in1) when "01",
					(logic_in0 XOR logic_in1) when "10",
					(logic_in0 XNOR logic_in1) when "11";
	
end proc_logic;