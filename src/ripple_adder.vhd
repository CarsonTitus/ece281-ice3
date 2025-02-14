----------------------------------------------------------------------------------

-- Implements a 4-bit Ripple-Carry adder from instantiated Full Adders
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port ( A : in std_logic_vector  (3 downto 0);
           B : in std_logic_vector  (3 downto 0);
           Cin : in std_logic;
           S : out std_logic_vector (3 downto 0);
           Cout : out std_logic);
end ripple_adder;

architecture Behavioral of ripple_adder is
    component full_adder is
        port (
            A     : in std_logic;
            B     : in std_logic;
            Cin   : in std_logic;
            S     : out std_logic;
            Cout  : out std_logic
            );
        end component full_adder;
    -- Declare signals here
    signal w_carry  : std_logic_vector (3 downto 1); -- for ripple between adders

begin
    full_adder_0: full_adder
    port map(
        A     => A(0),
        B     => B(0),
        Cin   => Cin,   -- Directly to input here
        S     => S(0),
        Cout  => w_carry(1)
        );

    full_adder_1: full_adder
    port map(
        A     => A(1),
        B     => B(1),
        Cin   => w_carry(1),
        S     => S(1),
        Cout  => w_carry(2)
        );
    full_adder_2: full_adder
    port map(
        A     => A(2),
        B     => B(2),
        Cin   => w_carry(2),   
        S     => S(2),
        Cout  => w_carry(3)
        );

    full_adder_3: full_adder
    port map(
        A     => A(3),
        B     => B(3),
        Cin   => w_carry(3),
        S     => S(3),
        Cout  => Cout
        );

end Behavioral;
