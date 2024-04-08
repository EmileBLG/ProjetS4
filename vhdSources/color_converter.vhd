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
Port (  i_color_code : in  STD_LOGIC_VECTOR(3 downto 0);
         o_RGB       : out STD_LOGIC_VECTOR(23 downto 0)
);
end color_converter;

architecture Behavioral of color_converter is
begin
process(i_color_code)
    begin
        case i_color_code is
            when "0000" =>
                o_RGB <= X"000000"; -- 
            when "0001" =>
                o_RGB <= X"000000"; -- 
            when "0010" =>
                o_RGB <= X"7E7E7E"; -- 
            when "0011" =>
                o_RGB <= X"BDBDBD"; -- 
            when "0100" =>
                o_RGB <= X"F8E104"; -- 
            when "0101" =>
                o_RGB <= X"F8B904"; -- 
            when "0110" =>
                o_RGB <= X"F89806"; -- 
            when "0111" =>
                o_RGB <= X"000000"; -- 
            when "1000" =>
                o_RGB <= X"08B923"; -- 
            when "1001" =>
                o_RGB <= X"2E8A02"; -- 
            when "1010" =>
                o_RGB <= X"275F00"; -- 
            when "1011" =>
                o_RGB <= X"664F2F"; -- 
            when "1100" =>
                o_RGB <= X"A2F0FD"; -- 
            when "1101" =>
                o_RGB <= X"72E1FF"; -- 
            when "1110" =>
                o_RGB <= X"72E1FF"; -- 
            when "1111" =>
                o_RGB <= X"FFFFFF"; -- 
            when others =>
                o_RGB <= X"000000"; 
        end case;
   end process; 
end Behavioral;
