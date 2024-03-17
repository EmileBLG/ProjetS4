----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: sprite_tile_index - Behavioral
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

entity sprite_tile_index is
Port ( 
    i_tile_index_x : in std_logic_vector (3 downto 0);
    i_tile_index_y : in std_logic_vector (3 downto 0);
    o_tile_index :  out std_logic_vector (7 downto 0) 
);
end sprite_tile_index;

architecture Behavioral of sprite_tile_index is

begin
    --o_tile_index (7 downto 4) <= i_tile_index_y;
    --o_tile_index (3 downto 0) <= i_tile_index_x;
    o_tile_index <= i_tile_index_y & i_tile_index_x;
end Behavioral;
