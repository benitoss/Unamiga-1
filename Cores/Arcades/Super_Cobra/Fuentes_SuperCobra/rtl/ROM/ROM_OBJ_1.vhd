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
		X"44",X"04",X"04",X"04",X"04",X"08",X"00",X"00",X"40",X"42",X"42",X"42",X"FE",X"4E",X"44",X"44",
		X"00",X"00",X"18",X"18",X"18",X"18",X"00",X"00",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"E7",X"E7",X"3C",X"3C",X"E7",X"E7",X"3C",X"3C",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",
		X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",
		X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",
		X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",
		X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",
		X"FC",X"FE",X"02",X"02",X"02",X"06",X"04",X"00",X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",
		X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",
		X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",
		X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",X"7A",X"FC",X"8E",X"8A",X"82",X"FE",X"7C",X"00",
		X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",X"4C",X"DE",X"92",X"92",X"92",X"F6",X"64",X"00",
		X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",
		X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",X"F8",X"FE",X"1C",X"38",X"1C",X"FE",X"F8",X"00",
		X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",X"00",X"C0",X"F0",X"1E",X"1E",X"F0",X"C0",X"00",X"00",
		X"C2",X"E2",X"F2",X"BA",X"9E",X"8E",X"86",X"00",X"10",X"10",X"10",X"10",X"10",X"10",X"10",X"00",
		X"01",X"03",X"02",X"06",X"3C",X"60",X"C0",X"80",X"01",X"01",X"01",X"01",X"07",X"1C",X"70",X"C0",
		X"07",X"1C",X"30",X"60",X"40",X"C0",X"80",X"80",X"01",X"0F",X"06",X"02",X"06",X"1C",X"30",X"E0",
		X"80",X"C0",X"60",X"3C",X"06",X"02",X"03",X"01",X"C0",X"70",X"1C",X"07",X"01",X"01",X"01",X"01",
		X"80",X"80",X"C0",X"40",X"60",X"30",X"1C",X"07",X"E0",X"30",X"1C",X"06",X"02",X"06",X"0F",X"01",
		X"03",X"06",X"FC",X"80",X"E0",X"38",X"0E",X"03",X"F0",X"18",X"0F",X"01",X"07",X"1C",X"F0",X"80",
		X"80",X"80",X"C0",X"40",X"C0",X"40",X"C0",X"80",X"03",X"06",X"06",X"03",X"01",X"01",X"03",X"01",
		X"F0",X"10",X"30",X"60",X"C0",X"C0",X"60",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3C",X"42",X"81",X"A5",X"A5",X"99",X"42",X"3C",X"FF",X"81",X"81",X"81",X"81",X"81",X"81",X"FF",
		X"00",X"00",X"00",X"00",X"07",X"05",X"07",X"07",X"00",X"00",X"01",X"47",X"CD",X"44",X"C4",X"C4",
		X"00",X"07",X"05",X"07",X"00",X"00",X"00",X"00",X"44",X"C4",X"0D",X"C7",X"01",X"00",X"00",X"00",
		X"00",X"7C",X"82",X"82",X"7C",X"00",X"7C",X"82",X"82",X"7C",X"00",X"02",X"FE",X"42",X"00",X"00",
		X"82",X"7C",X"00",X"62",X"92",X"8A",X"46",X"00",X"82",X"7C",X"00",X"6C",X"92",X"82",X"44",X"00",
		X"00",X"03",X"23",X"03",X"03",X"03",X"23",X"20",X"00",X"00",X"10",X"00",X"00",X"00",X"10",X"10",
		X"20",X"00",X"03",X"03",X"20",X"00",X"00",X"00",X"10",X"00",X"00",X"00",X"10",X"00",X"00",X"00",
		X"00",X"03",X"03",X"23",X"23",X"23",X"03",X"03",X"00",X"00",X"00",X"10",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"23",X"23",X"00",X"00",X"00",X"00",X"10",X"10",X"10",X"00",X"00",X"00",X"00",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"C0",X"60",X"3F",X"01",X"07",X"1C",X"70",X"C0",X"0F",X"18",X"F0",X"80",X"E0",X"38",X"0F",X"01",
		X"0F",X"08",X"0C",X"06",X"03",X"03",X"06",X"07",X"C0",X"60",X"60",X"C0",X"80",X"80",X"C0",X"80",
		X"80",X"C0",X"40",X"60",X"3C",X"06",X"03",X"01",X"80",X"F0",X"60",X"40",X"60",X"38",X"0C",X"07",
		X"01",X"03",X"06",X"3C",X"60",X"40",X"C0",X"80",X"07",X"0C",X"38",X"E0",X"40",X"60",X"F0",X"80",
		X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",
		X"FF",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"80",X"FF",
		X"00",X"03",X"23",X"23",X"03",X"03",X"00",X"03",X"00",X"00",X"00",X"10",X"10",X"10",X"00",X"00",
		X"03",X"20",X"20",X"20",X"03",X"03",X"00",X"00",X"00",X"00",X"10",X"10",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"F0",
		X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"7F",X"FF",X"00",X"00",X"00",X"00",X"FF",X"F0",X"C0",X"C0",
		X"7F",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"C0",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"7F",X"FF",X"00",X"00",X"00",X"00",X"FF",X"F0",X"C0",X"D1",
		X"7F",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"C0",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"7F",X"FF",X"00",X"00",X"00",X"00",X"FF",X"F0",X"C0",X"E8",
		X"7F",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"C0",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"01",X"0B",X"45",X"ED",X"00",X"00",X"00",X"00",X"00",X"A0",X"C0",X"60",
		X"35",X"ED",X"45",X"0B",X"01",X"01",X"00",X"00",X"58",X"60",X"C0",X"A0",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"81",X"81",X"81",X"81",X"81",X"81",X"81",X"FF",
		X"81",X"81",X"81",X"81",X"81",X"81",X"81",X"81",X"FF",X"81",X"81",X"81",X"81",X"81",X"81",X"81",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",
		X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",
		X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",
		X"03",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"06",X"06",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"01",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C0",
		X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"E0",
		X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"E0",
		X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"30",X"F4",X"F4",X"F4",X"F4",X"F4",X"F4",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F4",X"94",X"14",X"74",X"34",X"14",X"00",X"00",
		X"10",X"10",X"10",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"02",X"05",X"02",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"10",X"10",X"10",X"11",X"12",X"10",X"00",X"00",X"40",X"40",X"60",X"60",X"60",X"60",
		X"10",X"07",X"2F",X"07",X"13",X"13",X"11",X"10",X"60",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"C0",
		X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"02",X"01",X"06",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"10",X"10",X"11",X"02",X"00",X"00",X"00",X"40",X"40",X"60",X"60",X"60",X"60",
		X"00",X"17",X"3F",X"17",X"13",X"13",X"11",X"00",X"60",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"C0",
		X"10",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"40",
		X"02",X"05",X"06",X"00",X"00",X"00",X"00",X"00",X"C0",X"40",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"10",X"00",X"01",X"12",X"10",X"00",X"00",X"40",X"40",X"60",X"60",X"60",X"60",
		X"10",X"17",X"3F",X"17",X"03",X"03",X"01",X"10",X"60",X"E0",X"E0",X"E0",X"E0",X"E0",X"E0",X"C0",
		X"07",X"06",X"06",X"06",X"06",X"06",X"06",X"06",X"FF",X"01",X"01",X"01",X"09",X"55",X"FF",X"55",
		X"06",X"06",X"06",X"06",X"06",X"06",X"06",X"07",X"FF",X"55",X"25",X"01",X"01",X"01",X"01",X"FF",
		X"01",X"01",X"03",X"02",X"00",X"06",X"03",X"0A",X"00",X"00",X"80",X"C0",X"B0",X"E0",X"C0",X"E0",
		X"0F",X"03",X"17",X"1D",X"0F",X"07",X"01",X"01",X"70",X"E0",X"D8",X"78",X"F0",X"D0",X"60",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"34",X"F6",X"B6",X"B6",X"B6",X"B6",X"F6",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F6",X"96",X"16",X"76",X"36",X"14",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"3F",X"31",X"31",X"31",X"31",X"31",X"3F",X"00",
		X"00",X"00",X"00",X"FB",X"FB",X"00",X"00",X"00",X"10",X"38",X"38",X"38",X"38",X"38",X"00",X"00",
		X"00",X"00",X"00",X"01",X"01",X"03",X"04",X"06",X"80",X"80",X"00",X"00",X"80",X"C0",X"C0",X"A0",
		X"15",X"0B",X"0D",X"0F",X"02",X"07",X"01",X"01",X"88",X"78",X"F8",X"B0",X"E0",X"B0",X"E0",X"40",
		X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"40",X"20",X"20",X"20",X"20",X"20",X"A0",X"F0",
		X"01",X"02",X"03",X"06",X"07",X"03",X"02",X"01",X"F0",X"A0",X"C0",X"F0",X"60",X"F0",X"C0",X"C0",
		X"00",X"00",X"00",X"00",X"00",X"02",X"02",X"00",X"00",X"00",X"00",X"40",X"40",X"E0",X"C0",X"E0",
		X"07",X"05",X"0E",X"03",X"07",X"02",X"03",X"00",X"60",X"C0",X"F0",X"E8",X"B0",X"F0",X"C0",X"C0",
		X"20",X"10",X"08",X"04",X"04",X"41",X"03",X"01",X"00",X"00",X"01",X"02",X"1C",X"80",X"A2",X"60",
		X"06",X"13",X"20",X"40",X"00",X"02",X"10",X"00",X"40",X"CC",X"80",X"60",X"10",X"08",X"03",X"00",
		X"08",X"04",X"04",X"02",X"81",X"43",X"22",X"15",X"01",X"06",X"08",X"10",X"30",X"20",X"C0",X"A0",
		X"0F",X"09",X"06",X"33",X"40",X"81",X"01",X"02",X"50",X"DE",X"61",X"D0",X"10",X"18",X"08",X"04",
		X"04",X"02",X"02",X"01",X"06",X"8F",X"76",X"1A",X"04",X"08",X"10",X"C0",X"B0",X"E8",X"2F",X"98",
		X"1B",X"1C",X"0A",X"07",X"07",X"08",X"08",X"10",X"EC",X"CC",X"B8",X"F0",X"90",X"08",X"86",X"41",
		X"80",X"40",X"25",X"1F",X"17",X"0D",X"5B",X"B2",X"21",X"41",X"42",X"B4",X"FC",X"B0",X"D8",X"EE",
		X"1A",X"0F",X"05",X"1E",X"1D",X"23",X"40",X"80",X"E9",X"56",X"F8",X"DC",X"E8",X"4C",X"82",X"81",
		X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"04",X"14",X"41",X"03",X"01",X"07",X"13",X"01",X"02",X"1C",X"80",X"A2",X"60",X"40",X"CC",
		X"00",X"00",X"00",X"00",X"00",X"08",X"04",X"04",X"00",X"00",X"00",X"00",X"00",X"01",X"06",X"08",
		X"02",X"81",X"43",X"22",X"15",X"0F",X"09",X"06",X"10",X"30",X"20",X"C0",X"A0",X"50",X"DE",X"61",
		X"00",X"00",X"00",X"00",X"04",X"02",X"02",X"01",X"00",X"00",X"00",X"00",X"04",X"08",X"10",X"C0",
		X"06",X"8F",X"76",X"1A",X"1B",X"1C",X"0A",X"1D",X"B0",X"E8",X"2F",X"98",X"EC",X"CC",X"B8",X"AC",
		X"00",X"00",X"00",X"01",X"04",X"07",X"0C",X"0C",X"00",X"00",X"80",X"80",X"80",X"C0",X"C0",X"A0",
		X"0F",X"0C",X"04",X"07",X"01",X"00",X"00",X"00",X"E0",X"C0",X"80",X"80",X"80",X"80",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
