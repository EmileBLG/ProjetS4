----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 06:07:47 PM
-- Design Name: 
-- Module Name: Mux - Behavioral
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

entity indexing_mux_visible is
Port ( 
    i_pos_x : in STD_LOGIC_VECTOR (9 downto 0);
    i_pos_y : in STD_LOGIC_VECTOR (9 downto 0);
    i_is_hidden : in STD_LOGIC;
    o_pos_x : out STD_LOGIC_VECTOR (9 downto 0);
    o_pos_y : out STD_LOGIC_VECTOR (9 downto 0)
);
end indexing_mux_visible;

architecture Behavioral of indexing_mux_visible is

begin
    o_pos_x <= "0000000000" when (i_is_hidden = '1') else i_pos_x;
    o_pos_y <= "0000000000" when (i_is_hidden = '1') else i_pos_y;
    
end Behavioral;
