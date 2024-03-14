----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: space_converter_absolute - Behavioral
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

entity space_converter_absolute is
Port (
    CameraPosX 			: in std_logic_vector (9 downto 0);
	CameraPosY 			: in std_logic_vector (9 downto 0);
	PixelPosX 			: in std_logic_vector (9 downto 0);
	PixelPosY	        : in std_logic_vector (9 downto 0);
	AbsolutePosX        : out std_logic_vector (9 downto 0);
	AbsolutePosY 		: out std_logic_vector (9 downto 0)

);
end space_converter_absolute;

architecture Behavioral of space_converter_absolute is
begin

process(CameraPosX, CameraPosY, PixelPosX, PixelPosY) is
begin
    AbsolutePosX <= std_logic_vector(unsigned(CameraPosX)+ unsigned(PixelPosX));
    AbsolutePosY <= std_logic_vector(unsigned(CameraPosY)+ unsigned(PixelPosY));
end process;
end Behavioral;
