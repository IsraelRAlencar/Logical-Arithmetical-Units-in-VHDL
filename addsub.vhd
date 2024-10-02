library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
    generic (
        N: natural := 8
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of addsub is
    signal tempA: unsigned(N-1 downto 0);
    signal tempB: unsigned(N-1 downto 0);
begin
    tempA <= unsigned(A);
    tempB <= unsigned(B);

    S <= std_logic_vector(tempA + tempB) when operation = '0' else std_logic_vector(tempA - tempB);

end architecture;