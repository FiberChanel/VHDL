--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity convert is
    Port ( 
	        
				clk : in  STD_LOGIC;
				RAM1_DATA_READ: in std_logic;
				datain: in std_logic_vector (143 downto 0);
																	
				pxl1conv: out std_logic_vector (31 downto 0); 
				pxl2conv: out std_logic_vector (31 downto 0);
				pxl3conv: out std_logic_vector (31 downto 0);
				pxl4conv: out std_logic_vector (31 downto 0);
				pxl5conv: out std_logic_vector (31 downto 0); 
				pxl6conv: out std_logic_vector (31 downto 0);
				pxl7conv: out std_logic_vector (31 downto 0);
				pxl8conv: out std_logic_vector (31 downto 0);
				pxl9conv: out std_logic_vector (31 downto 0)
				
				
				
			   
			  );
end convert;


 
architecture Behavioral of convert is



signal pxl1, pxl2,pxl3,pxl4,pxl5,pxl6,pxl7,pxl8,pxl9: std_logic_vector (15 downto 0); 
signal x_int1,x_int2,x_int3,x_int4,x_int5,x_int6,x_int7,x_int8,x_int9: integer; 
signal x_slvm127: std_logic_vector (7 downto 0):="01111111"; 
signal x_slvm128: std_logic_vector (7 downto 0):="10000000";
signal x_slvm129: std_logic_vector (7 downto 0):="10000001";
signal x_slvm130: std_logic_vector (7 downto 0):="10000010";
signal x_slvm131: std_logic_vector (7 downto 0):="10000011";
signal x_slvm132: std_logic_vector (7 downto 0):="10000100";
signal x_slvm133: std_logic_vector (7 downto 0):="10000101";
signal x_slvm134: std_logic_vector (7 downto 0):="10000110";
signal x_slvm135: std_logic_vector (7 downto 0):="10000111";

begin



 
 pxl1<= datain (143 downto 128);
 pxl2<= datain (127 downto 112);
 pxl3<= datain (111 downto 96);
 pxl4<= datain (95 downto 80); 
 pxl5<= datain (79 downto 64); 
 pxl6<= datain (63 downto 48); 
 pxl7<= datain (47 downto 32);
 pxl8<= datain (31 downto 16);
 pxl9<= datain (15 downto 0);
 
 
	x_int1<=conv_integer(pxl1);
	x_int2<=conv_integer(pxl2);
	x_int3<=conv_integer(pxl3);
	x_int4<=conv_integer(pxl4);
	x_int5<=conv_integer(pxl5);
	x_int6<=conv_integer(pxl6);
	x_int7<=conv_integer(pxl7);
	x_int8<=conv_integer(pxl8);
	x_int9<=conv_integer(pxl9);
	
   process (clk,x_int1,x_int2,x_int3,x_int4,x_int5,x_int6,x_int7,x_int8,x_int9)
 
		variable mant1, mant2,mant3,mant4,mant5,mant6,mant7,mant8,mant9: std_logic_vector (7 downto 0):="01111111"; -- основание експоненты пикселtq - 127
		
	
		  begin
			
				if(x_int1>=0 and x_int1 <=1) then
								pxl1conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int1>=1  and x_int1<=3) then 
								pxl1conv <= '0' & x_slvm128 & pxl1(0) & "00" & X"00000";
								
								
								elsif (x_int1 >=4  and x_int1 <= 7 ) then 	
								pxl1conv <= '0' & x_slvm129 & pxl1(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int1 >=8  and x_int1 <=15 ) then 
								pxl1conv <= '0' & x_slvm130 & pxl1(2 downto 0) &  X"00000";
								
								
								elsif (x_int1 >=16 and x_int1 <=31 ) then 
								pxl1conv <= '0' & x_slvm131 & pxl1(3 downto 0) & "000" & X"0000"; 
					
					
					
								elsif (x_int1 >=32 and x_int1 <=63 ) then  
								pxl1conv <= '0' & x_slvm132 & pxl1(4 downto 0) & "00" & X"0000";
					
								elsif (x_int1 >=64 and x_int1 <=127 ) then  
								
								pxl1conv <= '0' & x_slvm133 & pxl1(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int1 >=128 and x_int1 <=255) then 
								pxl1conv <= '0' & x_slvm134 & pxl1(6 downto 0) & X"0000";
					
								elsif (x_int1 >= 256 ) then 
								pxl1conv <= '0' & x_slvm135 & pxl1(7 downto 0) & "000" & X"000";
			end if;
				 

			if(x_int2>=0 and x_int2 <=1) then
								pxl2conv <= '0' & x_slvm127 &  "000" & X"00000";


								elsif (x_int2>1  and x_int2<=3) then 
								pxl2conv <= '0' & x_slvm128 & pxl2(0) & "00" & X"00000"; 
								
								elsif (x_int2 >=4  and x_int2 <= 7 ) then 
								pxl2conv <= '0' & x_slvm129 & pxl2(1 downto 0) & "0" &  X"00000";
         			
								
								elsif (x_int2 >=8  and x_int2 <=15 ) then 
								pxl2conv <= '0' & x_slvm130 & pxl2(2 downto 0) &  X"00000";
								
								elsif (x_int2 >=16 and x_int2 <=31 ) then 
								pxl2conv <= '0' & x_slvm131 & pxl2(3 downto 0) & "000" & X"0000";
								
								elsif (x_int2 >=32 and x_int2 <=63 ) then 
								pxl2conv <= '0' & x_slvm132 & pxl2(4 downto 0) & "00" & X"0000";
								
								elsif (x_int2 >=64 and x_int2 <=127 ) then 
								pxl2conv <= '0' & x_slvm133 & pxl2(5 downto 0) & "0" & X"0000";
								
								elsif (x_int2 >=128 and x_int2 <=255) then 
								pxl2conv <= '0' & x_slvm134 & pxl2(6 downto 0) & X"0000";
								
								elsif (x_int2 >= 256 ) then 
								pxl2conv <= '0' & x_slvm135 & pxl2(7 downto 0) & "000" & X"000";
			end if;


			if(x_int3>=0 and x_int3 <=1) then
								pxl3conv <= '0' & x_slvm127 &  "000" & X"00000";


								elsif (x_int3>1  and x_int3<=3) then 
								pxl3conv <= '0' & x_slvm128 & pxl3(0) & "00" & X"00000"; 
								
								elsif (x_int3 >=4  and x_int3 <= 7 ) then 
								pxl3conv <= '0' & x_slvm129 & pxl3(1 downto 0) & "0" &  X"00000";
         			
								
								elsif (x_int3 >=8  and x_int3 <=15 ) then 
								pxl3conv <= '0' & x_slvm130 & pxl3(2 downto 0) &  X"00000";
								
								elsif (x_int3 >=16 and x_int3 <=31 ) then 
								pxl3conv <= '0' & x_slvm131 & pxl3(3 downto 0) & "000" & X"0000"; 
								
								elsif (x_int3 >=32 and x_int3 <=63 ) then 
								pxl3conv <= '0' & x_slvm132 & pxl3(4 downto 0) & "00" & X"0000";
								
								elsif (x_int3 >=64 and x_int3 <=127 ) then 
								pxl3conv <= '0' & x_slvm133 & pxl3(5 downto 0) & "0" & X"0000";
								
								elsif (x_int3 >=128 and x_int3 <=255) then 
								pxl3conv <= '0' & x_slvm134 & pxl3(6 downto 0) & X"0000";
								
								elsif (x_int3 >= 256 ) then 
								pxl3conv <= '0' & x_slvm135 & pxl3(7 downto 0) & "000" & X"000";
			end if;


			if(x_int4>=0 and x_int4 <=1) then
								pxl4conv <= '0' & x_slvm127 &  "000" & X"00000";

								elsif (x_int4>1  and x_int4<=3) then 
								pxl4conv <= '0' & x_slvm128 & pxl4(0) & "00" & X"00000"; 
							
								elsif (x_int4 >=4  and x_int4 <= 7 ) then 	
								pxl4conv <= '0' & x_slvm129 & pxl4(1 downto 0) & "0" &  X"00000";
																
								elsif (x_int4 >=8  and x_int3 <=15 ) then 
								pxl4conv <= '0' & x_slvm130 & pxl4(2 downto 0) &  X"00000";
								
								elsif (x_int4 >=16 and x_int3 <=31 ) then 
								pxl4conv <= '0' & x_slvm131 & pxl4(3 downto 0) & "000" & X"0000"; 
								
								elsif (x_int4 >=32 and x_int3 <=63 ) then 
								pxl4conv <= '0' & x_slvm132 & pxl4(4 downto 0) & "00" & X"0000";
								
								elsif (x_int4 >=64 and x_int3 <=127 ) then 
								pxl4conv <= '0' & x_slvm133 & pxl4(5 downto 0) & "0" & X"0000";
								
								elsif (x_int4 >=128 and x_int4 <=255) then 
								pxl4conv <= '0' & x_slvm134 & pxl4(6 downto 0) & X"0000";
								
								elsif (x_int4 >= 256 ) then 
								pxl4conv <= '0' & x_slvm135 & pxl4(7 downto 0) & "000" & X"000";
			end if;
			
			
				if(x_int5>=0 and x_int5 <=1) then
								pxl5conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int5>=1  and x_int5<=3) then 
								pxl5conv <= '0' & x_slvm128 & pxl5(0) & "00" & X"00000"; 
								
								elsif (x_int5 >=4  and x_int5 <= 7 ) then 	
								pxl5conv <= '0' & x_slvm129 & pxl5(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int5 >=8  and x_int5 <=15 ) then 
								pxl5conv <= '0' & x_slvm130 & pxl5(2 downto 0) &  X"00000";
								
								
								elsif (x_int5 >=16 and x_int5 <=31 ) then 
								pxl5conv <= '0' & x_slvm131 & pxl5(3 downto 0) & "000" & X"0000"; 
					
					
					
								elsif (x_int5 >=32 and x_int5 <=63 ) then  
								pxl5conv <= '0' & x_slvm132 & pxl5(4 downto 0) & "00" & X"0000";
					
								elsif (x_int5 >=64 and x_int5 <=127 ) then  
								pxl5conv <= '0' & x_slvm133 & pxl5(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int5 >=128 and x_int5 <=255) then 
								pxl5conv <= '0' & x_slvm134 & pxl5(6 downto 0) & X"0000";
					
								elsif (x_int5 >= 256 ) then 
								pxl5conv <= '0' & x_slvm135 & pxl5(7 downto 0) & "000" & X"000";
			end if;
		
	
				if(x_int6>=0 and x_int6 <=1) then
								pxl6conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int6>=1  and x_int6<=3) then 
								pxl6conv <= '0' & x_slvm128 & pxl6(0) & "00" & X"00000"; 
								
								
								elsif (x_int6 >=4  and x_int6 <= 7 ) then 	
								pxl6conv <= '0' & x_slvm129 & pxl6(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int6 >=8  and x_int6 <=15 ) then 
								pxl6conv <= '0' & x_slvm130 & pxl6(2 downto 0) &  X"00000";
								
								
								elsif (x_int6 >=16 and x_int6 <=31 ) then 
								pxl6conv <= '0' & x_slvm131 & pxl6(3 downto 0) & "000" & X"0000"; 
					
					
					
								elsif (x_int6 >=32 and x_int6 <=63 ) then  
								pxl6conv <= '0' & x_slvm132 & pxl6(4 downto 0) & "00" & X"0000";
					
								elsif (x_int6 >=64 and x_int6 <=127 ) then  
								
								pxl6conv <= '0' & x_slvm133 & pxl6(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int6 >=128 and x_int6 <=255) then 
								pxl6conv <= '0' & x_slvm134 & pxl6(6 downto 0) & X"0000";
					
								elsif (x_int6 >= 256 ) then 
								pxl6conv <= '0' & x_slvm135 & pxl6(7 downto 0) & "000" & X"000";
			end if;
 

				if(x_int7>=0 and x_int7 <=1) then
								pxl7conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int7>=1  and x_int7<=3) then 
								pxl7conv <= '0' & x_slvm128 & pxl7(0) & "00" & X"00000"; 
								
								
								elsif (x_int7 >=4  and x_int7 <= 7 ) then 	
								pxl7conv <= '0' & x_slvm129 & pxl7(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int7 >=8  and x_int7 <=15 ) then 
								pxl7conv <= '0' & x_slvm130 & pxl7(2 downto 0) &  X"00000";
								
								
								elsif (x_int7 >=16 and x_int7 <=31 ) then 
								pxl7conv <= '0' & x_slvm131 & pxl7(3 downto 0) & "000" & X"0000"; 
					
					
					
								elsif (x_int7 >=32 and x_int7 <=63 ) then  
								pxl7conv <= '0' & x_slvm132 & pxl7(4 downto 0) & "00" & X"0000";
					
								elsif (x_int7 >=64 and x_int7 <=127 ) then  
								pxl7conv <= '0' & x_slvm133 & pxl7(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int7 >=128 and x_int7 <=255) then 
								pxl7conv <= '0' & x_slvm134 & pxl7(6 downto 0) & X"0000";
					
								elsif (x_int7 >= 256 ) then 
								pxl7conv <= '0' & x_slvm135 & pxl7(7 downto 0) & "000" & X"000";
			end if;

		
				if(x_int8>=0 and x_int8 <=1) then
								pxl8conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int8>=1  and x_int8<=3) then 
								pxl8conv <= '0' & x_slvm128 & pxl8(0) & "00" & X"00000"; 
								
								
								elsif (x_int8 >=4  and x_int8 <= 7 ) then 	
								pxl8conv <= '0' & x_slvm129 & pxl8(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int8 >=8  and x_int8 <=15 ) then 
								pxl8conv <= '0' & x_slvm130 & pxl8(2 downto 0) &  X"00000";
								
								
								elsif (x_int8 >=16 and x_int8 <=31 ) then 
								pxl8conv <= '0' & x_slvm131 & pxl8(3 downto 0) & "000" & X"0000"; 					
					
					
								elsif (x_int8 >=32 and x_int8 <=63 ) then  
								pxl8conv <= '0' & x_slvm132 & pxl8(4 downto 0) & "00" & X"0000";
					
								elsif (x_int8 >=64 and x_int8 <=127 ) then  
								pxl8conv <= '0' & x_slvm133 & pxl8(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int8 >=128 and x_int8 <=255) then 
								pxl8conv <= '0' & x_slvm134 & pxl8(6 downto 0) & X"0000";
					
								elsif (x_int8 >= 256 ) then 
								pxl8conv <= '0' & x_slvm135 & pxl8(7 downto 0) & "000" & X"000";
								
			end if;
			
			
			if(x_int9>=0 and x_int9 <=1) then
								pxl9conv <= '0' & x_slvm127 &  "000" & X"00000";
				
								elsif (x_int9>=1  and x_int9<=3) then 
								pxl9conv <= '0' & x_slvm128 & pxl9(0) & "00" & X"00000"; 
								
								
								elsif (x_int9 >=4  and x_int9 <= 7 ) then 	
								pxl9conv <= '0' & x_slvm129 & pxl9(1 downto 0) & "0" &  X"00000";
									
					
								elsif (x_int9 >=8  and x_int9 <=15 ) then 
								pxl9conv <= '0' & x_slvm130 & pxl9(2 downto 0) &  X"00000";
								
								
								elsif (x_int9 >=16 and x_int9 <=31 ) then 
								pxl9conv <= '0' & x_slvm131 & pxl9(3 downto 0) & "000" & X"0000"; 
					
					
					
								elsif (x_int9 >=32 and x_int9 <=63 ) then  
								pxl9conv <= '0' & x_slvm132 & pxl9(4 downto 0) & "00" & X"0000";
					
								elsif (x_int9 >=64 and x_int9 <=127 ) then  
								pxl9conv <= '0' & x_slvm133 & pxl9(5 downto 0) & "0" & X"0000";
					
					
								elsif (x_int9 >=128 and x_int9 <=255) then 
								pxl9conv <= '0' & x_slvm134 & pxl9(6 downto 0) & X"0000";
					
								elsif (x_int9 >= 256 ) then 
								pxl9conv <= '0' & x_slvm135 & pxl9(7 downto 0) & "000" & X"000";
			end if;
			
 
  	end process;
	
end Behavioral;

