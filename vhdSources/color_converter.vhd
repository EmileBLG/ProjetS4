----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 06:55:22 PM
-- Design Name: 
-- Module Name: color_converter - Behavioral
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

entity color_converter is
Port (  ColorCode : in  STD_LOGIC_VECTOR(3 downto 0);
         RGB       : out STD_LOGIC_VECTOR(23 downto 0)
);
end color_converter;

architecture Behavioral of color_converter is
begin
process(ColorCode)
    begin
        case ColorCode is
            when "0000" =>
                RGB <= "000000000000000000000000"; -- Noir
            when "0001" =>
                RGB <= "111111111111111111111111"; -- Blanc
            when "0010" =>
                RGB <= "111111000000000000000000"; -- Rouge
            when "0011" =>
                RGB <= "000000111111000000000000"; -- Vert
            when "0100" =>
                RGB <= "000000000000111111111111"; -- Bleu
            when "0101" =>
                RGB <= "111111110110011000000000"; -- orange
            when "0110" =>
                RGB <= "111111111111111100000000"; -- jaune
            when "0111" =>
                RGB <= "110011001001100111111111"; -- violet
            when "1000" =>
                RGB <= "100000001000000010000000"; -- gris
            when "1001" =>
                RGB <= "111111110000000011111111"; -- Rose
            when "1010" =>
                RGB <= "000000000000000000000000"; -- Noir
            when "1011" =>
                RGB <= "000000000000000000000000"; -- Noir
            when "1100" =>
                RGB <= "000000000000000000000000"; -- Noir
           when "1101" =>
                RGB <= "000000000000000000000000"; -- Noir
           when "1110" =>
                RGB <= "000000000000000000000000"; -- Noir
           when "1111" =>
                RGB <= "000000000000000000000000"; -- Noir 
            when others =>
                RGB <= "000000000000000000000000"; 
        end case;
   end process; 

end Behavioral;
