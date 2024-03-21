library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity space_converter_relative is
Port (
    ObjectPosX 			: in std_logic_vector (9 downto 0);
	ObjectPosY 			: in std_logic_vector (9 downto 0);
	AbsolutePosX        : in std_logic_vector (9 downto 0);
	AbsolutePosY 		: in std_logic_vector (9 downto 0);
	RelativePosX 		: out std_logic_vector (9 downto 0);
	RelativePosY	    : out std_logic_vector (9 downto 0)

);
end space_converter_relative;

architecture Behavioral of space_converter_relative is
signal signv : std_logic_vector(9 downto 0);
begin
process(ObjectPosX, ObjectPosY, AbsolutePosX, AbsolutePosY) is
begin
    RelativePosX <= std_logic_vector(
                    (unsigned(
                            signed(
                                unsigned(AbsolutePosX) - unsigned(ObjectPosX)
                                )
                                +1023
                                )
                                mod 1023)+1
                       )
                       ;-- on veut faire (absolu - objet) mod 1024

    RelativePosY <= std_logic_vector(
                    (unsigned(
                            signed(
                                unsigned(AbsolutePosY) - unsigned(ObjectPosY)
                                )
                                +1023
                                )
                                mod 1023)+1
                       )
                       ;
end process;
end Behavioral;
