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
    i_act1_size_y     : in std_logic_vector (9 downto 0)
);
end PPU_top;

architecture Behavioral of PPU_top is
    
    component space_converter_absolute is
        Port ( 
            CameraPosX 			: in std_logic_vector (9 downto 0);
            CameraPosY 			: in std_logic_vector (9 downto 0);
            PixelPosX 			: in std_logic_vector (9 downto 0);
            PixelPosY	        : in std_logic_vector (9 downto 0);
            AbsolutePosX        : out std_logic_vector (9 downto 0);
            AbsolutePosY 		: out std_logic_vector (9 downto 0)
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
    
    
    signal s_absolute_pos_x : std_logic_vector(9 downto 0); 
    signal s_absolute_pos_y : std_logic_vector(9 downto 0);

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
    

end Behavioral;
