--declaration des librairies -
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


--declaration des ports  
ENTITY filtre IS
  GENERIC (
    nb_entrees : natural := 18
    );

  PORT (
 --   clk : IN std_ulogic; 
    entrees : IN unsigned( nb_entrees DOWNTO 1);

    ok : OUT std_ulogic;         
    reception : OUT std_ulogic
   
    );
	


END filtre ;



ARCHITECTURE generique OF filtre IS

BEGIN
  
  -- equations de resolution --------------------------------------------------

  -- si une entree est activee et que les autres eloignees de 1 entree sont
  -- desactivees,alors c est ok
  -- (les entrees a cote de celle en question sont ignorees)

--Macrocells     Product Terms    Registers      Pins           Function Block 
--Used           Used             Used           Used           Inputs Used    
--2  /36  (  5%) 19  /180  ( 10%) 0  /36  (  0%) 20 /34  ( 58%) 36 /108 ( 33%)
  

equations: PROCESS (entrees)

VARIABLE e: unsigned(18 DOWNTO 0);  -- 18 max
                                   
VARIABLE tiers : unsigned(2 DOWNTO 0);  -- reception dans 1 tiers de zone (necessaire ?)
VARIABLE ok_partiel : unsigned(2 DOWNTO 0);  -- 3 ok pour chacune des zones


BEGIN  -- PROCESS equations
  

  e := (OTHERS => '0');
  e(nb_entrees DOWNTO 1) :=  entrees(nb_entrees DOWNTO 1);


  tiers(0) := e( 1) OR e( 2) OR e( 3) OR e( 4) OR e( 5) OR e( 6);
  tiers(1) := e( 7) OR e( 8) OR e( 9) OR e(10) OR e(11) OR e(12);
  tiers(2) := e(13) OR e(14) OR e(15) OR e(16) OR e(17) OR e(18);


  ok_partiel(0) := ( e( 1) AND NOT e( 3) AND NOT e( 4) AND NOT e( 5) AND NOT e( 6) AND NOT tiers(1) AND NOT tiers(2) )
                OR ( e( 2) AND NOT e( 4) AND NOT e( 5) AND NOT e( 6) AND NOT tiers(1) AND NOT tiers(2) )
                OR ( e( 3) AND NOT e( 1) AND NOT e( 5) AND NOT e( 6) AND NOT tiers(1) AND NOT tiers(2) )
                OR ( e( 4) AND NOT e( 1) AND NOT e( 2) AND NOT e( 6) AND NOT tiers(1) AND NOT tiers(2) )
                OR ( e( 5) AND NOT e( 1) AND NOT e( 2) AND NOT e( 3) AND NOT tiers(1) AND NOT tiers(2) )
                OR ( e( 6) AND NOT e( 1) AND NOT e( 2) AND NOT e( 3) AND NOT e( 4) AND NOT e( 8) AND NOT e( 9) AND NOT e( 10) AND NOT e( 11) AND NOT e( 12) AND NOT tiers(2) );

  ok_partiel(1) := ( e( 7) AND NOT e( 1) AND NOT e( 2) AND NOT e( 3) AND NOT e( 4) AND NOT e( 5) AND NOT e( 9) AND NOT e( 10) AND NOT e( 11) AND NOT e( 12) AND NOT tiers(2) )
                OR ( e( 8) AND NOT e(10) AND NOT e(11) AND NOT e(12) AND NOT tiers(0) AND NOT tiers(2) )
                OR ( e( 9) AND NOT e( 7) AND NOT e(11) AND NOT e(12) AND NOT tiers(0) AND NOT tiers(2) )
                OR ( e(10) AND NOT e( 7) AND NOT e( 8) AND NOT e(12) AND NOT tiers(0) AND NOT tiers(2) )
                OR ( e(11) AND NOT e( 7) AND NOT e( 8) AND NOT e( 9) AND NOT tiers(0) AND NOT tiers(2) )
                OR ( e(12) AND NOT e( 7) AND NOT e( 8) AND NOT e( 9) AND NOT e(10) AND NOT e(14) AND NOT e(15) AND NOT e( 16) AND NOT e( 17) AND NOT e( 18) AND NOT tiers(0) );

  ok_partiel(2) := ( e(13) AND NOT e( 7) AND NOT e( 8) AND NOT e( 9) AND NOT e(10) AND NOT e(11) AND NOT e(15) AND NOT e( 16) AND NOT e( 17) AND NOT e( 18) AND NOT tiers(0) )
                OR ( e(14) AND NOT e(16) AND NOT e(17) AND NOT e(18) AND NOT tiers(0) AND NOT tiers(1) )
                OR ( e(15) AND NOT e(13) AND NOT e(17) AND NOT e(18) AND NOT tiers(0) AND NOT tiers(1) )
                OR ( e(16) AND NOT e(13) AND NOT e(14) AND NOT e(18) AND NOT tiers(0) AND NOT tiers(1) )
                OR ( e(17) AND NOT e(13) AND NOT e(14) AND NOT e(15) AND NOT tiers(0) AND NOT tiers(1) )
                OR ( e(18) AND NOT e(13) AND NOT e(14) AND NOT e(15) AND NOT e(16) AND NOT tiers(1) AND NOT tiers(0) );


  ok <= ok_partiel(0) OR ok_partiel(1) OR ok_partiel(2);

  reception <=  tiers(0) OR tiers(1) OR tiers(2) ;


END PROCESS equations;  



END generique;
