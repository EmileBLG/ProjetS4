----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: sprite_map_LUT - Behavioral
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

entity sprite_map_LUT is
Port ( 
    i_map_index : in std_logic_vector (11 downto 0);
    i_sprite_picker : in std_logic_vector (4 downto 0);
    o_tile_type : out std_logic_vector (5 downto 0)
);
end sprite_map_LUT;

architecture Behavioral of sprite_map_LUT is

    type LUT is array (natural range <>) of std_logic_vector (5 downto 0);
    signal LUT_map : LUT(0 to 4095) := (
    "000010",
    "000001",
    "000000",
    "000011",
    "000100",
    "000101",
    "000110",
    "001111",
    others => "000000"
    );
    
    -- signal s_index : std_logic_vector(13 downto 0); 
    signal s_LUT_index : integer range 0 to 4095;
    
begin
    
    -- s_index <= i_sprite_picker & i_map_index; -- TODO: change this to an addition
    s_LUT_index <= to_integer(unsigned( i_map_index )); -- TODO: swap i_map_index with s_index
    
    
    o_tile_type <= LUT_map(s_LUT_index) ;


end Behavioral;
