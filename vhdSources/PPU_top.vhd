----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: PPU_top - Behavioral
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

entity PPU_top is
Port ( 
    i_pixel_pos_x     : in std_logic_vector (9 downto 0); -- pixel position on the display
    i_pixel_pos_y     : in std_logic_vector (9 downto 0); -- pixel position on the display
    i_cam_x           : in std_logic_vector (9 downto 0); -- camera position on the background
    i_cam_y           : in std_logic_vector (9 downto 0); -- camera position on the background
    i_act1_pos_x      : in std_logic_vector (9 downto 0); -- actor 1 position on the background
    i_act1_pos_y      : in std_logic_vector (9 downto 0);
    i_act1_size_x     : in std_logic_vector (9 downto 0); -- actor 1 size in pixel
    i_act1_size_y     : in std_logic_vector (9 downto 0);
    o_rgb             : out std_logic_vector (23 downto 0)
);
end PPU_top;

architecture Behavioral of PPU_top is
    
    component space_converter_absolute is
        Port ( 
            CameraPosX 		 : in std_logic_vector (9 downto 0);
            CameraPosY 		 : in std_logic_vector (9 downto 0);
            PixelPosX 		 : in std_logic_vector (9 downto 0);
            PixelPosY	     : in std_logic_vector (9 downto 0);
            AbsolutePosX     : out std_logic_vector (9 downto 0);
            AbsolutePosY     : out std_logic_vector (9 downto 0)
        );
    end component ;
    
    component node_background is
        Port (
            i_absolute_pos_x : in std_logic_vector (9 downto 0);
            i_absolute_pos_y : in std_logic_vector (9 downto 0);
            i_sprite_picker  : in std_logic_vector (4 downto 0);
            o_color_code     : out std_logic_vector (3 downto 0);
            o_is_hidden      : out std_logic
        );
    end component ;
    
    component node_actor is
        Port ( 
            i_object_pos_x   : in std_logic_vector (9 downto 0);
            i_object_pos_y   : in std_logic_vector (9 downto 0);
            i_absolute_pos_x : in std_logic_vector (9 downto 0);
            i_absolute_pos_y : in std_logic_vector (9 downto 0);
            i_actor_size_x   : in std_logic_vector (9 downto 0);
            i_actor_size_y   : in std_logic_vector (9 downto 0);
            i_sprite_picker  : in std_logic_vector (4 downto 0);
            o_color_code     : out std_logic_vector (3 downto 0);
            o_is_hidden      : out std_logic
        
        );
    end component ;
    
    component layer_picker_block is
        Port ( 
            i_color_code_a   : in std_logic_vector (3 downto 0); -- layer under 
            i_is_hidden_a    : in std_logic;
            i_color_code_b   : in std_logic_vector (3 downto 0); -- layer above -- takes priority
            i_is_hidden_b    : in std_logic;
            o_color_code     : out std_logic_vector (3 downto 0);
            o_is_hidden      : out std_logic
        );
    end component ;
    
    component color_converter is 
        Port (
            i_color_code     : in std_logic_vector (3 downto 0);
            o_RGB            : out std_logic_vector (23 downto 0)
        );
    end component;
    
    signal s_absolute_pos_x : std_logic_vector(9 downto 0); 
    signal s_absolute_pos_y : std_logic_vector(9 downto 0);
    
    signal s_color_a0 : std_logic_vector (3 downto 0); -- round a, layer 0 (background)
    signal s_is_hidden_a0 : std_logic;

    signal s_color_a1 : std_logic_vector (3 downto 0); -- round a, layer 1 (actor 1)
    signal s_is_hidden_a1 : std_logic;

    signal s_color_b0 : std_logic_vector (3 downto 0); -- round b, layer 0
    signal s_is_hidden_b0 : std_logic;

begin
    
    
    inst_space_converter : space_converter_absolute
    port map(
        CameraPosX 	 => i_cam_x,
        CameraPosY 	 => i_cam_y,
        PixelPosX    => i_pixel_pos_x,
        PixelPosY    => i_pixel_pos_y,
        AbsolutePosX => s_absolute_pos_x,
        AbsolutePosY => s_absolute_pos_y
    );
    
    inst_background : node_background
    Port map ( 
        i_absolute_pos_x => s_absolute_pos_x,
        i_absolute_pos_y => s_absolute_pos_y,
        i_sprite_picker  => "00000",
        o_color_code     => s_color_a0,
        o_is_hidden      => s_is_hidden_a0
    );
    
    inst_actor_1 : node_actor
    Port map ( 
        i_object_pos_x   => i_act1_pos_x,
        i_object_pos_y   => i_act1_pos_y,
        i_absolute_pos_x => s_absolute_pos_x,
        i_absolute_pos_y => s_absolute_pos_y,
        i_actor_size_x   => i_act1_size_x,
        i_actor_size_y   => i_act1_size_y,
        i_sprite_picker  => "00000",
        o_color_code     => s_color_a1,
        o_is_hidden      => s_is_hidden_a1
    );
    
    
    inst_layer_a01 : layer_picker_block
    Port map ( 
        i_color_code_a   => s_color_a0,
        i_is_hidden_a    => s_is_hidden_a0,
        i_color_code_b   => s_color_a1,
        i_is_hidden_b    => s_is_hidden_a1,
        o_color_code     => s_color_b0,
        o_is_hidden      => s_is_hidden_b0
    );
    
    inst_color_converter : color_converter
    port map (
        i_color_code     => s_color_b0,
        o_RGB            => o_rgb
    );
    

end Behavioral;
