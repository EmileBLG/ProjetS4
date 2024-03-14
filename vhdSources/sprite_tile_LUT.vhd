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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sprite_tile_LUT is
Port ( 
    i_tile_index : in std_logic_vector (7 downto 0);
    i_tile_type : in std_logic_vector (5 downto 0);
    o_color_code : out std_logic_vector (3 downto 0)
);
end sprite_tile_LUT;

architecture Behavioral of sprite_tile_LUT is

    --
    --
    -- change it and make it 8 tile type per actor
    -- (for a total of 64 tiles if we have 8 actors)
    --
    --

    type LUT is array (natural range <>) of std_logic_vector (3 downto 0);
    signal LUT_tile : LUT(0 to 16383) := (
    "0000",
    "0001",
    "0010",
    "0011",
    "0100",
    "0101",
    "0110",
    "0111",
    others => "0000"
    );
    
    signal s_index : std_logic_vector(13 downto 0); 
    signal s_LUT_index : integer range 0 to 16383; -- 16'384 pixels (64 tile x 16x16 pixels)

begin
    s_index <= i_tile_type & i_tile_index;
    s_LUT_index <= to_integer(unsigned( s_index ));

end Behavioral;
