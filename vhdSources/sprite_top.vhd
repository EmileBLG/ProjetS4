----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: sprite_top - Behavioral
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

use work.package_LUT_actor.all;

entity sprite_top is
Port ( 
    i_map_index_x : in std_logic_vector (5 downto 0);
    i_map_index_y : in std_logic_vector (5 downto 0);
    i_tile_index_x : in std_logic_vector (3 downto 0);
    i_tile_index_y : in std_logic_vector (3 downto 0);
    i_sprite_picker : in std_logic_vector (4 downto 0);
    i_is_hidden : in std_logic;
    o_color_code : out std_logic_vector (3 downto 0);
    o_is_hidden : out std_logic
);
end sprite_top;

architecture Behavioral of sprite_top is
    
    component sprite_map_index is
        port (
            i_map_index_x : in std_logic_vector (5 downto 0);
            i_map_index_y : in std_logic_vector (5 downto 0);
            o_map_index : out std_logic_vector (11 downto 0)
        );
    end component;
    
    component sprite_tile_index is
        port (
            i_tile_index_x : in std_logic_vector (3 downto 0);
            i_tile_index_y : in std_logic_vector (3 downto 0);
            o_tile_index : out std_logic_vector (7 downto 0)
        );
    end component;
    
    component sprite_map_LUT is
        port (
            i_map_index : in std_logic_vector (11 downto 0);
            i_sprite_picker : in std_logic_vector (4 downto 0);
            o_tile_type : out std_logic_vector (5 downto 0)
        );
    end component;
    
    component sprite_tile_LUT is
        generic (
            tile_LUT : P_LUT_TILE
        );
        port (
            i_tile_index : in std_logic_vector (7 downto 0);
            i_tile_type : in std_logic_vector (5 downto 0);
            o_color_code : out std_logic_vector (3 downto 0)
        );
    end component;
    
    component sprite_trsp is
        port (
            i_color_code : in std_logic_vector (3 downto 0);
            i_is_hidden : in std_logic;
            o_is_hidden : out std_logic
        );
    end component;
    
    signal s_map_index : std_logic_vector (11 downto 0);
    signal s_tile_index : std_logic_vector (7 downto 0);
    signal s_tile_type : std_logic_vector (5 downto 0);
    signal s_color_code : std_logic_vector (3 downto 0);
    
begin
    
    inst_map_index : sprite_map_index
    port map(
        i_map_index_x => i_map_index_x,
        i_map_index_y => i_map_index_y,
        o_map_index => s_map_index
    );
    
    inst_tile_index : sprite_tile_index
    port map(
        i_tile_index_x => i_tile_index_x,
        i_tile_index_y => i_tile_index_y,
        o_tile_index => s_tile_index
    );
    
    inst_map_LUT : sprite_map_LUT
    port map(
        i_map_index => s_map_index,
        i_sprite_picker => i_sprite_picker,
        o_tile_type => s_tile_type
    );
    
    inst_tile_LUT : sprite_tile_LUT
    generic map (
        tile_LUT => P_LUT_TILE_ACTOR_1
    )
    port map (
        i_tile_index => s_tile_index,
        i_tile_type => s_tile_type,
        o_color_code => s_color_code
    );
    
    
    inst_trsp : sprite_trsp
    port map(
        i_color_code => s_color_code,
        i_is_hidden => i_is_hidden,
        o_is_hidden => o_is_hidden
    );
    
    o_color_code <= s_color_code;
    
end Behavioral;
