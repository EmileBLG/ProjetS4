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

use work.package_LUT_bg.all;

entity sprite_tile_LUT is

Port ( 
    i_tile_index : in std_logic_vector (7 downto 0);
    i_tile_type : in std_logic_vector (5 downto 0);
    o_color_code : out std_logic_vector (3 downto 0)
);
end sprite_tile_LUT;

architecture Behavioral of sprite_tile_LUT is
    
    signal s_index : std_logic_vector(13 downto 0); -- 6 bits + 8 bits = 14 bits
    signal s_LUT_index : integer range 0 to 16383; -- 16384 pixels (64 tiles  x  16x16 pixels)

begin
    s_index <= i_tile_type & i_tile_index;
    s_LUT_index <= to_integer(unsigned( s_index )); -- (2^14 = 16384)
    
    --o_color_code <= tile_LUT(s_LUT_index);
    o_color_code <= P_LUT_TILE_BACKGROUND(s_LUT_index);

end Behavioral;
