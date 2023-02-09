--include required libraries
library ieee;
use ieee.std_logic_1164.all;

--define the entity's I/O
entity PB_Inverters is 
 port (
	pb_n : in std_logic_vector(3 downto 0); -- inputs to be inverted
	pb : out std_logic_vector(3 downto 0) -- inverted outputs
 );
 end PB_Inverters;

 --define how the output is computed
 architecture gates of PB_Inverters is
 
 begin 
 	-- inverts all input values from pb_n 
 	pb <= not(pb_n);
 
 end gates;

