----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: node_background - Behavioral
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

entity node_background is
Port (
    i_absolute_pos_x : in std_logic_vector (9 downto 0);
    i_absolute_pos_y : in std_logic_vector (9 downto 0);
    i_sprite_picker  : in std_logic_vector (4 downto 0);
    o_color_code     : out std_logic_vector (3 downto 0);
    o_is_hidden      : out std_logic
);
end node_background;

architecture Behavioral of node_background is
    
    
    component sprite_top is
        Port ( 
            i_map_index_x   : in std_logic_vector (5 downto 0);
            i_map_index_y   : in std_logic_vector (5 downto 0);
            i_tile_index_x  : in std_logic_vector (3 downto 0);
            i_tile_index_y  : in std_logic_vector (3 downto 0);
            i_sprite_picker : in std_logic_vector (4 downto 0);
            i_is_hidden     : in std_logic;
            o_color_code    : out std_logic_vector (3 downto 0);
            o_is_hidden     : out std_logic
        );
    end component ;
    
    
    signal s_map_index_x : std_logic_vector(5 downto 0); 
    signal s_map_index_y : std_logic_vector(5 downto 0);
    
    signal s_tile_index_x : std_logic_vector(3 downto 0); 
    signal s_tile_index_y : std_logic_vector(3 downto 0);
    
    signal s_is_hidden : std_logic;
    

begin
    -- does the job of indexing_top
    s_map_index_x <= i_absolute_pos_x(9 downto 4);
    s_map_index_y <= i_absolute_pos_y(9 downto 4);
    s_tile_index_x <= i_absolute_pos_x(3 downto 0);
    s_tile_index_y <= i_absolute_pos_y(3 downto 0);
    
    inst_sprite : sprite_top
    port map ( 
        i_map_index_x   => s_map_index_x,
        i_map_index_y   => s_map_index_y,
        i_tile_index_x  => s_tile_index_x,
        i_tile_index_y  => s_tile_index_y,
        i_sprite_picker => i_sprite_picker,
        i_is_hidden     => '0',
        o_color_code    => o_color_code,
        o_is_hidden     => s_is_hidden
    );
    
    o_is_hidden <= '0'; -- background cannot be hidden
    
end Behavioral;
