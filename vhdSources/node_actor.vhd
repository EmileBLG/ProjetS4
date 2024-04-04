----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: node_actor - Behavioral
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

entity node_actor is
Port ( 
    i_object_pos_x : in std_logic_vector (9 downto 0);
    i_object_pos_y : in std_logic_vector (9 downto 0);
    i_absolute_pos_x : in std_logic_vector (9 downto 0);
    i_absolute_pos_y : in std_logic_vector (9 downto 0);
    i_actor_size_x : in std_logic_vector (9 downto 0);
    i_actor_size_y : in std_logic_vector (9 downto 0);
    i_sprite_picker : in std_logic_vector (4 downto 0);
    o_color_code : out std_logic_vector (3 downto 0);
    o_is_hidden : out std_logic

);
end node_actor;

architecture Behavioral of node_actor is

    component space_converter_relative is
        Port (
            ObjectPosX 		 : in std_logic_vector (9 downto 0);
            ObjectPosY 		 : in std_logic_vector (9 downto 0);
            AbsolutePosX     : in std_logic_vector (9 downto 0);
            AbsolutePosY     : in std_logic_vector (9 downto 0);
            RelativePosX 	 : out std_logic_vector (9 downto 0);
            RelativePosY	 : out std_logic_vector (9 downto 0)
        
        );
    end component ;
    
    component indexing_top is
        Port ( 
            i_relative_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
            i_relative_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
            i_actor_size_x   : in STD_LOGIC_VECTOR (9 downto 0);
            i_actor_size_y   : in STD_LOGIC_VECTOR (9 downto 0);
            o_map_index_x    : out STD_LOGIC_VECTOR (5 downto 0);
            o_map_index_y    : out STD_LOGIC_VECTOR (5 downto 0);
            o_tile_index_x   : out STD_LOGIC_VECTOR (3 downto 0);
            o_tile_index_y   : out STD_LOGIC_VECTOR (3 downto 0);
            o_is_hidden      : out STD_LOGIC
        );
    end component ;
    
    component sprite_top_actor is
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
    
    
    signal s_relative_pos_x : std_logic_vector(9 downto 0); 
    signal s_relative_pos_y : std_logic_vector(9 downto 0);
    
    signal s_map_index_x : std_logic_vector(5 downto 0); 
    signal s_map_index_y : std_logic_vector(5 downto 0);
    
    signal s_tile_index_x : std_logic_vector(3 downto 0); 
    signal s_tile_index_y : std_logic_vector(3 downto 0);
    
    signal s_is_hidden : std_logic;
    

begin
    
    inst_space_converter : space_converter_relative
    port map(
        ObjectPosX 	 => i_object_pos_x,
        ObjectPosY 	 => i_object_pos_y,
        AbsolutePosX => i_absolute_pos_x,
        AbsolutePosY => i_absolute_pos_y,
        RelativePosX => s_relative_pos_x,
        RelativePosY => s_relative_pos_y
    );
    
    inst_indexing : indexing_top
    port map(
        i_relative_pos_x => s_relative_pos_x,
        i_relative_pos_y => s_relative_pos_y,
        i_actor_size_x   => i_actor_size_x,
        i_actor_size_y   => i_actor_size_y,
        o_map_index_x    => s_map_index_x,
        o_map_index_y    => s_map_index_y,
        o_tile_index_x   => s_tile_index_x,
        o_tile_index_y   => s_tile_index_y,
        o_is_hidden      => s_is_hidden
    );
    
    inst_sprite_actor : sprite_top_actor
    port map ( 
        i_map_index_x   => s_map_index_x,
        i_map_index_y   => s_map_index_y,
        i_tile_index_x  => s_tile_index_x,
        i_tile_index_y  => s_tile_index_y,
        i_sprite_picker => i_sprite_picker,
        i_is_hidden     => s_is_hidden,
        o_color_code    => o_color_code,
        o_is_hidden     => o_is_hidden
    );
    
end Behavioral;
