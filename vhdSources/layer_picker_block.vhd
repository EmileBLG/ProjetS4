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
 port (
        ColorCodeA : in std_logic_vector(3 downto 0);
        IsHiddenA : in std_logic_vector(0 downto 0);
        ColorCodeB : in std_logic_vector(3 downto 0);
        IsHiddenB : in std_logic_vector(0 downto 0);
        ColorCode : out std_logic_vector(3 downto 0);
        IsHidden : out std_logic_vector(0 downto 0)
    );
end layer_picker_block;

architecture Behavioral of layer_picker_block is


begin
process(ColorCodeA, ColorCodeB, IsHiddenA, IsHiddenB)
    begin
        if IsHiddenA = "1" or IsHiddenB = "1" then
            IsHidden <= "1";
        else
            IsHidden <= "0";
        end if;

        if IsHiddenA = "0" then
            ColorCode <= ColorCodeA;
        else
            ColorCode <= ColorCodeB;
        end if;
    end process;

end Behavioral;
