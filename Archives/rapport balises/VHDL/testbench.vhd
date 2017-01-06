
-- VHDL Test Bench Created from source file carte.vhd -- 09:49:36 02/27/2003
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
		entrees : IN unsigned( 18 DOWNTO 1);
		clk : IN std_logic;    
		occupe : INOUT std_logic;      
		ok_o : OUT std_logic;
		reception_o : OUT std_logic;
		valide_o : OUT std_logic;
		non_valide : OUT std_logic;
		trame : OUT std_logic
		);
	END COMPONENT;

	SIGNAL entrees :   unsigned(18 downto 1);
	SIGNAL clk :  std_logic;
	SIGNAL ok_o :  std_logic;
	SIGNAL reception_o :  std_logic;
	SIGNAL valide_o :  std_logic;
	SIGNAL non_valide :  std_logic;
	SIGNAL occupe :  std_logic;
	SIGNAL trame :  std_logic;

BEGIN

	uut: carte PORT MAP(
		entrees => entrees,
		clk => clk,
		ok_o => ok_o,
		reception_o => reception_o,
		valide_o => valide_o,
		non_valide => non_valide,
		occupe => occupe,
		trame => trame
	);


-- *** Test Bench - User Defined Section ***

horloge: PROCESS  
BEGIN  -- PROCESS horloge       8MHz
  WAIT FOR 1 us;
  LOOP 
    clk <= '1', '0' AFTER 62.5 ns;
    WAIT FOR 125 ns;
  END LOOP;
END PROCESS horloge;


 
tb : PROCESS
BEGIN



  entrees <= (OTHERS => '1');

  WAIT FOR 20 us;

  entrees(2) <= '0', '1' AFTER 5 us;

  WAIT FOR 3 ms;

  entrees(2) <= '0' , '1' AFTER 5 us;
  entrees(17) <= '0' , '1' AFTER 5 us;

  WAIT FOR 3 ms;


END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
