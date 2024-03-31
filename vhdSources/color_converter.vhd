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
--use IEEE.NUMERIC_STD.ALL;

entity color_converter is
<<<<<<< Updated upstream
Port (  ColorCode : in  STD_LOGIC_VECTOR(3 downto 0);
         RGB       : out STD_LOGIC_VECTOR(23 downto 0)
);
=======
    Port (
        ColorCode : in  STD_LOGIC_VECTOR(3 downto 0);
        GBR       : out STD_LOGIC_VECTOR(23 downto 0)
    );
>>>>>>> Stashed changes
end color_converter;

architecture Behavioral of color_converter is
begin
<<<<<<< Updated upstream
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
=======
    process(ColorCode)
    begin
        case ColorCode is
            when "0000" =>
                GBR <= x"000000"; -- Noir
            when "0001" =>
                GBR <= x"0000FF"; -- Blanc
            when "0010" =>
                GBR <= x"FF0000"; -- Rouge
            when "0011" =>
                GBR <= x"00FF00"; -- Vert
            when "0100" =>
                GBR <= x"0000FF"; -- Bleu
            when "0101" =>
                GBR <= x"FFA500"; -- Orange
            when "0110" =>
                GBR <= x"FFFF00"; -- Jaune
            when "0111" =>
                GBR <= x"800080"; -- Violet
            when "1000" =>
                GBR <= x"808080"; -- Gris
            when "1001" =>
                GBR <= x"FFC0CB"; -- Rose
            when "1010" =>
                GBR <= x"000000"; -- Noir
            when "1011" =>
                GBR <= x"000000"; -- Noir
            when "1100" =>
                GBR <= x"000000"; -- Noir
            when "1101" =>
                GBR <= x"000000"; -- Noir
            when "1110" =>
                GBR <= x"000000"; -- Noir
            when "1111" =>
                GBR <= x"000000"; -- Noir
            when others =>
                GBR <= x"000000"; -- Noir par d�faut
        end case;
    end process; 
>>>>>>> Stashed changes

end Behavioral;



