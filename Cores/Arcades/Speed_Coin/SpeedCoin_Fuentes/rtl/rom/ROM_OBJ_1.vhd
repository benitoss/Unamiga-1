library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_OBJ_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_OBJ_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"8C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"0C",X"6E",X"9A",X"9A",X"B2",X"F2",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"00",X"00",X"00",X"00",X"24",X"24",X"18",X"00",X"00",
		X"00",X"00",X"00",X"06",X"06",X"00",X"00",X"00",X"00",X"60",X"F0",X"9A",X"8A",X"C0",X"60",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"01",X"03",X"07",X"0F",X"1F",X"3F",X"7F",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",
		X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",
		X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",
		X"80",X"90",X"90",X"90",X"FE",X"FE",X"00",X"00",X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",
		X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",
		X"FC",X"FE",X"06",X"06",X"06",X"0E",X"0C",X"00",X"82",X"C6",X"6C",X"38",X"18",X"FE",X"FE",X"00",
		X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",
		X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",
		X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",X"7A",X"FC",X"8E",X"8A",X"82",X"FE",X"7C",X"00",
		X"62",X"F6",X"8E",X"8C",X"88",X"FE",X"FE",X"00",X"0C",X"5E",X"D2",X"92",X"92",X"F6",X"64",X"00",
		X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",
		X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",X"F8",X"FE",X"1C",X"38",X"1C",X"FE",X"F8",X"00",
		X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",X"00",X"C0",X"F0",X"1E",X"1E",X"F0",X"C0",X"00",X"00",
		X"C2",X"E2",X"F2",X"BA",X"9E",X"8E",X"86",X"00",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"78",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"07",X"07",X"07",X"07",X"07",X"07",X"07",X"07",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"78",X"78",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"3C",X"3C",X"3C",X"3C",X"78",X"78",X"78",X"78",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"3C",X"3C",
		X"07",X"07",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"03",X"03",X"03",X"03",X"07",X"07",X"07",X"07",
		X"01",X"01",X"01",X"01",X"01",X"01",X"03",X"03",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"C0",X"C0",X"C0",X"C0",X"80",X"80",X"80",X"80",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"C0",X"C0",
		X"78",X"78",X"78",X"78",X"F0",X"F0",X"F0",X"F0",X"1E",X"1E",X"1E",X"1E",X"3C",X"3C",X"3C",X"3C",
		X"07",X"07",X"07",X"07",X"0F",X"0F",X"0F",X"0F",X"01",X"01",X"01",X"01",X"03",X"03",X"03",X"03",
		X"80",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"E0",X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",
		X"3C",X"3C",X"78",X"78",X"78",X"F0",X"F0",X"F0",X"07",X"0F",X"0F",X"0F",X"1E",X"1E",X"1E",X"3C",
		X"01",X"01",X"01",X"03",X"03",X"03",X"07",X"07",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"80",X"80",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"78",
		X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",
		X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",
		X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"07",X"07",X"07",X"07",X"07",X"07",X"07",X"07",
		X"07",X"07",X"07",X"07",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",
		X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",
		X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"1E",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",X"3C",
		X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"78",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"07",X"07",X"07",X"07",X"07",X"07",X"07",X"07",
		X"1E",X"1E",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"3C",X"3C",X"3C",X"3C",X"1E",X"1E",X"1E",X"1E",
		X"78",X"78",X"78",X"78",X"78",X"78",X"3C",X"3C",X"E0",X"E0",X"F0",X"F0",X"F0",X"F0",X"F0",X"F0",
		X"C0",X"C0",X"C0",X"C0",X"E0",X"E0",X"E0",X"E0",X"80",X"80",X"80",X"80",X"80",X"80",X"C0",X"C0",
		X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"03",X"03",X"01",X"01",X"01",X"01",
		X"07",X"07",X"07",X"07",X"07",X"07",X"03",X"03",X"1E",X"1E",X"1E",X"1E",X"0F",X"0F",X"0F",X"0F",
		X"78",X"78",X"78",X"78",X"3C",X"3C",X"3C",X"3C",X"E0",X"E0",X"E0",X"E0",X"F0",X"F0",X"F0",X"F0",
		X"80",X"80",X"80",X"80",X"C0",X"C0",X"C0",X"C0",X"01",X"01",X"01",X"01",X"00",X"00",X"00",X"00",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"3C",X"3C",X"1E",X"1E",X"1E",X"0F",X"0F",X"0F",
		X"E0",X"F0",X"F0",X"F0",X"78",X"78",X"78",X"3C",X"80",X"80",X"80",X"C0",X"C0",X"C0",X"E0",X"E0",
		X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"07",X"07",X"03",X"03",X"03",X"01",X"01",
		X"07",X"1F",X"3C",X"70",X"60",X"E3",X"C7",X"C7",X"E0",X"F8",X"3C",X"0E",X"06",X"C7",X"E3",X"E3",
		X"C7",X"C7",X"E3",X"60",X"70",X"3C",X"1F",X"07",X"E3",X"E3",X"C7",X"06",X"0E",X"3C",X"F8",X"E0",
		X"FF",X"7F",X"3F",X"1F",X"0F",X"07",X"03",X"01",X"F3",X"A1",X"2D",X"6D",X"6D",X"09",X"9B",X"FF",
		X"7F",X"7F",X"01",X"01",X"7F",X"7F",X"FF",X"FF",X"7D",X"6D",X"6D",X"6D",X"01",X"01",X"FF",X"FF",
		X"9D",X"09",X"71",X"73",X"77",X"01",X"01",X"FF",X"01",X"01",X"E3",X"C7",X"8F",X"01",X"01",X"FF",
		X"44",X"44",X"38",X"00",X"44",X"44",X"44",X"38",X"7C",X"18",X"30",X"7C",X"00",X"7C",X"00",X"38",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"00",X"01",X"03",X"07",X"0F",X"0F",X"0F",X"0F",X"0F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"F0",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"30",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"0F",X"0F",X"07",X"07",X"03",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"0F",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"F8",X"F0",X"F0",X"70",X"10",X"F8",X"F8",X"F8",X"70",X"30",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"7F",X"FF",X"FF",
		X"01",X"03",X"03",X"03",X"01",X"01",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"E0",X"F8",X"FE",X"FF",X"FF",X"FF",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7F",X"7F",X"7F",X"7F",X"4F",X"0F",X"0E",X"08",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"3F",X"00",X"00",X"C0",X"E0",X"F8",X"F8",X"F0",X"E0",
		X"1F",X"1F",X"1F",X"1E",X"00",X"00",X"00",X"00",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"0F",X"1F",X"1F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"3F",X"3F",X"3F",X"7F",X"7F",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"F0",X"F8",X"FC",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FE",X"FE",X"FE",X"FE",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"7F",X"7F",X"FF",X"0F",X"07",X"07",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"0F",X"1F",X"1F",X"07",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FE",X"FC",X"FC",X"FC",X"FC",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FC",X"FE",X"FE",X"FC",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"0F",X"0F",X"FF",X"7F",X"7F",X"3F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"0E",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"C0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",
		X"00",X"00",X"00",X"0F",X"0F",X"0F",X"0F",X"07",X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"FC",X"FC",X"F8",X"70",X"70",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FE",X"FE",X"FC",X"FC",X"38",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
