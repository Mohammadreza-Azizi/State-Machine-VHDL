library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity vending_machine is
port(
     clk :                               in std_logic;
	  rst :                               in std_logic;
	  rw, rs, e  :                       OUT STD_LOGIC;
	  column :         in std_logic_vector(3 downto 0);
	  row :            in std_logic_vector(3 downto 0);
	  CD,CR :                             in std_logic;
	  CW :             in std_logic_vector(1 downto 0);
	  chips :          in std_logic_vector(1 downto 0);
	  popcorn :        in std_logic_vector(1 downto 0);
	  cake :           in std_logic_vector(1 downto 0);
	  soda :           in std_logic_vector(1 downto 0);
	  water :          in std_logic_vector(1 downto 0);
	  lemonade :       in std_logic_vector(1 downto 0);
	  coffee :         in std_logic_vector(1 downto 0);
	  tea :            in std_logic_vector(1 downto 0);
	  hotchocolate:    in std_logic_vector(1 downto 0);
	  DD_A :                             out std_logic;
	  DD_B :                             out std_logic;
	  DD_C :                             out std_logic;
	  CR_O :                             out std_logic;
	  lcd_data   :    OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);

end vending_machine;

architecture vending_machine_map of vending_machine is

signal F : std_logic_vector(3 downto 0);
signal F1 : std_logic_vector(127 downto 0);
signal F2 : std_logic_vector(127 downto 0);

component controller 
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
	  LCD_Data_line1 : out std_logic_vector(127 downto 0);
	  LCD_Data_line2 : out std_logic_vector(127 downto 0)
);
end component;


component keypad 
port( 
     clk : in std_logic;
	  column : in std_logic_vector(3 downto 0);
	  row : in std_logic_vector(3 downto 0);
	  data : out std_logic_vector(3 downto 0)
);
end component;


component LCD 
  PORT(
    clk        : IN    STD_LOGIC;
    reset_n    : IN    STD_LOGIC;
    rw, rs, e  : OUT   STD_LOGIC;
    lcd_data   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
	 line1_buffer : IN STD_LOGIC_VECTOR(127 downto 0);
	 line2_buffer : IN STD_LOGIC_VECTOR(127 downto 0)
);

END component;

begin

L1: controller port map (clk,rst,CD,CR,cw,F,chips,popcorn,cake,soda,water,lemonade,coffee,tea,hotchocolate,DD_A,DD_B,DD_C,CR_O,F1,F2);
L2: keypad port map (clk,column,row,F);
L3: LCD port map (clk,rst,rw,rs,e,lcd_data,F1,F2);
end vending_machine_map;