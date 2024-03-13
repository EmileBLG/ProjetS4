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

entity Mux is
    Port ( RelativePosX_i : in STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_i : in STD_LOGIC_VECTOR (9 downto 0);
           IsHidden : in STD_LOGIC;
           RelativePosX_o : out STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_o : out STD_LOGIC_VECTOR (9 downto 0));
end Mux;

architecture Behavioral of Mux is

begin
process(RelativePosY_i, RelativePosX_i, IsHidden)
begin 
    if isHidden = '1' then
        RelativePosX_o <= "000000000" ; 
        RelativePosY_o <= "000000000" ;
    elsif isHidden = '0' then
        RelativePosX_o <= RelativePosX_i ; 
        RelativePosY_o <= RelativePosY_i ;
    end if;
end process;
end Behavioral;
