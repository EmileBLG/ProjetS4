----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: sprite_tile_LUT - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.package_LUT_actor.all;

entity sprite_tile_LUT is
-- testing with generics: would be nice to expose the LUT to the block design so we can have them in another file
generic (
    tile_LUT : P_LUT_TILE
);

Port ( 
    i_tile_index : in std_logic_vector (7 downto 0);
    i_tile_type : in std_logic_vector (5 downto 0);
    o_color_code : out std_logic_vector (3 downto 0)
);
end sprite_tile_LUT;

architecture Behavioral of sprite_tile_LUT is

    --type LUT is array (natural range <>) of std_logic_vector (3 downto 0);
    --signal LUT_tile : LUT(0 to 2047) := (
    ---- tile 0
    --"0000","0001","1010","0011", "0100","0101","0110","0111", "0000","0001","1010","0011", "0100","0101","0110","0111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    ---- tile 1
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --"0000","0001","0010","0011", "0100","0101","0110","0111", "1000","1001","1010","1011", "1100","1101","1110","1111",
    --
    ---- tile 2
    --others => "0000"
    --);
    
    signal s_index : std_logic_vector(13 downto 0); -- 6 bits + 8 bits = 14 bits
    signal s_LUT_index : integer range 0 to 2047; -- 2048 pixels (8 tile x 16x16 pixels)

begin
    s_index <= i_tile_type & i_tile_index;
    s_LUT_index <= to_integer(unsigned( s_index(10 downto 0) )); -- keep 11 bits (2^11 = 2048)
    
    --o_color_code <= LUT_tile(s_LUT_index);
    o_color_code <= tile_LUT(s_LUT_index);

end Behavioral;
