----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: layer_picker_block - Behavioral
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

entity layer_picker_block is
Port ( 
    i_color_code_a : in std_logic_vector (3 downto 0); -- layer under 
    i_is_hidden_a : in std_logic;
    i_color_code_b : in std_logic_vector (3 downto 0); -- layer above -- takes priority
    i_is_hidden_b : in std_logic;
    o_color_code : out std_logic_vector (3 downto 0);
    o_is_hidden : out std_logic
);
end layer_picker_block;

architecture Behavioral of layer_picker_block is
    

begin
    
    o_color_code <= i_color_code_b when (i_is_hidden_b = '0') else i_color_code_a;
    
    o_is_hidden <= i_is_hidden_a AND i_is_hidden_b;

end Behavioral;
