--declaration des librairies -
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


--declaration des ports  
ENTITY timers IS
  GENERIC (

    max_cptr : natural := 15;
    taille_cptr : natural := 4
    );

  PORT (
    clk : IN std_ulogic; 

    ok : IN std_ulogic;         
    reception : IN std_ulogic;
   
    valide : OUT std_ulogic;            -- etat a prendre en compte : juste un
    non_valide : OUT std_logic          -- pulse sur valide apres detection
    );
	


END timers ;



ARCHITECTURE generique OF timers IS

SIGNAL cpt_erreur : natural RANGE 0 TO max_cptr;  --compteurs
SIGNAL cpt_ok : natural RANGE 0 TO max_cptr;



BEGIN


 -- timers --------------------------------------------------------------------

erreurcount: PROCESS
BEGIN  -- c est un compteur qui est charge a 16 a chaque erreur et qui fait
       -- timer pour inhiber la validite des signux apres une erreur: tant qu
       -- il n est pas a 0, rien n est valide.
  WAIT UNTIL rising_edge(clk);

  IF (reception AND NOT ok) = '1' THEN
    cpt_erreur <= max_cptr;                     -- chargement du compteur au max

    
  ELSIF cpt_erreur /= 0 THEN
    IF ok = '1' THEN                      -- si un ok se produit alors qu il y
                                          -- a eu une erreur avant, on
                                          -- considère que c est encore une erreur
      cpt_erreur <= max_cptr;             -- chargement du compteur au max
    ELSE
      cpt_erreur <= cpt_erreur - 1;       -- decrement si non nul
    END IF;
  END IF;
  
END PROCESS erreurcount;
 

okcount: PROCESS
BEGIN  -- compteur charge pendant un ok, puis decremente a chaque coup d
       -- horloge. quand il atteint 0, on a une impulsion a la sortie, sauf si
       -- il y  une erreur, (ou une persistance d erreur) il est mis a 0 sans impulsion
 WAIT UNTIL rising_edge(clk);

 valide <= '0';                         -- defaut
 
 IF cpt_erreur /= 0  OR (reception AND NOT ok) = '1' THEN
   cpt_ok <= 0;           -- devalidation
 ELSE
   
   IF ok = '1' THEN
     cpt_ok <= max_cptr;             -- chargement du compteur au max

   ELSIF cpt_ok /= to_unsigned(0,taille_cptr) THEN
       cpt_ok <= cpt_ok - 1;         -- decrement si non nul

       IF cpt_ok = 1 THEN             -- pulse sur valide     
         valide <= '1';               -- sortie uniquement a ce moment la
       END IF;
   END IF;
   
 END IF;
END PROCESS okcount;


indic_sort: PROCESS(cpt_erreur)
BEGIN  -- PROCESS indic_sort : juste un moniteur pour les erreurs
  IF cpt_erreur = 0 THEN
    non_valide <= '0';
  ELSE
    non_valide <= '1';
  END IF;
END PROCESS indic_sort;
  

END generique;
