--declaration des librairies -
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


--declaration des ports  
ENTITY horloges IS
  GENERIC (
--    div_timer : natural;
    div_mod : natural := 10;
    div_trame : natural := 10
   );

  PORT (
    clk : IN std_ulogic;

    valide : IN std_ulogic;

    clk_timer, clk_mod, clk_trame : OUT std_ulogic
    );
	
END horloges ;


ARCHITECTURE generique OF horloges IS

  SIGNAL clk_timer_b, clk_trame_b, clk_mod_b : std_ulogic;
-- SIGNAL cpt_timer : natural RANGE 0 TO div_timer -1;
  SIGNAL cpt_mod : natural RANGE 0 TO div_mod -1;
  SIGNAL cpt_trame : natural RANGE 0 TO div_trame -1;


BEGIN

  -- horloge pour les filtres
--   PROCESS (clk)
--   BEGIN  -- PROCESS
--     IF rising_edge(clk) THEN
--       IF cpt_timer = div_timer - 1 THEN  -- necessaire a la simulation
--         cpt_timer <= 0;
--       ELSE
--         cpt_timer <= cpt_timer + 1 ;
--       END IF;
--     END IF;
--   END PROCESS;

--   PROCESS (cpt_timer, clk)
--     BEGIN
--    IF cpt_timer = 0 THEN
--      clk_timer_b <= '1';
--    ELSE
--      clk_timer_b <= '0';
--    END IF;
--  END PROCESS;
  clk_timer_b <= clk; -- desactivation du 1er diviseur
  clk_timer <= clk_timer_b;


  
  -- horloge pour la modulation
  PROCESS (clk_timer_b, valide)
  BEGIN  -- PROCESS
    IF falling_edge(clk_timer_b) THEN
      IF valide = '1' THEN                    -- pour bien commencer une trame
        cpt_mod <= 0;
      ELSIF cpt_mod = div_mod - 1 THEN  -- necessaire a la simulation
        cpt_mod <= 0;
      ELSE
        cpt_mod <= cpt_mod + 1 ;
      END IF;      
    END IF;
  END PROCESS;
  PROCESS (cpt_mod)
  BEGIN
    IF cpt_mod < (div_mod / 2) THEN -- rapport cyc de 50%
      clk_mod_b <= '1';
    ELSE
      clk_mod_b <= '0';
    END IF;
  END PROCESS; 

  clk_mod <= clk_mod_b;
  
    -- horloge de la trame, remise a 0  pour le debut trame
  PROCESS (clk_mod_b, valide)
  BEGIN  -- PROCESS
    IF valide = '1' THEN                    -- pour bien commencer une trame
     cpt_trame <= 0;
    ELSIF rising_edge(clk_mod_b) THEN
      IF cpt_trame = div_trame - 1 THEN  -- necessaire a la simulation
        cpt_trame <= 0;
      ELSE
        cpt_trame <= cpt_trame + 1 ;
      END IF;
    END IF;
  END PROCESS;

  PROCESS (cpt_trame)
  BEGIN
    IF cpt_trame = 0 THEN  
      clk_trame_b <= '1';
    ELSE
      clk_trame_b <= '0';
    END IF;
  END PROCESS;

  clk_trame <= clk_trame_b;
  


  
  
END generique;
