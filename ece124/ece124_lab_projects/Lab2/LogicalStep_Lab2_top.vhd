--import all required libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
    clkin_50		: in	std_logic; --
	pb_n			: in	std_logic_vector(3 downto 0); --the 4 push buttons, they're active low
 	sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs from 0 to 7
    leds			: out std_logic_vector(7 downto 0); -- for displaying the switch content
    seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    -- seg7 digit1 selector
	seg7_char2  	: out	std_logic					-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
	component SevenSegment port (
	hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
	sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
	); 
	end component;
	
	component segment7_mux port (
		clk : in std_logic := '0'; 
		DIN2 : in std_logic_vector(6 downto 0);
		DIN1 : in std_logic_vector(6 downto 0);
		DOUT : out std_logic_vector(6 downto 0);
		DIG2 : out std_logic;
		DIG1 : out std_logic
	); 
	end component;
	
	component logic_proc port (
		logic_in0, logic_in1 : in std_logic_vector(3 downto 0);
		mux_select : in std_logic_vector(1 downto 0);
		logic_out : out std_logic_vector(3 downto 0)
	);
	end component;
	
	component PB_Inverters port 
	 (
		pb_n : in std_logic_vector(3 downto 0);
		pb : out std_logic_vector(3 downto 0)
	);
	end component;
	
	component full_adder_4bit port 
	 (
		BUS0, BUS1 : in std_logic_vector(3 downto 0);
		carry_out3 : out std_logic;
		sum : out std_logic_vector(3 downto 0)
	);
	end component;
	
	component mux_2to1 port 
	 (
		in0, in1 : in std_logic_vector(3 downto 0);
		mux_select : in std_logic;
		output : out std_logiC_vector(3 downto 0)
	);
	end component;
	
	
	
-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0); --
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	signal hex_A		: std_logic_vector(3 downto 0);
	signal hex_B		: std_logic_vector(3 downto 0);
	
	signal pb 			: std_logic_vector(3 downto 0);
	
	signal hex_sum    : std_logic_vector(3 downto 0);
	signal hex_carry  : std_logic;
	
	signal concat     : std_logic_vector(3 downto 0);
	
	signal mux_out_A  : std_logic_vector(3 downto 0);
	signal mux_out_B  : std_logic_vector(3 downto 0);
	
	
	
-- Here the circuit begins

begin
	-- all signal values
	hex_A <= sw(3 downto 0); --signal defined as the 4 bit address representing the hexA part using the switches 0-3
	hex_B <= sw(7 downto 4); --signal defined the 4 bit address representing the hexA part using the switches 4-7
	concat <= "000" & hex_carry; --signal defined as "000" concatened with the hex_carry signal

	-- all component values and mappings
	INST1: SevenSegment port map(mux_out_A, seg7_A);
	INST2: SevenSegment port map(mux_out_B, seg7_B);
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1);
	INST4: logic_proc port map(hex_A, hex_B, pb(1 downto 0), leds(3 downto 0));
	INST5: PB_Inverters port map(pb_n,pb);
	INST6: full_adder_4bit port map(hex_A, hex_B, hex_carry, hex_sum);
	INST7: mux_2to1 port map(hex_A, hex_sum, pb(2), mux_out_A);
	INST8: mux_2to1 port map(hex_B, concat, pb(2), mux_out_B);
	
 
end SimpleCircuit;

