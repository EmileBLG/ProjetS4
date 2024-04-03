----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 06:07:47 PM
-- Design Name: 
-- Module Name: Position_To_Lut_Index - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity indexing_top is
    Port ( i_relative_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
           i_relative_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
           i_actor_size_x : in STD_LOGIC_VECTOR (9 downto 0);
           i_actor_size_y : in STD_LOGIC_VECTOR (9 downto 0);
           o_map_index_x : out STD_LOGIC_VECTOR (5 downto 0);
           o_map_index_y : out STD_LOGIC_VECTOR (5 downto 0);
           o_tile_index_x : out STD_LOGIC_VECTOR (3 downto 0);
           o_tile_index_y : out STD_LOGIC_VECTOR (3 downto 0);
           o_is_hidden : out STD_LOGIC);
end indexing_top;

architecture Behavioral of indexing_top is

    component indexing_actor_visible is
        Port ( 
            i_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
            i_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
            i_actor_size_x : in STD_LOGIC_VECTOR (9 downto 0);
            i_actor_size_y : in STD_LOGIC_VECTOR (9 downto 0);
            o_is_hidden : out STD_LOGIC
        );
    end component ;

    component indexing_mux_visible is
        Port ( 
            i_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
            i_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
            i_is_hidden : in STD_LOGIC;
            o_pos_x : out STD_LOGIC_VECTOR (9 downto 0);
            o_pos_y : out STD_LOGIC_VECTOR (9 downto 0)
        );
    end component ;
    
    
    signal s_is_hidden : std_logic;
    signal s_relative_pos_x : std_logic_vector(9 downto 0); 
    signal s_relative_pos_y : std_logic_vector(9 downto 0);
    
begin
    inst_indexing_actor_visible : indexing_actor_visible
    port map(
        i_pos_x => i_relative_pos_x,
        i_pos_y => i_relative_pos_y,
        i_actor_size_x => i_actor_size_x,
        i_actor_size_y => i_actor_size_y,
        o_is_hidden => s_is_hidden
    );
    
    inst_indexing_mux_visible : indexing_mux_visible
    port map(
        i_pos_x => i_relative_pos_x,
        i_pos_y => i_relative_pos_y,
        i_is_hidden => s_is_hidden,
        o_pos_x => s_relative_pos_x,
        o_pos_y => s_relative_pos_y
    );

    o_map_index_x <= s_relative_pos_x(9 downto 4);
    o_map_index_y <= s_relative_pos_y(9 downto 4);
    o_tile_index_x <= s_relative_pos_x(3 downto 0);
    o_tile_index_y <= s_relative_pos_y(3 downto 0);
    o_is_hidden <= s_is_hidden;
    
end Behavioral;
