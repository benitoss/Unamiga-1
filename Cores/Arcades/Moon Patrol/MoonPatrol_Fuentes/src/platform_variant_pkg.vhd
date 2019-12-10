library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;
--use work.target_pkg.all;
--use work.project_pkg.all;
--use work.platform_pkg.all;

package platform_variant_pkg is

	--  
	-- PACE constants which *MUST* be defined
	--

	--
	-- Platform-specific constants (optional)
	--

  constant PLATFORM_VARIANT             : string := "mpatrol";
  constant PLATFORM_VARIANT_SRC_DIR     : string := "";
  type pal_rgb_t is array (0 to 2) of std_logic_vector(7 downto 0);
  type pal_a is array (natural range <>) of pal_rgb_t;
  type rom_a is array (natural range <>) of string;
  constant M52_ROM                      : rom_a(0 to 3) := 
                                          (
                                            0 => "mpa-1.3m", 
                                            1 => "mpa-2.3l",
                                            2 => "mpa-3.3k",
                                            3 => "mpa-4.3j"
                                          );
  constant M52_ROM_WIDTHAD              : natural := 12;

  constant M52_CHAR_ROM                 : rom_a(0 to 1) := 
                                          (
                                            0 => "mpe-5.3e", 
                                            1 => "mpe-4.3f"
                                          );

  constant M52_SPRITE_ROM               : rom_a(0 to 1) := 
                                          (
                                            0 => "mpb-2.3m", 
                                            1 => "mpb-1.3n"
                                          );

  constant M52_BG_ROM                   : rom_a(0 to 2) := 
                                          (
                                            2 => "mpe-1.3l",  -- mountains
                                            1 => "mpe-2.3k",  -- hills
                                            0 => "mpe-3.3h"   -- cityscape
                                          );

	constant tile_pal : pal_a(0 to 127) :=
	(
    1 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    2 => (0=>"11111111", 1=>"11111111", 2=>"11111111"),
    3 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    4 => (0=>"00000000", 1=>"00100001", 2=>"11111111"),
    5 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    6 => (0=>"11111111", 1=>"11111111", 2=>"00000000"),
    7 => (0=>"00000000", 1=>"00100001", 2=>"11111111"),
    8 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    9 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    10 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    11 => (0=>"00000000", 1=>"00100001", 2=>"11111111"),
    12 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    13 => (0=>"00000000", 1=>"10111000", 2=>"00000000"),
    14 => (0=>"11111111", 1=>"00000000", 2=>"10101110"),
    17 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    19 => (0=>"10010111", 1=>"01101000", 2=>"01010001"),
    20 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    21 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    24 => (0=>"00000000", 1=>"00100001", 2=>"11111111"),
    25 => (0=>"11111111", 1=>"00000000", 2=>"10101110"),
    26 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    27 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    28 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    29 => (0=>"11111111", 1=>"00000000", 2=>"10101110"),
    33 => (0=>"11111111", 1=>"11111111", 2=>"11111111"),
    36 => (0=>"00000000", 1=>"00100001", 2=>"11111111"),
    37 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    38 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    40 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    41 => (0=>"11111111", 1=>"00000000", 2=>"10101110"),
    44 => (0=>"10111000", 1=>"01101000", 2=>"10101110"),
    45 => (0=>"11111111", 1=>"00000000", 2=>"10101110"),
    46 => (0=>"00100001", 1=>"01000111", 2=>"10101110"),
    47 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    48 => (0=>"10111000", 1=>"01101000", 2=>"10101110"),
    49 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    50 => (0=>"11111111", 1=>"11111111", 2=>"00000000"),
    51 => (0=>"10111000", 1=>"01101000", 2=>"10101110"),
    52 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    53 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    54 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    55 => (0=>"10111000", 1=>"01101000", 2=>"10101110"),
    56 => (0=>"10111000", 1=>"01101000", 2=>"10101110"),
    57 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    58 => (0=>"11111111", 1=>"00100001", 2=>"00000000"),
    61 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    62 => (0=>"10111000", 1=>"11111111", 2=>"10101110"),
    63 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    65 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    66 => (0=>"10111000", 1=>"11111111", 2=>"10101110"),
    67 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    69 => (0=>"11111111", 1=>"00000000", 2=>"00000000"),
    70 => (0=>"10111000", 1=>"11111111", 2=>"10101110"),
    71 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    73 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    74 => (0=>"10111000", 1=>"11111111", 2=>"10101110"),
    75 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    77 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    78 => (0=>"10111000", 1=>"11111111", 2=>"10101110"),
    79 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
    81 => (0=>"11111111", 1=>"10010111", 2=>"01010001"),
    82 => (0=>"00000000", 1=>"10111000", 2=>"11111111"),
    83 => (0=>"00100001", 1=>"00000000", 2=>"00000000"),
		others => (others => (others => '0'))
  );
                                          
  constant bg_pal : pal_a(0 to 31) :=
  (
    1 => (0=>"00000000", 1=>"10010111", 2=>"00000000"),
    3 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    4 => (0=>"00000000", 1=>"00000000", 2=>"11111111"),
    5 => (0=>"00000000", 1=>"10010111", 2=>"00000000"),
    7 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    9 => (0=>"00000000", 1=>"10010111", 2=>"00000000"),
    11 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    12 => (0=>"00000000", 1=>"10010111", 2=>"10101110"),
    13 => (0=>"00000000", 1=>"10010111", 2=>"00000000"),
    15 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    18 => (0=>"11111111", 1=>"11011110", 2=>"01010001"),
    19 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    20 => (0=>"00000000", 1=>"00000000", 2=>"11111111"),
    22 => (0=>"11111111", 1=>"11011110", 2=>"01010001"),
    23 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    26 => (0=>"11111111", 1=>"11011110", 2=>"01010001"),
    27 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
    28 => (0=>"00000000", 1=>"10010111", 2=>"10101110"),
    30 => (0=>"11111111", 1=>"11011110", 2=>"01010001"),
    31 => (0=>"00000000", 1=>"11011110", 2=>"01010001"),
		others => (others => (others => '0'))
  );
  
	constant sprite_pal : pal_a(0 to 15) :=
	(
    1 => (0=>"00000000", 1=>"00000000", 2=>"00011010"),
    2 => (0=>"11000001", 1=>"00000000", 2=>"10101110"),
    3 => (0=>"00000000", 1=>"10101110", 2=>"11001000"),
    4 => (0=>"10000100", 1=>"11001000", 2=>"00000000"),
    5 => (0=>"11000001", 1=>"00000000", 2=>"00000000"),
    6 => (0=>"00000000", 1=>"11001000", 2=>"00000000"),
    7 => (0=>"10000100", 1=>"00000000", 2=>"00000000"),
    8 => (0=>"11000001", 1=>"11001000", 2=>"11001000"),
    9 => (0=>"11000001", 1=>"11001000", 2=>"00000000"),
    10 => (0=>"10000100", 1=>"01010001", 2=>"00000000"),
    11 => (0=>"00111110", 1=>"00110111", 2=>"00000000"),
    12 => (0=>"00111110", 1=>"00000000", 2=>"11001000"),
    13 => (0=>"11000001", 1=>"10010000", 2=>"00000000"),
    14 => (0=>"00111110", 1=>"10010000", 2=>"11001000"),
    15 => (0=>"00000000", 1=>"01010001", 2=>"00000000"),
		others => (others => (others => '0'))
	);

  type table_a is array (natural range <>) of integer range 0 to 15;
  constant sprite_table : table_a(0 to 63) :=
  (
    1 => 1,
    2 => 2,
    3 => 3,
    5 => 4,
    6 => 2,
    7 => 5,
    9 => 5,
    10 => 6,
    11 => 7,
    13 => 7,
    14 => 8,
    15 => 9,
    17 => 10,
    19 => 11,
    29 => 9,
    30 => 14,
    31 => 5,
    33 => 5,
    34 => 3,
    35 => 15,
    37 => 9,
    38 => 1,
    39 => 5,
    41 => 1,
    42 => 8,
    45 => 1,
    46 => 5,
    49 => 1,
    50 => 5,
    51 => 3,
    53 => 4,
    54 => 13,
    55 => 5,
    57 => 5,
    59 => 5,
    62 => 5,
    63 => 5,
    others => 0
  );
  
end package platform_variant_pkg;
