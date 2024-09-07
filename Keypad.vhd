library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity keypad is
port( 
     clk : in std_logic;
	  column : in std_logic_vector(3 downto 0);
	  row : in std_logic_vector(3 downto 0);
	  data : out std_logic_vector(3 downto 0)
);
end keypad;

architecture key of keypad is
signal colm : std_logic_vector(3 downto 0);

begin
process(clk,column,row,colm)
begin
colm <= column;

case colm is
when "0001" =>
      if row = "0001" then data <= "0000";
		elsif row = "0010" then data <= "0100";
		elsif row = "0100" then data <= "1000";
		elsif row = "1000" then data <= "1100";
		else data <= "UUUU";
		end if;
when "0010" =>
     if row = "0001" then data <= "0001";
	  elsif row = "0010" then data <= "0101";
	  elsif row = "0100" then data <= "1001";
	  elsif row = "1000" then data <= "1101";
	  else data <= "UUUU";
	  end if;
when "0100" =>
     if row = "0001" then data <= "0010";
	  elsif row = "0010" then data <= "0110";
	  elsif row = "0100" then data <= "1010";
	  elsif row = "1000" then data <= "1110";
	  else data <= "UUUU";
	  end if;
when "1000" =>
     if row = "0001" then data <= "0011";
	  elsif row = "0010" then data <= "0111";
	  elsif row = "0100" then data <= "1011";
	  elsif row = "1000" then data <= "1111";
	  else data <= "UUUU";
	  end if;
when others => data <= "UUUU";
end case;
end process;

end key;

	  
