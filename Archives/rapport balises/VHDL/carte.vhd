--declaration des librairies -
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


entity carte is
    GENERIC (
        nb_entrees : natural := 18
        );
    Port (
    entrees : IN unsigned( nb_entrees DOWNTO 1);

    clk_in : IN std_ulogic;
    
    test : OUT unsigned(3 DOWNTO 0);

    led : OUT unsigned (2 DOWNTO 0);

    occupe : INOUT std_logic;

    emission_ext : INOUT std_logic;
    
    emission_fort, emission_faible : OUT std_ulogic;

    quartz1 : IN std_ulogic;
    quartz2 : OUT std_ulogic

    
    );

    ATTRIBUTE pin_assign : string;
    --                                           18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1
    ATTRIBUTE pin_assign OF entrees : SIGNAL IS "18 20 24 22 25 26 27 28 33 34 35 36 37 38 39 40 43 42";
    ATTRIBUTE pin_assign OF occupe : SIGNAL IS "3";
    ATTRIBUTE pin_assign OF test : SIGNAL IS "7 9 11 13";
    ATTRIBUTE pin_assign OF led : SIGNAL IS "4 5 2";
    ATTRIBUTE pin_assign OF clk_in : SIGNAL IS "1";
    ATTRIBUTE pin_assign OF quartz1 : SIGNAL IS "8";
    ATTRIBUTE pin_assign OF quartz2 : SIGNAL IS "6";

    ATTRIBUTE pin_assign OF emission_ext : SIGNAL IS "44";

    ATTRIBUTE pin_assign OF emission_faible : SIGNAL IS "19";
    ATTRIBUTE pin_assign OF emission_fort : SIGNAL IS "29";

end carte;



architecture Behavioral of carte is

SIGNAL ok, reception, valide, non_valide, trame, clk, trame_latch : std_ulogic;

SIGNAL clk_timer, clk_trame, clk_mod, valide_pas_occupe, occupe_lu, occupe_interne: std_ulogic;

signal not_entrees : unsigned( nb_entrees DOWNTO 1);

COMPONENT filtre
  GENERIC (
        nb_entrees : natural := nb_entrees
        );
  PORT (
    entrees : IN unsigned( nb_entrees DOWNTO 1);

    ok : OUT std_ulogic;         
    reception : OUT std_ulogic
    ); 
END COMPONENT;


COMPONENT timers IS
  GENERIC (

    max_cptr : natural := 7;            -- 15
    taille_cptr : natural := 3          -- 4
    );

  PORT (
    clk : IN std_ulogic; 

    ok : IN std_ulogic;         
    reception : IN std_ulogic;
   
    valide : OUT std_ulogic;            -- etat a prendre en compte : juste un
    non_valide : OUT std_logic          -- pulse sur valide apres detection
    );
END COMPONENT;


COMPONENT gen_trame IS
  GENERIC (
    no_balise : unsigned(1 DOWNTO 0) := "11";
    cpt_max : natural :=  63
    );                
  PORT (
    clk_mod : IN std_ulogic;
    clk_trame : IN std_ulogic; 
    valide : IN std_ulogic;
    occupe : INOUT std_logic;
    occupe_interne : OUT std_ulogic;
    
    trame : OUT std_ulogic
    );
	
END COMPONENT;


COMPONENT horloges IS
  GENERIC (
--   div_timer : natural := 3;          -- non utilise, clk d entree = 300kHz
    div_mod : natural := 10;            -- 300 /10 =>> 30kHz
    div_trame : natural := 10           -- 30kHz / 10 >> 3kHz
   );

  PORT (
    clk : IN std_ulogic; 

    valide : IN std_ulogic;
       
    clk_timer, clk_mod, clk_trame : OUT std_ulogic
    );
	
END COMPONENT;


begin

  fil : filtre
    PORT MAP (
      entrees   =>  not_entrees,
      ok        => ok,
      reception => reception
      );


  tim : timers
    PORT MAP (
      clk        => clk_timer,
      ok         => ok,
      reception  => reception,
      valide     => valide,
      non_valide => non_valide
      );

  tr : gen_trame
    PORT MAP (
      clk_mod   => clk_mod,
      clk_trame    => clk_trame,
      valide => valide,
      occupe => occupe,
      occupe_interne => occupe_interne,
      trame  => trame
      );

  h : horloges
    PORT MAP (
      clk       => clk,
      clk_timer => clk_timer,
      clk_trame => clk_trame,
      valide => valide_pas_occupe,
      clk_mod   => clk_mod
      );


  not_entrees <= NOT entrees;

  quartz2 <= NOT clk_in;  
	clk <= NOT quartz1;


p: PROCESS(occupe)
BEGIN  -- PROCESS p
    CASE occupe IS
    WHEN 'Z' => occupe_lu <= '0';
    WHEN '0' => occupe_lu <= '0';
    WHEN '1' => occupe_lu <= '1';
    WHEN OTHERS => NULL;
  END CASE;
END PROCESS p;

  
  valide_pas_occupe <= valide AND NOT occupe_lu;

  test(0) <= reception;
  test(1) <= valide;
  test(2) <= clk_mod;
  test(3) <= trame;

  led(1) <= occupe_interne;                      -- alim + coupures lors de l emission
  led(2) <= NOT non_valide;
  led(0) <= NOT occupe_interne;



 emission_fort <= '0';

emission: PROCESS (emission_ext, trame,clk, occupe_interne, trame_latch)
BEGIN  -- PROCESS emission


  if rising_edge(clk) then
    emission_ext <= 'Z';
    if trame_latch = '1' then
          emission_ext <= '1';
    end if;
  end if;

  
      trame_latch <= trame;

  if falling_edge(clk) THEN

    emission_faible <= emission_ext;



  
  

  
--   IF occupe_interne = '1' THEN

--     emission_faible <= trame_latch;
--     IF trame_latch = '1' THEN
--       emission_ext <= '1';     
--     END IF;

--   ELSE
--     emission_faible <= emission_ext;
--   END IF;
    
  END IF;  

END PROCESS emission;

  
end Behavioral;
