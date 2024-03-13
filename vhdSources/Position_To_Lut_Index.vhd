----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2024 06:07:47 PM
-- Design Name: 
-- Module Name: Position_To_Lut_Index - Behavioral
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

entity Position_To_Lut_Index is
    Port ( RelativePosX : in STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY : in STD_LOGIC_VECTOR (9 downto 0);
           TileIndexX : out STD_LOGIC_VECTOR (5 downto 0);
           TileIndexY : out STD_LOGIC_VECTOR (5 downto 0);
           PaletteIndexX : out STD_LOGIC_VECTOR (3 downto 0);
           PaletteIndexY : out STD_LOGIC_VECTOR (3 downto 0);
           IsHidden : out STD_LOGIC);
end Position_To_Lut_Index;

architecture Behavioral of Position_To_Lut_Index is

component ActorVisibility is
    Port ( RelativePosX_i : in STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_i : in STD_LOGIC_VECTOR (9 downto 0);
           ActorSizeX : in STD_LOGIC_VECTOR (9 downto 0);
           ActorSizeY : in STD_LOGIC_VECTOR (9 downto 0);
           IsHidden : out STD_LOGIC);
end component ;

component Mux is
    Port ( RelativePosX_i : in STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_i : in STD_LOGIC_VECTOR (9 downto 0);
           IsHidden : in STD_LOGIC;
           RelativePosX_o : out STD_LOGIC_VECTOR (9 downto 0);
           RelativePosY_o : out STD_LOGIC_VECTOR (9 downto 0));
end component ;


signal isHidden_s : std_logic;
signal RelativePosX_s : std_logic_vector(9 downto 0); 
signal RelativePosY_s : std_logic_vector(9 downto 0);

begin
Port_Map_ActorVisibility : ActorVisibility
Port map(
    RelativePosX_i => RelativePosX,
    RelativePosY_i => RelativePosX,
    ActorSizeX => "000000000",
    ActorSizeY => "000000000",
    IsHidden => isHidden_s
);

Port_Map_Mux : Mux
Port map(
    RelativePosX_i => RelativePosX,
    RelativePosY_i => RelativePosX,
    IsHidden => isHidden_s,
    RelativePosX_o => RelativePosX_s,
    RelativePosY_o => RelativePosY_s
);

TileIndexX <= RelativePosX_s(9 downto 4);
TileIndexX <= RelativePosY_s(9 downto 4);
PaletteIndexX <= RelativePosX_s(3 downto 0);
PaletteIndexY <= RelativePosY_s(3 downto 0);
IsHidden <= isHidden_s;

end Behavioral;
