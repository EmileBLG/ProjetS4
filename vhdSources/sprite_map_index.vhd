----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: sprite_map_index - Behavioral
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

entity sprite_map_index is
Port ( 
    TileIndexX:     in std_logic_vector (5 downto 0);
    TileIndexY:     in std_logic_vector (5 downto 0);
    TileIndex:      out std_logic_vector (11 downto 0)
);
end sprite_map_index;

architecture Behavioral of sprite_map_index is
begin
    TileIndex (11 downto 6) <= TileIndexX;
    TileIndex (5 downto 0) <= TileIndexY;
end Behavioral;
