library ieee;
use ieee.std_logic_1164.all;
entity controller is
port( 
     clk,Rst :                        in std_logic;
	  CD,CR :                          in std_logic;
	  CW :          in std_logic_vector(1 downto 0);
	  key :         in std_logic_vector(3 downto 0);
	  chips :       in std_logic_vector(1 downto 0);
	  popcorn :     in std_logic_vector(1 downto 0);
	  cake :        in std_logic_vector(1 downto 0);
	  soda :        in std_logic_vector(1 downto 0);
	  water :       in std_logic_vector(1 downto 0);
	  lemonade :    in std_logic_vector(1 downto 0);
	  coffee :      in std_logic_vector(1 downto 0);
	  tea :         in std_logic_vector(1 downto 0);
	  hotchocolate: in std_logic_vector(1 downto 0);
	  DD_A :                          out std_logic;
	  DD_B :                          out std_logic;
	  DD_C :                          out std_logic;
	  CR_O :                          out std_logic;
	  LCD_Data_line1 :    out std_logic_vector(127 downto 0);
	  LCD_Data_line2 :    out std_logic_vector(127 downto 0)
);
end controller;

architecture behv of controller is

type states is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20,S21,S22,S23,S24,S25,S26,s27);
signal CS,NS : states;

begin
process(clk, rst)
begin
     if rst = '0' then 
       cs <= S0;
     elsif rising_edge(clk) then
       cs <= ns;
		end if;  
end process;

process(cd,cr,cw,key,chips,popcorn,cake,soda,water,lemonade,coffee,tea,hotchocolate,cs,ns)
begin
      case cs is
		     when s0 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20496E736572742054686520436F696E"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if cd = '1' then ns <= s1; else ns <= s0; end if;
			  
			  when s1 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if cw = "01" then ns <= s3; elsif cw = "10" then ns <= s4; elsif cw = "11" then ns <= s5; elsif cw = "00" then ns <= s27; end if;
				
		     when s2 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '1'; lcd_data_line1 <= x"20202020205069636B20757020202020"; lcd_data_line2 <= x"20202020596F757220436F696E202020";	
			       ns <= s0;
					 
			  when s3 =>  dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202053656C65637420546865202020"; lcd_data_line2 <= x"202020202050726F6475637420202020";
			       if cr = '1' then ns <= s2; elsif key = "0001" then ns <= s6; elsif key = "0010" then ns <= s7; elsif key = "0011" then ns <= s8; else ns <= s3; end if;
					 
			  when s4 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"202020202050726F6475637420202020";
					 if cr = '1' then ns <= s2; elsif key = "0100" then ns <= s9; elsif key = "0101" then ns <= s10; elsif key = "0110" then ns <= s11; else ns <= s4; end if;
					 
			  when s5 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202053656C65637420546865202020"; lcd_data_line2 <= x"202020202050726F6475637420202020";
			       if cr = '1' then ns <= s2; elsif key = "0111" then ns <= s12; elsif key = "1000" then ns <= s13; elsif key = "1001" then ns <= s14; else ns <= s5; end if;
					 
			  when s6 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if chips = "01" then ns <= s15; elsif chips = "10" then ns <= s15; elsif chips = "11" then ns <= s15; elsif chips = "00" then ns <= s3; end if;
					 
			  when s7 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if popcorn = "01" then ns <= s16; elsif popcorn = "10" then ns <= s16; elsif popcorn = "11" then ns <= s16; elsif popcorn = "00" then ns <= s3; end if;
					 
			  when s8 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if cake = "01" then ns <= s17; elsif cake = "10" then ns <= s17; elsif cake = "11" then ns <= s17; elsif cake = "00" then ns <= s3; end if;
					 
			  when s9 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if soda = "01" then ns <= s18; elsif soda = "10" then ns <= s18; elsif soda = "11" then ns <= s18; elsif soda = "00" then ns <= s4; end if;
					 
			  when s10 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";	 
			       if water = "01" then ns <= s19; elsif water = "10" then ns <= s19; elsif water = "11" then ns <= s19; elsif water = "00" then ns <= s4; end if;
					 
			  when s11 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020"; 
			       if lemonade = "01" then ns <= s20; elsif lemonade = "10" then ns <= s20; elsif lemonade = "11" then ns <= s20; elsif lemonade = "00" then ns <= s4; end if;
					 
			  when s12 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if coffee = "01" then ns <= s21; elsif coffee = "10" then ns <= s21; elsif coffee = "11" then ns <= s21; elsif coffee = "00" then ns <= s5; end if;
					 
			  when s13 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       if tea = "01" then ns <= s22; elsif tea = "10" then ns <= s22; elsif tea = "11" then ns <= s22; elsif tea = "00" then ns <= s5; end if;
					 
			  when s14 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020202020202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";	
			       if hotchocolate = "01" then ns <= s23; elsif hotchocolate = "10" then ns <= s23; elsif hotchocolate = "11" then ns <= s23; elsif hotchocolate = "00" then ns <= s5; end if;
					 
			  when s15 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202043686970732020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s24;
					 
			  when s16 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020506F70636F726E2020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s24;
					 
			  when s17 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202043616B65202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s24;
					 
			  when s18 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"202020202020536F6461202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s25;
					 
			  when s19 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202057617465722020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s25;
					 
			  when s20 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"202020204C656D6F6E61646520202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s25;
					 
			  when s21 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"2020202020436F666665652020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s26;
					 
			  when s22 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020202020546561202020202020"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s26;
					 
			  when s23 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"2020486F742043686F636F6C61746520"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s26;
					 
		     when s24 => dd_a <= '1'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020205069636B20757020202020"; lcd_data_line2 <= x"2020596F75722050726F647563742020";
			       ns <= s0;
					 
			  when s25 => dd_a <= '0'; dd_b <= '1'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20202020205069636B20757020202020"; lcd_data_line2 <= x"2020596F75722050726F647563742020";
			       ns <= s0;
					 
			  when s26 => dd_a <= '0'; dd_b <= '0'; dd_c <= '1'; cr_o <= '0'; lcd_data_line1 <= x"20202020205069636B20757020202020"; lcd_data_line2 <= x"2020596F75722050726F647563742020";
			       ns <= s0;
					 
			  when s27 => dd_a <= '0'; dd_b <= '0'; dd_c <= '0'; cr_o <= '0'; lcd_data_line1 <= x"20496E636F727265637420436F696E20"; lcd_data_line2 <= x"20202020202020202020202020202020";
			       ns <= s2;

					 
   end case;
 end process;
end behv;