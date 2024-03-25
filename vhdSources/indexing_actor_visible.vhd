----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 06:07:47 PM
-- Design Name: 
-- Module Name: ActorVisibility - Behavioral
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

entity indexing_actor_visible is
Port ( 
    i_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
    i_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
    i_actor_size_x : in STD_LOGIC_VECTOR (9 downto 0);
    i_actor_size_y : in STD_LOGIC_VECTOR (9 downto 0);
    o_is_hidden : out STD_LOGIC
);
end indexing_actor_visible;

architecture Behavioral of indexing_actor_visible is
    
begin
    o_is_hidden <= '0' when ( (unsigned(i_pos_x) < unsigned(i_actor_size_x)) AND (unsigned(i_pos_y) < unsigned(i_actor_size_y)) ) 
                else '1';
    
end Behavioral;
