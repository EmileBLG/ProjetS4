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
    i_sprite_picker : in std_logic_vector (4 downto 0);
    o_color_code : out std_logic_vector (3 downto 0);
    o_is_hidden : out std_logic
);
end node_background;

architecture Behavioral of node_background is


begin
    
    
    o_is_hidden <= '0'; -- background cannot be hidden
    
end Behavioral;
