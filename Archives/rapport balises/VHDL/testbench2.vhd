
-- VHDL Test Bench Created from source file carte.vhd -- 20:38:04 04/08/2003
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT carte
	PORT(
		entrees : IN unsigned(18 downto 1);
		clk : IN std_ulogic;
		quartz1 : IN std_ulogic;    
		occupe : INOUT std_logic;      
		test : OUT unsigned(3 downto 0);
		led : OUT unsigned(2 downto 0);
		emission_fort : OUT std_ulogic;
		emission_faible : OUT std_ulogic;
		quartz2 : OUT std_ulogic
		);
	END COMPONENT;

	SIGNAL entrees :  unsigned(18 downto 1);
	SIGNAL clk :  std_ulogic;
	SIGNAL test :  unsigned(3 downto 0);
	SIGNAL led :  unsigned(2 downto 0);
	SIGNAL occupe :  std_logic;
	SIGNAL emission_fort :  std_ulogic;
	SIGNAL emission_faible :  std_ulogic;
	SIGNAL quartz1 :  std_ulogic;
	SIGNAL quartz2 :  std_ulogic;

BEGIN

	uut: carte PORT MAP(
		entrees => entrees,
		clk => clk,
		test => test,
		led => led,
		occupe => occupe,
		emission_fort => emission_fort,
		emission_faible => emission_faible,
		quartz1 => quartz1,
		quartz2 => quartz2
	);


-- *** Test Bench - User Defined Section ***
horloge: PROCESS  
BEGIN  -- PROCESS horloge       300kHz
  WAIT FOR 1 us;
  LOOP 
    clk <= '1', '0' AFTER 62.5 ns;
    WAIT FOR 3.33 us;
  END LOOP;
END PROCESS horloge;

occupe <= 'Z';
 
tb : PROCESS
BEGIN



  entrees <= (OTHERS => '1');

  WAIT FOR 20 us;

  entrees(2) <= '0', '1' AFTER 5 us;

  WAIT FOR 3.524 ms;

  entrees(2) <= '0' , '1' AFTER 5 us;
  entrees(17) <= '0' , '1' AFTER 5 us;

  WAIT FOR 3 ms;

  entrees(2) <= '0' , '1' AFTER 5 us;

  entrees(3) <= '1' , '0' AFTER 500 us , '1' AFTER 550 us;
  WAIT FOR 3.524 ms;


END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
