

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity multiplex_normal_function_1bit is
 Port ( 
    in0,in1 : in STD_LOGIC;
    S3:  in STD_LOGIC;
    y: out STD_LOGIC);
end multiplex_normal_function_1bit;

architecture Behavioral of multiplex_normal_function_1bit is

begin
y<=(s3 and in1) or (not(s3) and in0);


end Behavioral;
