library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    generic( 
        N: natural := 8 
    );
    port(
        A, B: in std_logic_vector(N-1 downto 0);
        C: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture structural of alu is

    signal r_logical : std_logic_vector(N-1 downto 0);
    signal r_arithmetic : std_logic_vector(N-1 downto 0);
    signal mux_sel : std_logic;

begin

    andor : entity work.andor
        generic map (N => N)
        port map (A => A, B => B, operation => C(1), S => r_logical);
        
    addsub : entity work.addsub
        generic map (N => N)
        port map (A => A, B => B, operation => C(2), S => r_arithmetic);
        
    mux21 : entity work.multiplex2x1
        generic map (N => N)
        port map (input0 => r_logical, input1 => r_arithmetic, sel => C(0), output => S);

end architecture;