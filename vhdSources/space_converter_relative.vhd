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
    --RelativePosX <= std_logic_vector(unsigned(unsigned(AbsolutePosX) - unsigned(ObjectPosX)) mod unsigned(AbsolutePosX))
    --RelativePosX <= std_logic_vector(unsigned(unsigned(AbsolutePosX) - unsigned(ObjectPosX)));
    --RelativePosX <= std_logic_vector(unsigned(AbsolutePosX) - unsigned(ObjectPosX));
    --RelativePosX <= std_logic_vector((unsigned(ObjectPosX)) mod unsigned(AbsolutePosX));
    --RelativePosX <= std_logic_vector(
      --              unsigned(
        --                std_logic_vector(
          --                  --unsigned(
            --                    unsigned(AbsolutePosX) - unsigned(ObjectPosX)
              --                  --)
                --                )
                  --              )
                    --   mod unsigned (AbsolutePosX)
                      -- )
                       --;-- on veut faire (absolu - objet) mod objet
        --RelativePosX <= std_logic_vector(unsigned(- signed(ObjectPosX)) mod unsigned(AbsolutePosX));
    RelativePosX <= std_logic_vector(abs(signed(AbsolutePosX) - signed(ObjectPosX)));
    RelativePosY <= std_logic_vector(abs(signed(AbsolutePosY) - signed(ObjectPosY)));
end process;
end Behavioral;
