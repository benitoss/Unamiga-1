library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity PROM4_DST is
port (
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of PROM4_DST is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0B",X"01",X"00",X"00",X"00",X"00",
		X"00",X"0F",X"0B",X"03",X"00",X"00",X"00",X"00",X"00",X"0F",X"0B",X"09",X"00",X"00",X"00",X"00",
		X"00",X"0F",X"0B",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"00",X"0E",
		X"00",X"0C",X"0F",X"01",X"00",X"01",X"0C",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"05",X"02",X"0B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"0C",X"0B",X"0E",X"00",X"00",X"00",X"00",X"00",X"05",X"01",X"09",X"00",X"05",X"03",X"09",
		X"00",X"0B",X"01",X"09",X"00",X"03",X"0C",X"0F",X"00",X"0E",X"00",X"0F",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
	data <= rom_data(to_integer(unsigned(addr)));
end architecture;
