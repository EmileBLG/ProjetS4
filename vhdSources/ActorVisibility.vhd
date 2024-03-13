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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ActorVisibility is
    Port ( RelativePosX_i : in STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_i : in STD_LOGIC_VECTOR (9 downto 0);
           ActorSizeX : in STD_LOGIC_VECTOR (9 downto 0);
           ActorSizeY : in STD_LOGIC_VECTOR (9 downto 0);
           IsHidden : out STD_LOGIC);
end ActorVisibility;

architecture Behavioral of ActorVisibility is

begin

IsHidden <= '0';
process(RelativePosX_i,RelativePosY_i,ActorSizeX, ActorSizeY)
begin 
    if (RelativePosX_i > ActorSizeX or RelativePosY_i > ActorSizeY) then
        IsHidden <= '1';
    end if;
end process;
end Behavioral;
