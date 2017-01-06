--declaration des librairies -
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


--declaration des ports  
ENTITY gen_trame IS
  GENERIC (
    no_balise : unsigned(1 DOWNTO 0); --:= "01";
    cpt_max : natural := 63
   );

  PORT (
    clk_mod : IN std_ulogic;
    clk_trame : IN std_ulogic; 
    valide : IN std_ulogic;
    occupe : INOUT std_logic;
    occupe_interne : out std_ulogic;

    trame : OUT std_ulogic
    );
	
END gen_trame ;



ARCHITECTURE generique OF gen_trame IS

  SIGNAL cpt : natural RANGE 0 TO cpt_max;
  SIGNAL trame_non_mod, trame_en_cours : std_ulogic;
  

BEGIN

compteur: PROCESS (clk_trame, valide, occupe, cpt, trame_en_cours)
BEGIN  -- PROCESS compteur
  IF valide = '1' AND trame_en_cours /= '1' AND occupe /= '1' THEN
    cpt <= 0;
  ELSIF  rising_edge(clk_trame)  THEN
    IF cpt = cpt_max THEN
      cpt <= 0;
    ELSE
      cpt <= cpt +1;
    END IF;
  END IF;




  
  IF cpt = cpt_max THEN
    trame_en_cours <= '0';
  ELSIF falling_edge(valide) THEN
    IF cpt = 0 AND occupe /= '1'  THEN
      trame_en_cours <= '1';
    END IF;
  END IF;

    
END PROCESS compteur;


occupe_interne <= trame_en_cours;


tram: PROCESS (cpt, trame_en_cours)
BEGIN  -- PROCESS trame

  trame_non_mod <= '0'; 
  occupe <= 'Z';
  
  IF trame_en_cours = '1' THEN

--     IF cpt = 0 THEN
--       trame_non_mod <= '1';                       -- bit de start
--       occupe <= '1';
--     ELSIF cpt = 1 THEN
--       trame_non_mod <= no_balise(1);              --MSB
--       occupe <= '1';
--     ELSIF cpt = 2 THEN
--       trame_non_mod <= no_balise(0);              --LSB
--       occupe <= '1';
--     ELSIF cpt = 3 THEN
--       occupe <= '1';
--     END IF;

              
    CASE cpt IS
      WHEN 0 =>  trame_non_mod <= '1';                       -- bit de start
      WHEN 1 =>  trame_non_mod <= no_balise(1);              --MSB
      WHEN 2 =>  trame_non_mod <= no_balise(0);              --LSB
      WHEN 3 =>  trame_non_mod <= '0';                       -- bit de stop
      WHEN OTHERS => occupe <= 'Z';
    END CASE;
    
    if cpt < 4 then
      occupe <= '1';
    end if;

  END IF;

END PROCESS tram;

trame <= trame_non_mod AND clk_mod;
  
END generique;
