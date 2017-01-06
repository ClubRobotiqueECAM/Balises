-- Xilinx Vhdl produced by program ngd2vhdl E.38
-- Command: -rpw 100 -tpw 1 -ar Structure -xon true -w carte.nga carte_timesim.vhd 
-- Input file: carte.nga
-- Output file: carte_timesim.vhd
-- Design name: carte
-- Xilinx: C:/programs/xilwp
-- # of Entities: 1
-- Device: XC9536XL-5-PC44

-- The output of ngd2vhdl is a simulation model. This file cannot be synthesized,
-- or used in any other manner other than simulation. This netlist uses simulation
-- primitives which may not represent the true implementation of the device, however
-- the netlist is functionally correct. Do not modify this file.

-- Model for  ROC (Reset-On-Configuration) Cell
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
entity ROC is
  generic (InstancePath: STRING := "*";
           WIDTH : Time := 100 ns);
  port(O : out std_ulogic := '1') ;
  attribute VITAL_LEVEL0 of ROC : entity is TRUE;
end ROC;

architecture ROC_V of ROC is
attribute VITAL_LEVEL0 of ROC_V : architecture is TRUE;
begin
  ONE_SHOT : process
  begin
    if (WIDTH <= 0 ns) then
       assert FALSE report
       "*** Error: a positive value of WIDTH must be specified ***"
       severity failure;
    else
       wait for WIDTH;
       O <= '0';
    end if;
    wait;
  end process ONE_SHOT;
end ROC_V;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;
entity carte is
  port (
    occupe : inout STD_LOGIC; 
    clk : in STD_LOGIC := 'X'; 
    non_valide : out STD_LOGIC; 
    ok_o : out STD_LOGIC; 
    reception_o : out STD_LOGIC; 
    valide_o : out STD_LOGIC; 
    trame : out STD_LOGIC; 
    entrees : in STD_LOGIC_VECTOR ( 18 downto 1 ) 
  );
end carte;

architecture Structure of carte is
  component ROC
    generic (InstancePath: STRING := "*";
             WIDTH : Time := 100 ns);
    port (O : out STD_ULOGIC := '1');
  end component;
  signal N118 : STD_LOGIC; 
  signal N118_Q : STD_LOGIC; 
  signal N118_D : STD_LOGIC; 
  signal N118_D1 : STD_LOGIC; 
  signal N118_D2_PT_0 : STD_LOGIC; 
  signal N118_D2 : STD_LOGIC; 
  signal N118_UIM : STD_LOGIC; 
  signal tim_cpt_erreur_0_Q : STD_LOGIC; 
  signal tim_cpt_erreur_0_D : STD_LOGIC; 
  signal tim_cpt_erreur_0_CLKF : STD_LOGIC; 
  signal tim_cpt_erreur_0_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_0_D1 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_UIM : STD_LOGIC; 
  signal tim_cpt_erreur_0_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_0_D2 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_Q : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_D : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_D1 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_D2_PT_0 : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_UIM : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_UIM : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_D2_PT_1 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_0_D2 : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_Q : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_D : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_D1 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N100 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N103 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_D2_PT_0 : STD_LOGIC; 
  signal Q_OpTx_FX_DC_37_D2 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_Q : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D1 : STD_LOGIC; 
  signal N119 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D2_PT_0 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D2_PT_1 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D2_PT_2 : STD_LOGIC; 
  signal BUF_tim_cpt_erreur_3_D2 : STD_LOGIC; 
  signal tim_cpt_erreur_1_Q : STD_LOGIC; 
  signal tim_cpt_erreur_1_D : STD_LOGIC; 
  signal tim_cpt_erreur_1_CLKF : STD_LOGIC; 
  signal tim_cpt_erreur_1_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_1_D1 : STD_LOGIC; 
  signal tim_cpt_erreur_1_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_1_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_erreur_1_D2 : STD_LOGIC; 
  signal h_cpt_timer_0_Q : STD_LOGIC; 
  signal h_cpt_timer_0_D : STD_LOGIC; 
  signal FCLKIO_0 : STD_LOGIC; 
  signal h_cpt_timer_0_D1 : STD_LOGIC; 
  signal h_cpt_timer_0_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_timer_0_D2 : STD_LOGIC; 
  signal h_cpt_timer_1_Q : STD_LOGIC; 
  signal h_cpt_timer_1_D : STD_LOGIC; 
  signal h_cpt_timer_1_D1 : STD_LOGIC; 
  signal h_cpt_timer_1_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_timer_1_D2 : STD_LOGIC; 
  signal h_cpt_timer_1_D_TFF : STD_LOGIC; 
  signal h_cpt_timer_2_Q : STD_LOGIC; 
  signal h_cpt_timer_2_D : STD_LOGIC; 
  signal h_cpt_timer_2_D1 : STD_LOGIC; 
  signal h_cpt_timer_2_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_timer_2_D2 : STD_LOGIC; 
  signal h_cpt_timer_2_D_TFF : STD_LOGIC; 
  signal h_cpt_timer_3_Q : STD_LOGIC; 
  signal h_cpt_timer_3_D : STD_LOGIC; 
  signal h_cpt_timer_3_D1 : STD_LOGIC; 
  signal h_cpt_timer_3_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_timer_3_D2 : STD_LOGIC; 
  signal h_cpt_timer_3_D_TFF : STD_LOGIC; 
  signal tim_cpt_erreur_2_Q : STD_LOGIC; 
  signal tim_cpt_erreur_2_D : STD_LOGIC; 
  signal tim_cpt_erreur_2_CLKF : STD_LOGIC; 
  signal tim_cpt_erreur_2_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_2_D1 : STD_LOGIC; 
  signal tim_cpt_erreur_2_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_2_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_erreur_2_D2 : STD_LOGIC; 
  signal tim_cpt_erreur_2_D_TFF : STD_LOGIC; 
  signal tim_cpt_erreur_3_Q : STD_LOGIC; 
  signal tim_cpt_erreur_3_D : STD_LOGIC; 
  signal tim_cpt_erreur_3_CLKF : STD_LOGIC; 
  signal tim_cpt_erreur_3_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_3_D1 : STD_LOGIC; 
  signal tim_cpt_erreur_3_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_erreur_3_D2 : STD_LOGIC; 
  signal N119_Q : STD_LOGIC; 
  signal N119_Q_0 : STD_LOGIC; 
  signal N119_D : STD_LOGIC; 
  signal N119_D1 : STD_LOGIC; 
  signal EXP5_EXP : STD_LOGIC; 
  signal N119_D2_PT_0 : STD_LOGIC; 
  signal EXP6_EXP : STD_LOGIC; 
  signal N119_D2_PT_1 : STD_LOGIC; 
  signal N119_D2_PT_2 : STD_LOGIC; 
  signal N119_D2_PT_3 : STD_LOGIC; 
  signal N119_D2_PT_4 : STD_LOGIC; 
  signal N119_D2_PT_5 : STD_LOGIC; 
  signal N119_D2_PT_6 : STD_LOGIC; 
  signal N119_D2 : STD_LOGIC; 
  signal EXP4_EXP : STD_LOGIC; 
  signal EXP5_EXP_PT_0 : STD_LOGIC; 
  signal EXP5_EXP_PT_1 : STD_LOGIC; 
  signal EXP5_EXP_PT_2 : STD_LOGIC; 
  signal EXP5_EXP_PT_3 : STD_LOGIC; 
  signal EXP5_EXP_PT_4 : STD_LOGIC; 
  signal EXP5_EXP_PT_5 : STD_LOGIC; 
  signal EXP4_EXP_PT_0 : STD_LOGIC; 
  signal EXP4_EXP_PT_1 : STD_LOGIC; 
  signal EXP7_EXP : STD_LOGIC; 
  signal EXP6_EXP_PT_0 : STD_LOGIC; 
  signal EXP6_EXP_PT_1 : STD_LOGIC; 
  signal EXP6_EXP_PT_2 : STD_LOGIC; 
  signal EXP6_EXP_PT_3 : STD_LOGIC; 
  signal EXP6_EXP_PT_4 : STD_LOGIC; 
  signal EXP6_EXP_PT_5 : STD_LOGIC; 
  signal EXP7_EXP_PT_0 : STD_LOGIC; 
  signal N130_Q : STD_LOGIC; 
  signal N130_OE : STD_LOGIC; 
  signal N130_Q_1 : STD_LOGIC; 
  signal N130_D : STD_LOGIC; 
  signal N130_D1 : STD_LOGIC; 
  signal N130_D2_PT_0 : STD_LOGIC; 
  signal N130_D2 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N130_BUFOE_OUT : STD_LOGIC; 
  signal N130_TRST_PT_0 : STD_LOGIC; 
  signal N130_TRST : STD_LOGIC; 
  signal tr_cpt_0_Q : STD_LOGIC; 
  signal tr_cpt_0_RSTF : STD_LOGIC; 
  signal tr_cpt_0_R_OR_PRLD : STD_LOGIC; 
  signal tr_cpt_0_D : STD_LOGIC; 
  signal tr_cpt_0_CLKF : STD_LOGIC; 
  signal tr_cpt_0_CE : STD_LOGIC; 
  signal tr_cpt_0_CLKF_PT_0 : STD_LOGIC; 
  signal tr_I1_I0 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal tr_cpt_0_RSTF_PT_0 : STD_LOGIC; 
  signal tr_cpt_0_CE_PT_0 : STD_LOGIC; 
  signal tr_cpt_0_D1 : STD_LOGIC; 
  signal tr_cpt_0_D2_PT_0 : STD_LOGIC; 
  signal tr_cpt_0_D2 : STD_LOGIC; 
  signal h_cpt_trame_0_Q : STD_LOGIC; 
  signal h_cpt_trame_0_RSTF : STD_LOGIC; 
  signal h_cpt_trame_0_R_OR_PRLD : STD_LOGIC; 
  signal h_cpt_trame_0_D : STD_LOGIC; 
  signal h_cpt_trame_0_CLKF : STD_LOGIC; 
  signal h_cpt_trame_0_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_0_RSTF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_0_D1 : STD_LOGIC; 
  signal h_cpt_trame_0_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_0_D2 : STD_LOGIC; 
  signal h_cpt_mod_3_Q : STD_LOGIC; 
  signal h_cpt_mod_3_D : STD_LOGIC; 
  signal h_cpt_mod_3_CLKF : STD_LOGIC; 
  signal h_cpt_mod_3_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_3_D1 : STD_LOGIC; 
  signal h_cpt_mod_3_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_3_D2 : STD_LOGIC; 
  signal h_cpt_mod_3_D_TFF : STD_LOGIC; 
  signal h_cpt_mod_0_Q : STD_LOGIC; 
  signal h_cpt_mod_0_D : STD_LOGIC; 
  signal h_cpt_mod_0_CLKF : STD_LOGIC; 
  signal h_cpt_mod_0_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_0_D1 : STD_LOGIC; 
  signal h_cpt_mod_0_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_0_D2 : STD_LOGIC; 
  signal h_cpt_mod_0_D_TFF : STD_LOGIC; 
  signal h_cpt_mod_4_Q : STD_LOGIC; 
  signal h_cpt_mod_4_D : STD_LOGIC; 
  signal h_cpt_mod_4_CLKF : STD_LOGIC; 
  signal h_cpt_mod_4_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_4_D1 : STD_LOGIC; 
  signal h_cpt_mod_4_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_4_D2_PT_1 : STD_LOGIC; 
  signal h_cpt_mod_4_D2 : STD_LOGIC; 
  signal h_cpt_mod_4_D_TFF : STD_LOGIC; 
  signal h_cpt_mod_1_Q : STD_LOGIC; 
  signal h_cpt_mod_1_D : STD_LOGIC; 
  signal h_cpt_mod_1_CLKF : STD_LOGIC; 
  signal h_cpt_mod_1_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_1_D1 : STD_LOGIC; 
  signal h_cpt_mod_1_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_1_D2 : STD_LOGIC; 
  signal h_cpt_mod_1_D_TFF : STD_LOGIC; 
  signal h_cpt_mod_2_Q : STD_LOGIC; 
  signal h_cpt_mod_2_D : STD_LOGIC; 
  signal h_cpt_mod_2_CLKF : STD_LOGIC; 
  signal h_cpt_mod_2_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_2_D1 : STD_LOGIC; 
  signal h_cpt_mod_2_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_mod_2_D2 : STD_LOGIC; 
  signal h_cpt_mod_2_D_TFF : STD_LOGIC; 
  signal h_cpt_trame_1_Q : STD_LOGIC; 
  signal h_cpt_trame_1_RSTF : STD_LOGIC; 
  signal h_cpt_trame_1_R_OR_PRLD : STD_LOGIC; 
  signal h_cpt_trame_1_D : STD_LOGIC; 
  signal h_cpt_trame_1_CLKF : STD_LOGIC; 
  signal h_cpt_trame_1_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_1_RSTF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_1_D1 : STD_LOGIC; 
  signal h_cpt_trame_1_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_1_D2 : STD_LOGIC; 
  signal h_cpt_trame_1_D_TFF : STD_LOGIC; 
  signal h_cpt_trame_2_Q : STD_LOGIC; 
  signal h_cpt_trame_2_RSTF : STD_LOGIC; 
  signal h_cpt_trame_2_R_OR_PRLD : STD_LOGIC; 
  signal h_cpt_trame_2_D : STD_LOGIC; 
  signal h_cpt_trame_2_CLKF : STD_LOGIC; 
  signal h_cpt_trame_2_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_2_RSTF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_2_D1 : STD_LOGIC; 
  signal h_cpt_trame_2_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_2_D2 : STD_LOGIC; 
  signal h_cpt_trame_2_D_TFF : STD_LOGIC; 
  signal h_cpt_trame_3_Q : STD_LOGIC; 
  signal h_cpt_trame_3_RSTF : STD_LOGIC; 
  signal h_cpt_trame_3_R_OR_PRLD : STD_LOGIC; 
  signal h_cpt_trame_3_D : STD_LOGIC; 
  signal h_cpt_trame_3_CLKF : STD_LOGIC; 
  signal h_cpt_trame_3_CLKF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_3_RSTF_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_3_D1 : STD_LOGIC; 
  signal h_cpt_trame_3_D2_PT_0 : STD_LOGIC; 
  signal h_cpt_trame_3_D2 : STD_LOGIC; 
  signal h_cpt_trame_3_D_TFF : STD_LOGIC; 
  signal N122_Q : STD_LOGIC; 
  signal N122_Q_2 : STD_LOGIC; 
  signal N122_D : STD_LOGIC; 
  signal N122_CLKF : STD_LOGIC; 
  signal N122_CLKF_PT_0 : STD_LOGIC; 
  signal N122_D1 : STD_LOGIC; 
  signal N122_D2_PT_0 : STD_LOGIC; 
  signal N122_D2 : STD_LOGIC; 
  signal tim_cpt_ok_0_Q : STD_LOGIC; 
  signal tim_cpt_ok_0_D : STD_LOGIC; 
  signal tim_cpt_ok_0_CLKF : STD_LOGIC; 
  signal tim_cpt_ok_0_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_0_D1 : STD_LOGIC; 
  signal tim_cpt_ok_0_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_0_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_ok_0_D2_PT_2 : STD_LOGIC; 
  signal tim_cpt_ok_0_D2_PT_3 : STD_LOGIC; 
  signal tim_cpt_ok_0_D2 : STD_LOGIC; 
  signal tim_cpt_ok_3_Q : STD_LOGIC; 
  signal tim_cpt_ok_3_D : STD_LOGIC; 
  signal tim_cpt_ok_3_CLKF : STD_LOGIC; 
  signal tim_cpt_ok_3_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_3_D1 : STD_LOGIC; 
  signal tim_cpt_ok_3_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_3_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_ok_3_D2_PT_2 : STD_LOGIC; 
  signal tim_cpt_ok_3_D2_PT_3 : STD_LOGIC; 
  signal tim_cpt_ok_3_D2 : STD_LOGIC; 
  signal tim_cpt_ok_1_Q : STD_LOGIC; 
  signal tim_cpt_ok_1_D : STD_LOGIC; 
  signal tim_cpt_ok_1_CLKF : STD_LOGIC; 
  signal tim_cpt_ok_1_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_1_D1 : STD_LOGIC; 
  signal tim_cpt_ok_1_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_1_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_ok_1_D2_PT_2 : STD_LOGIC; 
  signal tim_cpt_ok_1_D2_PT_3 : STD_LOGIC; 
  signal tim_cpt_ok_1_D2 : STD_LOGIC; 
  signal tim_cpt_ok_2_Q : STD_LOGIC; 
  signal tim_cpt_ok_2_D : STD_LOGIC; 
  signal tim_cpt_ok_2_CLKF : STD_LOGIC; 
  signal tim_cpt_ok_2_CLKF_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_2_D1 : STD_LOGIC; 
  signal tim_cpt_ok_2_D2_PT_0 : STD_LOGIC; 
  signal tim_cpt_ok_2_D2_PT_1 : STD_LOGIC; 
  signal tim_cpt_ok_2_D2_PT_2 : STD_LOGIC; 
  signal tim_cpt_ok_2_D2_PT_3 : STD_LOGIC; 
  signal tim_cpt_ok_2_D2 : STD_LOGIC; 
  signal tr_cpt_1_Q : STD_LOGIC; 
  signal tr_cpt_1_RSTF : STD_LOGIC; 
  signal tr_cpt_1_R_OR_PRLD : STD_LOGIC; 
  signal tr_cpt_1_D : STD_LOGIC; 
  signal tr_cpt_1_CLKF : STD_LOGIC; 
  signal tr_cpt_1_CE : STD_LOGIC; 
  signal tr_cpt_1_CLKF_PT_0 : STD_LOGIC; 
  signal tr_cpt_1_RSTF_PT_0 : STD_LOGIC; 
  signal tr_cpt_1_CE_PT_0 : STD_LOGIC; 
  signal tr_cpt_1_D1 : STD_LOGIC; 
  signal tr_cpt_1_D2_PT_0 : STD_LOGIC; 
  signal tr_cpt_1_D2 : STD_LOGIC; 
  signal tr_cpt_1_D_TFF : STD_LOGIC; 
  signal N120_Q : STD_LOGIC; 
  signal N120_Q_3 : STD_LOGIC; 
  signal N120_D : STD_LOGIC; 
  signal N120_D1 : STD_LOGIC; 
  signal N120_D2_PT_0 : STD_LOGIC; 
  signal N120_D2 : STD_LOGIC; 
  signal N137 : STD_LOGIC; 
  signal N137_Q : STD_LOGIC; 
  signal N137_D : STD_LOGIC; 
  signal N137_D1 : STD_LOGIC; 
  signal N137_D2_PT_0 : STD_LOGIC; 
  signal N137_D2 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal PRLD : STD_LOGIC; 
  signal NlwInverterSignal_N118_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N118_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N118_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N118_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N118_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN15 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN16 : STD_LOGIC; 
  signal NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN21 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_1_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_erreur_3_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N119_D2_PT_2_IN15 : STD_LOGIC; 
  signal NlwInverterSignal_N119_D2_PT_3_IN13 : STD_LOGIC; 
  signal NlwInverterSignal_N119_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N119_D2_PT_5_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_N119_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_EXP5_EXP_PT_1_IN11 : STD_LOGIC; 
  signal NlwInverterSignal_EXP5_EXP_PT_2_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_EXP5_EXP_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_EXP5_EXP_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_EXP5_EXP_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_EXP4_EXP_PT_0_IN15 : STD_LOGIC; 
  signal NlwInverterSignal_EXP4_EXP_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_EXP6_EXP_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_EXP6_EXP_PT_2_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_EXP6_EXP_PT_3_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_EXP6_EXP_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_EXP6_EXP_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_EXP7_EXP_PT_0_IN12 : STD_LOGIC; 
  signal NlwInverterSignal_N130_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_0_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_0_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N122_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N122_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N122_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N122_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_N122_D2_PT_0_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_N122_D2_PT_0_IN20 : STD_LOGIC; 
  signal NlwInverterSignal_N122_D2_PT_0_IN21 : STD_LOGIC; 
  signal NlwInverterSignal_N122_D2_PT_0_IN22 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_D2_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_D2_PT_2_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_3_D2_PT_3_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN21 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN20 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_1_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_2_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN19 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN21 : STD_LOGIC; 
  signal NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN22 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_tr_cpt_1_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N120_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N137_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N137_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N137_D2_PT_0_IN2 : STD_LOGIC; 
  signal tim_cpt_erreur : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal h_cpt_timer : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal tr_cpt : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal h_cpt_trame : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal h_cpt_mod : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal tim_cpt_ok : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  non_valide_4 : X_BUF
    port map (
      I => N118,
      O => non_valide
    );
  N118_5 : X_BUF
    port map (
      I => N118_Q,
      O => N118
    );
  N118_REG : X_BUF
    port map (
      I => N118_D,
      O => N118_Q
    );
  GND_ZERO : X_ZERO
    port map (
      O => GND
    );
  N118_D1_6 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N118_D1
    );
  N118_D2_PT_0_7 : X_AND4
    port map (
      I0 => NlwInverterSignal_N118_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N118_D2_PT_0_IN1,
      I2 => NlwInverterSignal_N118_D2_PT_0_IN2,
      I3 => NlwInverterSignal_N118_D2_PT_0_IN3,
      O => N118_D2_PT_0
    );
  N118_D2_8 : X_OR2
    port map (
      I0 => N118_D2_PT_0,
      I1 => N118_D2_PT_0,
      O => N118_D2
    );
  N118_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_N118_XOR_IN0,
      I1 => N118_D2,
      O => N118_D
    );
  N118_UIM_9 : X_BUF
    port map (
      I => N118_Q,
      O => N118_UIM
    );
  tim_cpt_erreur_0_Q_10 : X_BUF
    port map (
      I => tim_cpt_erreur_0_Q,
      O => tim_cpt_erreur(0)
    );
  tim_cpt_erreur_0_REG : X_FF
    port map (
      I => tim_cpt_erreur_0_D,
      CE => VCC,
      CLK => tim_cpt_erreur_0_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_erreur_0_Q
    );
  VCC_ONE : X_ONE
    port map (
      O => VCC
    );
  tim_cpt_erreur_0_CLKF_PT_0_11 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN3,
      O => tim_cpt_erreur_0_CLKF_PT_0
    );
  tim_cpt_erreur_0_CLKF_12 : X_OR2
    port map (
      I0 => tim_cpt_erreur_0_CLKF_PT_0,
      I1 => tim_cpt_erreur_0_CLKF_PT_0,
      O => tim_cpt_erreur_0_CLKF
    );
  tim_cpt_erreur_0_D1_13 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_erreur_0_D1
    );
  tim_cpt_erreur_0_D2_PT_0_14 : X_AND2
    port map (
      I0 => BUF_tim_cpt_erreur_0_UIM,
      I1 => BUF_tim_cpt_erreur_0_UIM,
      O => tim_cpt_erreur_0_D2_PT_0
    );
  tim_cpt_erreur_0_D2_15 : X_OR2
    port map (
      I0 => tim_cpt_erreur_0_D2_PT_0,
      I1 => tim_cpt_erreur_0_D2_PT_0,
      O => tim_cpt_erreur_0_D2
    );
  tim_cpt_erreur_0_XOR : X_XOR2
    port map (
      I0 => tim_cpt_erreur_0_D1,
      I1 => tim_cpt_erreur_0_D2,
      O => tim_cpt_erreur_0_D
    );
  BUF_tim_cpt_erreur_0_UIM_16 : X_BUF
    port map (
      I => BUF_tim_cpt_erreur_0_Q,
      O => BUF_tim_cpt_erreur_0_UIM
    );
  BUF_tim_cpt_erreur_0_REG : X_BUF
    port map (
      I => BUF_tim_cpt_erreur_0_D,
      O => BUF_tim_cpt_erreur_0_Q
    );
  BUF_tim_cpt_erreur_0_D1_17 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => BUF_tim_cpt_erreur_0_D1
    );
  BUF_tim_cpt_erreur_0_D2_PT_0_18 : X_AND2
    port map (
      I0 => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_0_IN0,
      I1 => N118_UIM,
      O => BUF_tim_cpt_erreur_0_D2_PT_0
    );
  BUF_tim_cpt_erreur_0_D2_PT_1_19 : X_AND2
    port map (
      I0 => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN0,
      I1 => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN1,
      O => BUF_tim_cpt_erreur_0_D2_PT_1
    );
  BUF_tim_cpt_erreur_0_D2_20 : X_OR2
    port map (
      I0 => BUF_tim_cpt_erreur_0_D2_PT_0,
      I1 => BUF_tim_cpt_erreur_0_D2_PT_1,
      O => BUF_tim_cpt_erreur_0_D2
    );
  BUF_tim_cpt_erreur_0_XOR : X_XOR2
    port map (
      I0 => BUF_tim_cpt_erreur_0_D1,
      I1 => BUF_tim_cpt_erreur_0_D2,
      O => BUF_tim_cpt_erreur_0_D
    );
  Q_OpTx_FX_DC_37_UIM_21 : X_BUF
    port map (
      I => Q_OpTx_FX_DC_37_Q,
      O => Q_OpTx_FX_DC_37_UIM
    );
  Q_OpTx_FX_DC_37_REG : X_BUF
    port map (
      I => Q_OpTx_FX_DC_37_D,
      O => Q_OpTx_FX_DC_37_Q
    );
  Q_OpTx_FX_DC_37_D1_22 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => Q_OpTx_FX_DC_37_D1
    );
  Q_OpTx_FX_DC_37_D2_PT_0_23 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => N70,
      I15 => N64,
      I16 => N67,
      I17 => N61,
      I18 => VCC,
      I19 => VCC,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => Q_OpTx_FX_DC_37_D2_PT_0
    );
  Q_OpTx_FX_DC_37_D2_24 : X_OR2
    port map (
      I0 => Q_OpTx_FX_DC_37_D2_PT_0,
      I1 => Q_OpTx_FX_DC_37_D2_PT_0,
      O => Q_OpTx_FX_DC_37_D2
    );
  Q_OpTx_FX_DC_37_XOR : X_XOR2
    port map (
      I0 => Q_OpTx_FX_DC_37_D1,
      I1 => Q_OpTx_FX_DC_37_D2,
      O => Q_OpTx_FX_DC_37_D
    );
  N85_25 : X_BUF
    port map (
      I => entrees(1),
      O => N85
    );
  N88_26 : X_BUF
    port map (
      I => entrees(2),
      O => N88
    );
  N91_27 : X_BUF
    port map (
      I => entrees(3),
      O => N91
    );
  N94_28 : X_BUF
    port map (
      I => entrees(4),
      O => N94
    );
  N97_29 : X_BUF
    port map (
      I => entrees(5),
      O => N97
    );
  N100_30 : X_BUF
    port map (
      I => entrees(6),
      O => N100
    );
  N58_31 : X_BUF
    port map (
      I => entrees(10),
      O => N58
    );
  N109_32 : X_BUF
    port map (
      I => entrees(9),
      O => N109
    );
  N103_33 : X_BUF
    port map (
      I => entrees(7),
      O => N103
    );
  N106_34 : X_BUF
    port map (
      I => entrees(8),
      O => N106
    );
  N73_35 : X_BUF
    port map (
      I => entrees(15),
      O => N73
    );
  N76_36 : X_BUF
    port map (
      I => entrees(16),
      O => N76
    );
  N79_37 : X_BUF
    port map (
      I => entrees(17),
      O => N79
    );
  N82_38 : X_BUF
    port map (
      I => entrees(18),
      O => N82
    );
  N70_39 : X_BUF
    port map (
      I => entrees(14),
      O => N70
    );
  N64_40 : X_BUF
    port map (
      I => entrees(12),
      O => N64
    );
  N67_41 : X_BUF
    port map (
      I => entrees(13),
      O => N67
    );
  N61_42 : X_BUF
    port map (
      I => entrees(11),
      O => N61
    );
  BUF_tim_cpt_erreur_3_UIM_43 : X_BUF
    port map (
      I => BUF_tim_cpt_erreur_3_Q,
      O => BUF_tim_cpt_erreur_3_UIM
    );
  BUF_tim_cpt_erreur_3_REG : X_BUF
    port map (
      I => BUF_tim_cpt_erreur_3_D,
      O => BUF_tim_cpt_erreur_3_Q
    );
  BUF_tim_cpt_erreur_3_D1_44 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => BUF_tim_cpt_erreur_3_D1
    );
  BUF_tim_cpt_erreur_3_D2_PT_0_45 : X_AND5
    port map (
      I0 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN0,
      I1 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN1,
      I2 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN2,
      I3 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN3,
      I4 => N119,
      O => BUF_tim_cpt_erreur_3_D2_PT_0
    );
  BUF_tim_cpt_erreur_3_D2_PT_1_46 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN19,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => BUF_tim_cpt_erreur_3_D2_PT_1
    );
  BUF_tim_cpt_erreur_3_D2_PT_2_47 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN14,
      I15 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN15,
      I16 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN16,
      I17 => N70,
      I18 => N64,
      I19 => N67,
      I20 => N61,
      I21 => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN21,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => BUF_tim_cpt_erreur_3_D2_PT_2
    );
  BUF_tim_cpt_erreur_3_D2_48 : X_OR3
    port map (
      I0 => BUF_tim_cpt_erreur_3_D2_PT_0,
      I1 => BUF_tim_cpt_erreur_3_D2_PT_1,
      I2 => BUF_tim_cpt_erreur_3_D2_PT_2,
      O => BUF_tim_cpt_erreur_3_D2
    );
  BUF_tim_cpt_erreur_3_XOR : X_XOR2
    port map (
      I0 => BUF_tim_cpt_erreur_3_D1,
      I1 => BUF_tim_cpt_erreur_3_D2,
      O => BUF_tim_cpt_erreur_3_D
    );
  tim_cpt_erreur_1_Q_49 : X_BUF
    port map (
      I => tim_cpt_erreur_1_Q,
      O => tim_cpt_erreur(1)
    );
  tim_cpt_erreur_1_REG : X_FF
    port map (
      I => tim_cpt_erreur_1_D,
      CE => VCC,
      CLK => tim_cpt_erreur_1_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_erreur_1_Q
    );
  tim_cpt_erreur_1_CLKF_PT_0_50 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN3,
      O => tim_cpt_erreur_1_CLKF_PT_0
    );
  tim_cpt_erreur_1_CLKF_51 : X_OR2
    port map (
      I0 => tim_cpt_erreur_1_CLKF_PT_0,
      I1 => tim_cpt_erreur_1_CLKF_PT_0,
      O => tim_cpt_erreur_1_CLKF
    );
  tim_cpt_erreur_1_D1_52 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_erreur_1_D1
    );
  tim_cpt_erreur_1_D2_PT_0_53 : X_AND2
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN1,
      O => tim_cpt_erreur_1_D2_PT_0
    );
  tim_cpt_erreur_1_D2_PT_1_54 : X_AND3
    port map (
      I0 => tim_cpt_erreur(1),
      I1 => BUF_tim_cpt_erreur_0_UIM,
      I2 => Q_OpTx_FX_DC_37_UIM,
      O => tim_cpt_erreur_1_D2_PT_1
    );
  tim_cpt_erreur_1_D2_55 : X_OR2
    port map (
      I0 => tim_cpt_erreur_1_D2_PT_0,
      I1 => tim_cpt_erreur_1_D2_PT_1,
      O => tim_cpt_erreur_1_D2
    );
  tim_cpt_erreur_1_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_1_XOR_IN0,
      I1 => tim_cpt_erreur_1_D2,
      O => tim_cpt_erreur_1_D
    );
  h_cpt_timer_0_Q_56 : X_BUF
    port map (
      I => h_cpt_timer_0_Q,
      O => h_cpt_timer(0)
    );
  h_cpt_timer_0_REG : X_FF
    port map (
      I => h_cpt_timer_0_D,
      CE => VCC,
      CLK => FCLKIO_0,
      SET => GND,
      RST => PRLD,
      O => h_cpt_timer_0_Q
    );
  h_cpt_timer_0_D1_57 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_timer_0_D1
    );
  h_cpt_timer_0_D2_PT_0_58 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN1,
      O => h_cpt_timer_0_D2_PT_0
    );
  h_cpt_timer_0_D2_59 : X_OR2
    port map (
      I0 => h_cpt_timer_0_D2_PT_0,
      I1 => h_cpt_timer_0_D2_PT_0,
      O => h_cpt_timer_0_D2
    );
  h_cpt_timer_0_XOR : X_XOR2
    port map (
      I0 => h_cpt_timer_0_D1,
      I1 => h_cpt_timer_0_D2,
      O => h_cpt_timer_0_D
    );
  FCLKIO_0_60 : X_BUF
    port map (
      I => clk,
      O => FCLKIO_0
    );
  h_cpt_timer_1_Q_61 : X_BUF
    port map (
      I => h_cpt_timer_1_Q,
      O => h_cpt_timer(1)
    );
  h_cpt_timer_1_REG : X_FF
    port map (
      I => h_cpt_timer_1_D,
      CE => VCC,
      CLK => FCLKIO_0,
      SET => GND,
      RST => PRLD,
      O => h_cpt_timer_1_Q
    );
  h_cpt_timer_1_D1_62 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_timer_1_D1
    );
  h_cpt_timer_1_D2_PT_0_63 : X_AND2
    port map (
      I0 => h_cpt_timer(0),
      I1 => h_cpt_timer(0),
      O => h_cpt_timer_1_D2_PT_0
    );
  h_cpt_timer_1_D2_64 : X_OR2
    port map (
      I0 => h_cpt_timer_1_D2_PT_0,
      I1 => h_cpt_timer_1_D2_PT_0,
      O => h_cpt_timer_1_D2
    );
  h_cpt_timer_1_D_65 : X_XOR2
    port map (
      I0 => h_cpt_timer_1_D_TFF,
      I1 => h_cpt_timer_1_Q,
      O => h_cpt_timer_1_D
    );
  h_cpt_timer_1_XOR : X_XOR2
    port map (
      I0 => h_cpt_timer_1_D1,
      I1 => h_cpt_timer_1_D2,
      O => h_cpt_timer_1_D_TFF
    );
  h_cpt_timer_2_Q_66 : X_BUF
    port map (
      I => h_cpt_timer_2_Q,
      O => h_cpt_timer(2)
    );
  h_cpt_timer_2_REG : X_FF
    port map (
      I => h_cpt_timer_2_D,
      CE => VCC,
      CLK => FCLKIO_0,
      SET => GND,
      RST => PRLD,
      O => h_cpt_timer_2_Q
    );
  h_cpt_timer_2_D1_67 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_timer_2_D1
    );
  h_cpt_timer_2_D2_PT_0_68 : X_AND2
    port map (
      I0 => h_cpt_timer(0),
      I1 => h_cpt_timer(1),
      O => h_cpt_timer_2_D2_PT_0
    );
  h_cpt_timer_2_D2_69 : X_OR2
    port map (
      I0 => h_cpt_timer_2_D2_PT_0,
      I1 => h_cpt_timer_2_D2_PT_0,
      O => h_cpt_timer_2_D2
    );
  h_cpt_timer_2_D_70 : X_XOR2
    port map (
      I0 => h_cpt_timer_2_D_TFF,
      I1 => h_cpt_timer_2_Q,
      O => h_cpt_timer_2_D
    );
  h_cpt_timer_2_XOR : X_XOR2
    port map (
      I0 => h_cpt_timer_2_D1,
      I1 => h_cpt_timer_2_D2,
      O => h_cpt_timer_2_D_TFF
    );
  h_cpt_timer_3_Q_71 : X_BUF
    port map (
      I => h_cpt_timer_3_Q,
      O => h_cpt_timer(3)
    );
  h_cpt_timer_3_REG : X_FF
    port map (
      I => h_cpt_timer_3_D,
      CE => VCC,
      CLK => FCLKIO_0,
      SET => GND,
      RST => PRLD,
      O => h_cpt_timer_3_Q
    );
  h_cpt_timer_3_D1_72 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_timer_3_D1
    );
  h_cpt_timer_3_D2_PT_0_73 : X_AND3
    port map (
      I0 => h_cpt_timer(0),
      I1 => h_cpt_timer(1),
      I2 => h_cpt_timer(2),
      O => h_cpt_timer_3_D2_PT_0
    );
  h_cpt_timer_3_D2_74 : X_OR2
    port map (
      I0 => h_cpt_timer_3_D2_PT_0,
      I1 => h_cpt_timer_3_D2_PT_0,
      O => h_cpt_timer_3_D2
    );
  h_cpt_timer_3_D_75 : X_XOR2
    port map (
      I0 => h_cpt_timer_3_D_TFF,
      I1 => h_cpt_timer_3_Q,
      O => h_cpt_timer_3_D
    );
  h_cpt_timer_3_XOR : X_XOR2
    port map (
      I0 => h_cpt_timer_3_D1,
      I1 => h_cpt_timer_3_D2,
      O => h_cpt_timer_3_D_TFF
    );
  tim_cpt_erreur_2_Q_76 : X_BUF
    port map (
      I => tim_cpt_erreur_2_Q,
      O => tim_cpt_erreur(2)
    );
  tim_cpt_erreur_2_REG : X_FF
    port map (
      I => tim_cpt_erreur_2_D,
      CE => VCC,
      CLK => tim_cpt_erreur_2_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_erreur_2_Q
    );
  tim_cpt_erreur_2_CLKF_PT_0_77 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN3,
      O => tim_cpt_erreur_2_CLKF_PT_0
    );
  tim_cpt_erreur_2_CLKF_78 : X_OR2
    port map (
      I0 => tim_cpt_erreur_2_CLKF_PT_0,
      I1 => tim_cpt_erreur_2_CLKF_PT_0,
      O => tim_cpt_erreur_2_CLKF
    );
  tim_cpt_erreur_2_D1_79 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_erreur_2_D1
    );
  tim_cpt_erreur_2_D2_PT_0_80 : X_AND3
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_0_IN0,
      I1 => BUF_tim_cpt_erreur_0_UIM,
      I2 => Q_OpTx_FX_DC_37_UIM,
      O => tim_cpt_erreur_2_D2_PT_0
    );
  tim_cpt_erreur_2_D2_PT_1_81 : X_AND3
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN0,
      I1 => BUF_tim_cpt_erreur_0_UIM,
      I2 => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN2,
      O => tim_cpt_erreur_2_D2_PT_1
    );
  tim_cpt_erreur_2_D2_82 : X_OR2
    port map (
      I0 => tim_cpt_erreur_2_D2_PT_0,
      I1 => tim_cpt_erreur_2_D2_PT_1,
      O => tim_cpt_erreur_2_D2
    );
  tim_cpt_erreur_2_D_83 : X_XOR2
    port map (
      I0 => tim_cpt_erreur_2_D_TFF,
      I1 => tim_cpt_erreur_2_Q,
      O => tim_cpt_erreur_2_D
    );
  tim_cpt_erreur_2_XOR : X_XOR2
    port map (
      I0 => tim_cpt_erreur_2_D1,
      I1 => tim_cpt_erreur_2_D2,
      O => tim_cpt_erreur_2_D_TFF
    );
  tim_cpt_erreur_3_Q_84 : X_BUF
    port map (
      I => tim_cpt_erreur_3_Q,
      O => tim_cpt_erreur(3)
    );
  tim_cpt_erreur_3_REG : X_FF
    port map (
      I => tim_cpt_erreur_3_D,
      CE => VCC,
      CLK => tim_cpt_erreur_3_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_erreur_3_Q
    );
  tim_cpt_erreur_3_CLKF_PT_0_85 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN3,
      O => tim_cpt_erreur_3_CLKF_PT_0
    );
  tim_cpt_erreur_3_CLKF_86 : X_OR2
    port map (
      I0 => tim_cpt_erreur_3_CLKF_PT_0,
      I1 => tim_cpt_erreur_3_CLKF_PT_0,
      O => tim_cpt_erreur_3_CLKF
    );
  tim_cpt_erreur_3_D1_87 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_erreur_3_D1
    );
  tim_cpt_erreur_3_D2_PT_0_88 : X_AND2
    port map (
      I0 => BUF_tim_cpt_erreur_3_UIM,
      I1 => BUF_tim_cpt_erreur_3_UIM,
      O => tim_cpt_erreur_3_D2_PT_0
    );
  tim_cpt_erreur_3_D2_89 : X_OR2
    port map (
      I0 => tim_cpt_erreur_3_D2_PT_0,
      I1 => tim_cpt_erreur_3_D2_PT_0,
      O => tim_cpt_erreur_3_D2
    );
  tim_cpt_erreur_3_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_tim_cpt_erreur_3_XOR_IN0,
      I1 => tim_cpt_erreur_3_D2,
      O => tim_cpt_erreur_3_D
    );
  N119_Q_90 : X_BUF
    port map (
      I => N119_Q,
      O => N119_Q_0
    );
  N119_REG : X_BUF
    port map (
      I => N119_D,
      O => N119_Q
    );
  N119_D1_91 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N119_D1
    );
  N119_D2_PT_0_92 : X_AND2
    port map (
      I0 => EXP5_EXP,
      I1 => EXP5_EXP,
      O => N119_D2_PT_0
    );
  N119_D2_PT_1_93 : X_AND2
    port map (
      I0 => EXP6_EXP,
      I1 => EXP6_EXP,
      O => N119_D2_PT_1
    );
  N119_D2_PT_2_94 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => N70,
      I15 => NlwInverterSignal_N119_D2_PT_2_IN15,
      O => N119_D2_PT_2
    );
  N119_D2_PT_3_95 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N76,
      I11 => N79,
      I12 => N82,
      I13 => NlwInverterSignal_N119_D2_PT_3_IN13,
      I14 => N64,
      I15 => N61,
      O => N119_D2_PT_3
    );
  N119_D2_PT_4_96 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => NlwInverterSignal_N119_D2_PT_4_IN6,
      I7 => N103,
      I8 => N106,
      I9 => N73,
      I10 => N76,
      I11 => N79,
      I12 => N82,
      I13 => N70,
      I14 => N64,
      I15 => N67,
      O => N119_D2_PT_4
    );
  N119_D2_PT_5_97 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => NlwInverterSignal_N119_D2_PT_5_IN6,
      I7 => N103,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => N119_D2_PT_5
    );
  N119_D2_PT_6_98 : X_AND16
    port map (
      I0 => N85,
      I1 => NlwInverterSignal_N119_D2_PT_6_IN1,
      I2 => N97,
      I3 => N100,
      I4 => N58,
      I5 => N109,
      I6 => N103,
      I7 => N106,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => N119_D2_PT_6
    );
  N119_D2_99 : X_OR7
    port map (
      I0 => N119_D2_PT_0,
      I1 => N119_D2_PT_1,
      I2 => N119_D2_PT_2,
      I3 => N119_D2_PT_3,
      I4 => N119_D2_PT_4,
      I5 => N119_D2_PT_5,
      I6 => N119_D2_PT_6,
      O => N119_D2
    );
  N119_XOR : X_XOR2
    port map (
      I0 => N119_D1,
      I1 => N119_D2,
      O => N119_D
    );
  N119_100 : X_BUF
    port map (
      I => N119_Q,
      O => N119
    );
  EXP5_EXP_PT_0_101 : X_AND2
    port map (
      I0 => EXP4_EXP,
      I1 => EXP4_EXP,
      O => EXP5_EXP_PT_0
    );
  EXP5_EXP_PT_1_102 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => NlwInverterSignal_EXP5_EXP_PT_1_IN11,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP5_EXP_PT_1
    );
  EXP5_EXP_PT_2_103 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => NlwInverterSignal_EXP5_EXP_PT_2_IN10,
      I11 => N79,
      I12 => N82,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP5_EXP_PT_2
    );
  EXP5_EXP_PT_3_104 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => NlwInverterSignal_EXP5_EXP_PT_3_IN7,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP5_EXP_PT_3
    );
  EXP5_EXP_PT_4_105 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => NlwInverterSignal_EXP5_EXP_PT_4_IN4,
      I5 => N58,
      I6 => N109,
      I7 => N106,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP5_EXP_PT_4
    );
  EXP5_EXP_PT_5_106 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => NlwInverterSignal_EXP5_EXP_PT_5_IN3,
      I4 => N58,
      I5 => N109,
      I6 => N103,
      I7 => N106,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP5_EXP_PT_5
    );
  EXP5_EXP_107 : X_OR6
    port map (
      I0 => EXP5_EXP_PT_0,
      I1 => EXP5_EXP_PT_1,
      I2 => EXP5_EXP_PT_2,
      I3 => EXP5_EXP_PT_3,
      I4 => EXP5_EXP_PT_4,
      I5 => EXP5_EXP_PT_5,
      O => EXP5_EXP
    );
  EXP4_EXP_PT_0_108 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N109,
      I7 => N103,
      I8 => N106,
      I9 => N73,
      I10 => N76,
      I11 => N79,
      I12 => N82,
      I13 => N70,
      I14 => N67,
      I15 => NlwInverterSignal_EXP4_EXP_PT_0_IN15,
      O => EXP4_EXP_PT_0
    );
  EXP4_EXP_PT_1_109 : X_AND32
    port map (
      I0 => NlwInverterSignal_EXP4_EXP_PT_1_IN0,
      I1 => N91,
      I2 => N94,
      I3 => N97,
      I4 => N100,
      I5 => N58,
      I6 => N109,
      I7 => N103,
      I8 => N106,
      I9 => N73,
      I10 => N76,
      I11 => N79,
      I12 => N82,
      I13 => N70,
      I14 => N64,
      I15 => N67,
      I16 => N61,
      I17 => VCC,
      I18 => VCC,
      I19 => VCC,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => EXP4_EXP_PT_1
    );
  EXP4_EXP_110 : X_OR2
    port map (
      I0 => EXP4_EXP_PT_0,
      I1 => EXP4_EXP_PT_1,
      O => EXP4_EXP
    );
  EXP6_EXP_PT_0_111 : X_AND2
    port map (
      I0 => EXP7_EXP,
      I1 => EXP7_EXP,
      O => EXP6_EXP_PT_0
    );
  EXP6_EXP_PT_1_112 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_EXP6_EXP_PT_1_IN14,
      I15 => N61,
      O => EXP6_EXP_PT_1
    );
  EXP6_EXP_PT_2_113 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => NlwInverterSignal_EXP6_EXP_PT_2_IN10,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP6_EXP_PT_2
    );
  EXP6_EXP_PT_3_114 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N58,
      I6 => N109,
      I7 => NlwInverterSignal_EXP6_EXP_PT_3_IN7,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP6_EXP_PT_3
    );
  EXP6_EXP_PT_4_115 : X_AND16
    port map (
      I0 => N85,
      I1 => N88,
      I2 => NlwInverterSignal_EXP6_EXP_PT_4_IN2,
      I3 => N100,
      I4 => N58,
      I5 => N109,
      I6 => N103,
      I7 => N106,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP6_EXP_PT_4
    );
  EXP6_EXP_PT_5_116 : X_AND16
    port map (
      I0 => NlwInverterSignal_EXP6_EXP_PT_5_IN0,
      I1 => N94,
      I2 => N97,
      I3 => N100,
      I4 => N58,
      I5 => N109,
      I6 => N103,
      I7 => N106,
      I8 => N73,
      I9 => N76,
      I10 => N79,
      I11 => N82,
      I12 => N70,
      I13 => N64,
      I14 => N67,
      I15 => N61,
      O => EXP6_EXP_PT_5
    );
  EXP6_EXP_117 : X_OR6
    port map (
      I0 => EXP6_EXP_PT_0,
      I1 => EXP6_EXP_PT_1,
      I2 => EXP6_EXP_PT_2,
      I3 => EXP6_EXP_PT_3,
      I4 => EXP6_EXP_PT_4,
      I5 => EXP6_EXP_PT_5,
      O => EXP6_EXP
    );
  EXP7_EXP_PT_0_118 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => NlwInverterSignal_EXP7_EXP_PT_0_IN12,
      I13 => N70,
      I14 => N64,
      I15 => N67,
      I16 => N61,
      I17 => VCC,
      I18 => VCC,
      I19 => VCC,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => EXP7_EXP_PT_0
    );
  EXP7_EXP_119 : X_OR2
    port map (
      I0 => EXP7_EXP_PT_0,
      I1 => EXP7_EXP_PT_0,
      O => EXP7_EXP
    );
  occupe_120 : X_TRI
    port map (
      I => N130_Q,
      CTL => N130_OE,
      O => occupe
    );
  N130_Q_121 : X_BUF
    port map (
      I => N130_Q_1,
      O => N130_Q
    );
  N130_REG : X_BUF
    port map (
      I => N130_D,
      O => N130_Q_1
    );
  N130_D1_122 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N130_D1
    );
  N130_D2_PT_0_123 : X_AND2
    port map (
      I0 => tr_cpt(0),
      I1 => tr_cpt(1),
      O => N130_D2_PT_0
    );
  N130_D2_124 : X_OR2
    port map (
      I0 => N130_D2_PT_0,
      I1 => N130_D2_PT_0,
      O => N130_D2
    );
  N130_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_N130_XOR_IN0,
      I1 => N130_D2,
      O => N130_D
    );
  N128_125 : X_BUF
    port map (
      I => N130_Q_1,
      O => N128
    );
  N130_OE_126 : X_BUF
    port map (
      I => N130_BUFOE_OUT,
      O => N130_OE
    );
  N130_TRST_PT_0_127 : X_AND2
    port map (
      I0 => N128,
      I1 => N128,
      O => N130_TRST_PT_0
    );
  N130_TRST_128 : X_OR2
    port map (
      I0 => N130_TRST_PT_0,
      I1 => N130_TRST_PT_0,
      O => N130_TRST
    );
  N130_BUFOE : X_BUF
    port map (
      I => N130_TRST,
      O => N130_BUFOE_OUT
    );
  tr_cpt_0_Q_129 : X_BUF
    port map (
      I => tr_cpt_0_Q,
      O => tr_cpt(0)
    );
  tr_cpt_0_R_OR_PRLD_130 : X_OR2
    port map (
      I0 => tr_cpt_0_RSTF,
      I1 => PRLD,
      O => tr_cpt_0_R_OR_PRLD
    );
  tr_cpt_0_REG : X_FF
    port map (
      I => tr_cpt_0_D,
      CE => tr_cpt_0_CE,
      CLK => tr_cpt_0_CLKF,
      SET => GND,
      RST => tr_cpt_0_R_OR_PRLD,
      O => tr_cpt_0_Q
    );
  tr_cpt_0_CLKF_PT_0_131 : X_AND4
    port map (
      I0 => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN3,
      O => tr_cpt_0_CLKF_PT_0
    );
  tr_cpt_0_CLKF_132 : X_OR2
    port map (
      I0 => tr_cpt_0_CLKF_PT_0,
      I1 => tr_cpt_0_CLKF_PT_0,
      O => tr_cpt_0_CLKF
    );
  tr_cpt_0_RSTF_PT_0_133 : X_AND2
    port map (
      I0 => NlwInverterSignal_tr_cpt_0_RSTF_PT_0_IN0,
      I1 => N122,
      O => tr_cpt_0_RSTF_PT_0
    );
  tr_cpt_0_RSTF_134 : X_OR2
    port map (
      I0 => tr_cpt_0_RSTF_PT_0,
      I1 => tr_cpt_0_RSTF_PT_0,
      O => tr_cpt_0_RSTF
    );
  tr_cpt_0_CE_PT_0_135 : X_AND2
    port map (
      I0 => N128,
      I1 => N128,
      O => tr_cpt_0_CE_PT_0
    );
  tr_cpt_0_CE_136 : X_OR2
    port map (
      I0 => tr_cpt_0_CE_PT_0,
      I1 => tr_cpt_0_CE_PT_0,
      O => tr_cpt_0_CE
    );
  tr_cpt_0_D1_137 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tr_cpt_0_D1
    );
  tr_cpt_0_D2_PT_0_138 : X_AND2
    port map (
      I0 => NlwInverterSignal_tr_cpt_0_D2_PT_0_IN0,
      I1 => NlwInverterSignal_tr_cpt_0_D2_PT_0_IN1,
      O => tr_cpt_0_D2_PT_0
    );
  tr_cpt_0_D2_139 : X_OR2
    port map (
      I0 => tr_cpt_0_D2_PT_0,
      I1 => tr_cpt_0_D2_PT_0,
      O => tr_cpt_0_D2
    );
  tr_cpt_0_XOR : X_XOR2
    port map (
      I0 => tr_cpt_0_D1,
      I1 => tr_cpt_0_D2,
      O => tr_cpt_0_D
    );
  h_cpt_trame_0_Q_140 : X_BUF
    port map (
      I => h_cpt_trame_0_Q,
      O => h_cpt_trame(0)
    );
  h_cpt_trame_0_R_OR_PRLD_141 : X_OR2
    port map (
      I0 => h_cpt_trame_0_RSTF,
      I1 => PRLD,
      O => h_cpt_trame_0_R_OR_PRLD
    );
  h_cpt_trame_0_REG : X_FF
    port map (
      I => h_cpt_trame_0_D,
      CE => VCC,
      CLK => h_cpt_trame_0_CLKF,
      SET => GND,
      RST => h_cpt_trame_0_R_OR_PRLD,
      O => h_cpt_trame_0_Q
    );
  h_cpt_trame_0_CLKF_PT_0_142 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN1,
      O => h_cpt_trame_0_CLKF_PT_0
    );
  h_cpt_trame_0_CLKF_143 : X_OR2
    port map (
      I0 => h_cpt_trame_0_CLKF_PT_0,
      I1 => h_cpt_trame_0_CLKF_PT_0,
      O => h_cpt_trame_0_CLKF
    );
  h_cpt_trame_0_RSTF_PT_0_144 : X_AND2
    port map (
      I0 => N119,
      I1 => N119,
      O => h_cpt_trame_0_RSTF_PT_0
    );
  h_cpt_trame_0_RSTF_145 : X_OR2
    port map (
      I0 => h_cpt_trame_0_RSTF_PT_0,
      I1 => h_cpt_trame_0_RSTF_PT_0,
      O => h_cpt_trame_0_RSTF
    );
  h_cpt_trame_0_D1_146 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_trame_0_D1
    );
  h_cpt_trame_0_D2_PT_0_147 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN1,
      O => h_cpt_trame_0_D2_PT_0
    );
  h_cpt_trame_0_D2_148 : X_OR2
    port map (
      I0 => h_cpt_trame_0_D2_PT_0,
      I1 => h_cpt_trame_0_D2_PT_0,
      O => h_cpt_trame_0_D2
    );
  h_cpt_trame_0_XOR : X_XOR2
    port map (
      I0 => h_cpt_trame_0_D1,
      I1 => h_cpt_trame_0_D2,
      O => h_cpt_trame_0_D
    );
  h_cpt_mod_3_Q_149 : X_BUF
    port map (
      I => h_cpt_mod_3_Q,
      O => h_cpt_mod(3)
    );
  h_cpt_mod_3_REG : X_FF
    port map (
      I => h_cpt_mod_3_D,
      CE => VCC,
      CLK => h_cpt_mod_3_CLKF,
      SET => GND,
      RST => PRLD,
      O => h_cpt_mod_3_Q
    );
  h_cpt_mod_3_CLKF_PT_0_150 : X_AND4
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN3,
      O => h_cpt_mod_3_CLKF_PT_0
    );
  h_cpt_mod_3_CLKF_151 : X_OR2
    port map (
      I0 => h_cpt_mod_3_CLKF_PT_0,
      I1 => h_cpt_mod_3_CLKF_PT_0,
      O => h_cpt_mod_3_CLKF
    );
  h_cpt_mod_3_D1_152 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_mod_3_D1
    );
  h_cpt_mod_3_D2_PT_0_153 : X_AND3
    port map (
      I0 => h_cpt_mod(0),
      I1 => h_cpt_mod(1),
      I2 => h_cpt_mod(2),
      O => h_cpt_mod_3_D2_PT_0
    );
  h_cpt_mod_3_D2_154 : X_OR2
    port map (
      I0 => h_cpt_mod_3_D2_PT_0,
      I1 => h_cpt_mod_3_D2_PT_0,
      O => h_cpt_mod_3_D2
    );
  h_cpt_mod_3_D_155 : X_XOR2
    port map (
      I0 => h_cpt_mod_3_D_TFF,
      I1 => h_cpt_mod_3_Q,
      O => h_cpt_mod_3_D
    );
  h_cpt_mod_3_XOR : X_XOR2
    port map (
      I0 => h_cpt_mod_3_D1,
      I1 => h_cpt_mod_3_D2,
      O => h_cpt_mod_3_D_TFF
    );
  h_cpt_mod_0_Q_156 : X_BUF
    port map (
      I => h_cpt_mod_0_Q,
      O => h_cpt_mod(0)
    );
  h_cpt_mod_0_REG : X_FF
    port map (
      I => h_cpt_mod_0_D,
      CE => VCC,
      CLK => h_cpt_mod_0_CLKF,
      SET => GND,
      RST => PRLD,
      O => h_cpt_mod_0_Q
    );
  h_cpt_mod_0_CLKF_PT_0_157 : X_AND4
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN3,
      O => h_cpt_mod_0_CLKF_PT_0
    );
  h_cpt_mod_0_CLKF_158 : X_OR2
    port map (
      I0 => h_cpt_mod_0_CLKF_PT_0,
      I1 => h_cpt_mod_0_CLKF_PT_0,
      O => h_cpt_mod_0_CLKF
    );
  h_cpt_mod_0_D1_159 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_mod_0_D1
    );
  h_cpt_mod_0_D2_PT_0_160 : X_AND5
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN0,
      I1 => h_cpt_mod(4),
      I2 => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN3,
      I4 => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN4,
      O => h_cpt_mod_0_D2_PT_0
    );
  h_cpt_mod_0_D2_161 : X_OR2
    port map (
      I0 => h_cpt_mod_0_D2_PT_0,
      I1 => h_cpt_mod_0_D2_PT_0,
      O => h_cpt_mod_0_D2
    );
  h_cpt_mod_0_D_162 : X_XOR2
    port map (
      I0 => h_cpt_mod_0_D_TFF,
      I1 => h_cpt_mod_0_Q,
      O => h_cpt_mod_0_D
    );
  h_cpt_mod_0_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_0_XOR_IN0,
      I1 => h_cpt_mod_0_D2,
      O => h_cpt_mod_0_D_TFF
    );
  h_cpt_mod_4_Q_163 : X_BUF
    port map (
      I => h_cpt_mod_4_Q,
      O => h_cpt_mod(4)
    );
  h_cpt_mod_4_REG : X_FF
    port map (
      I => h_cpt_mod_4_D,
      CE => VCC,
      CLK => h_cpt_mod_4_CLKF,
      SET => GND,
      RST => PRLD,
      O => h_cpt_mod_4_Q
    );
  h_cpt_mod_4_CLKF_PT_0_164 : X_AND4
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN3,
      O => h_cpt_mod_4_CLKF_PT_0
    );
  h_cpt_mod_4_CLKF_165 : X_OR2
    port map (
      I0 => h_cpt_mod_4_CLKF_PT_0,
      I1 => h_cpt_mod_4_CLKF_PT_0,
      O => h_cpt_mod_4_CLKF
    );
  h_cpt_mod_4_D1_166 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_mod_4_D1
    );
  h_cpt_mod_4_D2_PT_0_167 : X_AND4
    port map (
      I0 => h_cpt_mod(3),
      I1 => h_cpt_mod(0),
      I2 => h_cpt_mod(1),
      I3 => h_cpt_mod(2),
      O => h_cpt_mod_4_D2_PT_0
    );
  h_cpt_mod_4_D2_PT_1_168 : X_AND5
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN0,
      I1 => h_cpt_mod(4),
      I2 => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN3,
      I4 => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN4,
      O => h_cpt_mod_4_D2_PT_1
    );
  h_cpt_mod_4_D2_169 : X_OR2
    port map (
      I0 => h_cpt_mod_4_D2_PT_0,
      I1 => h_cpt_mod_4_D2_PT_1,
      O => h_cpt_mod_4_D2
    );
  h_cpt_mod_4_D_170 : X_XOR2
    port map (
      I0 => h_cpt_mod_4_D_TFF,
      I1 => h_cpt_mod_4_Q,
      O => h_cpt_mod_4_D
    );
  h_cpt_mod_4_XOR : X_XOR2
    port map (
      I0 => h_cpt_mod_4_D1,
      I1 => h_cpt_mod_4_D2,
      O => h_cpt_mod_4_D_TFF
    );
  h_cpt_mod_1_Q_171 : X_BUF
    port map (
      I => h_cpt_mod_1_Q,
      O => h_cpt_mod(1)
    );
  h_cpt_mod_1_REG : X_FF
    port map (
      I => h_cpt_mod_1_D,
      CE => VCC,
      CLK => h_cpt_mod_1_CLKF,
      SET => GND,
      RST => PRLD,
      O => h_cpt_mod_1_Q
    );
  h_cpt_mod_1_CLKF_PT_0_172 : X_AND4
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN3,
      O => h_cpt_mod_1_CLKF_PT_0
    );
  h_cpt_mod_1_CLKF_173 : X_OR2
    port map (
      I0 => h_cpt_mod_1_CLKF_PT_0,
      I1 => h_cpt_mod_1_CLKF_PT_0,
      O => h_cpt_mod_1_CLKF
    );
  h_cpt_mod_1_D1_174 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_mod_1_D1
    );
  h_cpt_mod_1_D2_PT_0_175 : X_AND2
    port map (
      I0 => h_cpt_mod(0),
      I1 => h_cpt_mod(0),
      O => h_cpt_mod_1_D2_PT_0
    );
  h_cpt_mod_1_D2_176 : X_OR2
    port map (
      I0 => h_cpt_mod_1_D2_PT_0,
      I1 => h_cpt_mod_1_D2_PT_0,
      O => h_cpt_mod_1_D2
    );
  h_cpt_mod_1_D_177 : X_XOR2
    port map (
      I0 => h_cpt_mod_1_D_TFF,
      I1 => h_cpt_mod_1_Q,
      O => h_cpt_mod_1_D
    );
  h_cpt_mod_1_XOR : X_XOR2
    port map (
      I0 => h_cpt_mod_1_D1,
      I1 => h_cpt_mod_1_D2,
      O => h_cpt_mod_1_D_TFF
    );
  h_cpt_mod_2_Q_178 : X_BUF
    port map (
      I => h_cpt_mod_2_Q,
      O => h_cpt_mod(2)
    );
  h_cpt_mod_2_REG : X_FF
    port map (
      I => h_cpt_mod_2_D,
      CE => VCC,
      CLK => h_cpt_mod_2_CLKF,
      SET => GND,
      RST => PRLD,
      O => h_cpt_mod_2_Q
    );
  h_cpt_mod_2_CLKF_PT_0_179 : X_AND4
    port map (
      I0 => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN3,
      O => h_cpt_mod_2_CLKF_PT_0
    );
  h_cpt_mod_2_CLKF_180 : X_OR2
    port map (
      I0 => h_cpt_mod_2_CLKF_PT_0,
      I1 => h_cpt_mod_2_CLKF_PT_0,
      O => h_cpt_mod_2_CLKF
    );
  h_cpt_mod_2_D1_181 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_mod_2_D1
    );
  h_cpt_mod_2_D2_PT_0_182 : X_AND2
    port map (
      I0 => h_cpt_mod(0),
      I1 => h_cpt_mod(1),
      O => h_cpt_mod_2_D2_PT_0
    );
  h_cpt_mod_2_D2_183 : X_OR2
    port map (
      I0 => h_cpt_mod_2_D2_PT_0,
      I1 => h_cpt_mod_2_D2_PT_0,
      O => h_cpt_mod_2_D2
    );
  h_cpt_mod_2_D_184 : X_XOR2
    port map (
      I0 => h_cpt_mod_2_D_TFF,
      I1 => h_cpt_mod_2_Q,
      O => h_cpt_mod_2_D
    );
  h_cpt_mod_2_XOR : X_XOR2
    port map (
      I0 => h_cpt_mod_2_D1,
      I1 => h_cpt_mod_2_D2,
      O => h_cpt_mod_2_D_TFF
    );
  h_cpt_trame_1_Q_185 : X_BUF
    port map (
      I => h_cpt_trame_1_Q,
      O => h_cpt_trame(1)
    );
  h_cpt_trame_1_R_OR_PRLD_186 : X_OR2
    port map (
      I0 => h_cpt_trame_1_RSTF,
      I1 => PRLD,
      O => h_cpt_trame_1_R_OR_PRLD
    );
  h_cpt_trame_1_REG : X_FF
    port map (
      I => h_cpt_trame_1_D,
      CE => VCC,
      CLK => h_cpt_trame_1_CLKF,
      SET => GND,
      RST => h_cpt_trame_1_R_OR_PRLD,
      O => h_cpt_trame_1_Q
    );
  h_cpt_trame_1_CLKF_PT_0_187 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN1,
      O => h_cpt_trame_1_CLKF_PT_0
    );
  h_cpt_trame_1_CLKF_188 : X_OR2
    port map (
      I0 => h_cpt_trame_1_CLKF_PT_0,
      I1 => h_cpt_trame_1_CLKF_PT_0,
      O => h_cpt_trame_1_CLKF
    );
  h_cpt_trame_1_RSTF_PT_0_189 : X_AND2
    port map (
      I0 => N119,
      I1 => N119,
      O => h_cpt_trame_1_RSTF_PT_0
    );
  h_cpt_trame_1_RSTF_190 : X_OR2
    port map (
      I0 => h_cpt_trame_1_RSTF_PT_0,
      I1 => h_cpt_trame_1_RSTF_PT_0,
      O => h_cpt_trame_1_RSTF
    );
  h_cpt_trame_1_D1_191 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_trame_1_D1
    );
  h_cpt_trame_1_D2_PT_0_192 : X_AND2
    port map (
      I0 => h_cpt_trame(0),
      I1 => h_cpt_trame(0),
      O => h_cpt_trame_1_D2_PT_0
    );
  h_cpt_trame_1_D2_193 : X_OR2
    port map (
      I0 => h_cpt_trame_1_D2_PT_0,
      I1 => h_cpt_trame_1_D2_PT_0,
      O => h_cpt_trame_1_D2
    );
  h_cpt_trame_1_D_194 : X_XOR2
    port map (
      I0 => h_cpt_trame_1_D_TFF,
      I1 => h_cpt_trame_1_Q,
      O => h_cpt_trame_1_D
    );
  h_cpt_trame_1_XOR : X_XOR2
    port map (
      I0 => h_cpt_trame_1_D1,
      I1 => h_cpt_trame_1_D2,
      O => h_cpt_trame_1_D_TFF
    );
  h_cpt_trame_2_Q_195 : X_BUF
    port map (
      I => h_cpt_trame_2_Q,
      O => h_cpt_trame(2)
    );
  h_cpt_trame_2_R_OR_PRLD_196 : X_OR2
    port map (
      I0 => h_cpt_trame_2_RSTF,
      I1 => PRLD,
      O => h_cpt_trame_2_R_OR_PRLD
    );
  h_cpt_trame_2_REG : X_FF
    port map (
      I => h_cpt_trame_2_D,
      CE => VCC,
      CLK => h_cpt_trame_2_CLKF,
      SET => GND,
      RST => h_cpt_trame_2_R_OR_PRLD,
      O => h_cpt_trame_2_Q
    );
  h_cpt_trame_2_CLKF_PT_0_197 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN1,
      O => h_cpt_trame_2_CLKF_PT_0
    );
  h_cpt_trame_2_CLKF_198 : X_OR2
    port map (
      I0 => h_cpt_trame_2_CLKF_PT_0,
      I1 => h_cpt_trame_2_CLKF_PT_0,
      O => h_cpt_trame_2_CLKF
    );
  h_cpt_trame_2_RSTF_PT_0_199 : X_AND2
    port map (
      I0 => N119,
      I1 => N119,
      O => h_cpt_trame_2_RSTF_PT_0
    );
  h_cpt_trame_2_RSTF_200 : X_OR2
    port map (
      I0 => h_cpt_trame_2_RSTF_PT_0,
      I1 => h_cpt_trame_2_RSTF_PT_0,
      O => h_cpt_trame_2_RSTF
    );
  h_cpt_trame_2_D1_201 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_trame_2_D1
    );
  h_cpt_trame_2_D2_PT_0_202 : X_AND2
    port map (
      I0 => h_cpt_trame(0),
      I1 => h_cpt_trame(1),
      O => h_cpt_trame_2_D2_PT_0
    );
  h_cpt_trame_2_D2_203 : X_OR2
    port map (
      I0 => h_cpt_trame_2_D2_PT_0,
      I1 => h_cpt_trame_2_D2_PT_0,
      O => h_cpt_trame_2_D2
    );
  h_cpt_trame_2_D_204 : X_XOR2
    port map (
      I0 => h_cpt_trame_2_D_TFF,
      I1 => h_cpt_trame_2_Q,
      O => h_cpt_trame_2_D
    );
  h_cpt_trame_2_XOR : X_XOR2
    port map (
      I0 => h_cpt_trame_2_D1,
      I1 => h_cpt_trame_2_D2,
      O => h_cpt_trame_2_D_TFF
    );
  h_cpt_trame_3_Q_205 : X_BUF
    port map (
      I => h_cpt_trame_3_Q,
      O => h_cpt_trame(3)
    );
  h_cpt_trame_3_R_OR_PRLD_206 : X_OR2
    port map (
      I0 => h_cpt_trame_3_RSTF,
      I1 => PRLD,
      O => h_cpt_trame_3_R_OR_PRLD
    );
  h_cpt_trame_3_REG : X_FF
    port map (
      I => h_cpt_trame_3_D,
      CE => VCC,
      CLK => h_cpt_trame_3_CLKF,
      SET => GND,
      RST => h_cpt_trame_3_R_OR_PRLD,
      O => h_cpt_trame_3_Q
    );
  h_cpt_trame_3_CLKF_PT_0_207 : X_AND2
    port map (
      I0 => NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN1,
      O => h_cpt_trame_3_CLKF_PT_0
    );
  h_cpt_trame_3_CLKF_208 : X_OR2
    port map (
      I0 => h_cpt_trame_3_CLKF_PT_0,
      I1 => h_cpt_trame_3_CLKF_PT_0,
      O => h_cpt_trame_3_CLKF
    );
  h_cpt_trame_3_RSTF_PT_0_209 : X_AND2
    port map (
      I0 => N119,
      I1 => N119,
      O => h_cpt_trame_3_RSTF_PT_0
    );
  h_cpt_trame_3_RSTF_210 : X_OR2
    port map (
      I0 => h_cpt_trame_3_RSTF_PT_0,
      I1 => h_cpt_trame_3_RSTF_PT_0,
      O => h_cpt_trame_3_RSTF
    );
  h_cpt_trame_3_D1_211 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => h_cpt_trame_3_D1
    );
  h_cpt_trame_3_D2_PT_0_212 : X_AND3
    port map (
      I0 => h_cpt_trame(0),
      I1 => h_cpt_trame(1),
      I2 => h_cpt_trame(2),
      O => h_cpt_trame_3_D2_PT_0
    );
  h_cpt_trame_3_D2_213 : X_OR2
    port map (
      I0 => h_cpt_trame_3_D2_PT_0,
      I1 => h_cpt_trame_3_D2_PT_0,
      O => h_cpt_trame_3_D2
    );
  h_cpt_trame_3_D_214 : X_XOR2
    port map (
      I0 => h_cpt_trame_3_D_TFF,
      I1 => h_cpt_trame_3_Q,
      O => h_cpt_trame_3_D
    );
  h_cpt_trame_3_XOR : X_XOR2
    port map (
      I0 => h_cpt_trame_3_D1,
      I1 => h_cpt_trame_3_D2,
      O => h_cpt_trame_3_D_TFF
    );
  tr_I1_I0_215 : X_BUF
    port map (
      I => occupe,
      O => tr_I1_I0
    );
  N122_Q_216 : X_BUF
    port map (
      I => N122_Q,
      O => N122_Q_2
    );
  N122_REG : X_FF
    port map (
      I => N122_D,
      CE => VCC,
      CLK => N122_CLKF,
      SET => GND,
      RST => PRLD,
      O => N122_Q
    );
  N122_CLKF_PT_0_217 : X_AND4
    port map (
      I0 => NlwInverterSignal_N122_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_N122_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_N122_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_N122_CLKF_PT_0_IN3,
      O => N122_CLKF_PT_0
    );
  N122_CLKF_218 : X_OR2
    port map (
      I0 => N122_CLKF_PT_0,
      I1 => N122_CLKF_PT_0,
      O => N122_CLKF
    );
  N122_D1_219 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N122_D1
    );
  N122_D2_PT_0_220 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_N122_D2_PT_0_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(0),
      I20 => NlwInverterSignal_N122_D2_PT_0_IN20,
      I21 => NlwInverterSignal_N122_D2_PT_0_IN21,
      I22 => NlwInverterSignal_N122_D2_PT_0_IN22,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => N122_D2_PT_0
    );
  N122_D2_221 : X_OR2
    port map (
      I0 => N122_D2_PT_0,
      I1 => N122_D2_PT_0,
      O => N122_D2
    );
  N122_XOR : X_XOR2
    port map (
      I0 => N122_D1,
      I1 => N122_D2,
      O => N122_D
    );
  N122_222 : X_BUF
    port map (
      I => N122_Q,
      O => N122
    );
  tim_cpt_ok_0_Q_223 : X_BUF
    port map (
      I => tim_cpt_ok_0_Q,
      O => tim_cpt_ok(0)
    );
  tim_cpt_ok_0_REG : X_FF
    port map (
      I => tim_cpt_ok_0_D,
      CE => VCC,
      CLK => tim_cpt_ok_0_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_ok_0_Q
    );
  tim_cpt_ok_0_CLKF_PT_0_224 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN3,
      O => tim_cpt_ok_0_CLKF_PT_0
    );
  tim_cpt_ok_0_CLKF_225 : X_OR2
    port map (
      I0 => tim_cpt_ok_0_CLKF_PT_0,
      I1 => tim_cpt_ok_0_CLKF_PT_0,
      O => tim_cpt_ok_0_CLKF
    );
  tim_cpt_ok_0_D1_226 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_ok_0_D1
    );
  tim_cpt_ok_0_D2_PT_0_227 : X_AND2
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_0_IN0,
      I1 => N119,
      O => tim_cpt_ok_0_D2_PT_0
    );
  tim_cpt_ok_0_D2_PT_1_228 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN19,
      I20 => tim_cpt_ok(3),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_0_D2_PT_1
    );
  tim_cpt_ok_0_D2_PT_2_229 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN19,
      I20 => tim_cpt_ok(1),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_0_D2_PT_2
    );
  tim_cpt_ok_0_D2_PT_3_230 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN19,
      I20 => tim_cpt_ok(2),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_0_D2_PT_3
    );
  tim_cpt_ok_0_D2_231 : X_OR4
    port map (
      I0 => tim_cpt_ok_0_D2_PT_0,
      I1 => tim_cpt_ok_0_D2_PT_1,
      I2 => tim_cpt_ok_0_D2_PT_2,
      I3 => tim_cpt_ok_0_D2_PT_3,
      O => tim_cpt_ok_0_D2
    );
  tim_cpt_ok_0_XOR : X_XOR2
    port map (
      I0 => tim_cpt_ok_0_D1,
      I1 => tim_cpt_ok_0_D2,
      O => tim_cpt_ok_0_D
    );
  tim_cpt_ok_3_Q_232 : X_BUF
    port map (
      I => tim_cpt_ok_3_Q,
      O => tim_cpt_ok(3)
    );
  tim_cpt_ok_3_REG : X_FF
    port map (
      I => tim_cpt_ok_3_D,
      CE => VCC,
      CLK => tim_cpt_ok_3_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_ok_3_Q
    );
  tim_cpt_ok_3_CLKF_PT_0_233 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN3,
      O => tim_cpt_ok_3_CLKF_PT_0
    );
  tim_cpt_ok_3_CLKF_234 : X_OR2
    port map (
      I0 => tim_cpt_ok_3_CLKF_PT_0,
      I1 => tim_cpt_ok_3_CLKF_PT_0,
      O => tim_cpt_ok_3_CLKF
    );
  tim_cpt_ok_3_D1_235 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_ok_3_D1
    );
  tim_cpt_ok_3_D2_PT_0_236 : X_AND2
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_3_D2_PT_0_IN0,
      I1 => N119,
      O => tim_cpt_ok_3_D2_PT_0
    );
  tim_cpt_ok_3_D2_PT_1_237 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_3_D2_PT_1_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(0),
      I20 => tim_cpt_ok(3),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_3_D2_PT_1
    );
  tim_cpt_ok_3_D2_PT_2_238 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_3_D2_PT_2_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(3),
      I20 => tim_cpt_ok(1),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_3_D2_PT_2
    );
  tim_cpt_ok_3_D2_PT_3_239 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_3_D2_PT_3_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(3),
      I20 => tim_cpt_ok(2),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_3_D2_PT_3
    );
  tim_cpt_ok_3_D2_240 : X_OR4
    port map (
      I0 => tim_cpt_ok_3_D2_PT_0,
      I1 => tim_cpt_ok_3_D2_PT_1,
      I2 => tim_cpt_ok_3_D2_PT_2,
      I3 => tim_cpt_ok_3_D2_PT_3,
      O => tim_cpt_ok_3_D2
    );
  tim_cpt_ok_3_XOR : X_XOR2
    port map (
      I0 => tim_cpt_ok_3_D1,
      I1 => tim_cpt_ok_3_D2,
      O => tim_cpt_ok_3_D
    );
  tim_cpt_ok_1_Q_241 : X_BUF
    port map (
      I => tim_cpt_ok_1_Q,
      O => tim_cpt_ok(1)
    );
  tim_cpt_ok_1_REG : X_FF
    port map (
      I => tim_cpt_ok_1_D,
      CE => VCC,
      CLK => tim_cpt_ok_1_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_ok_1_Q
    );
  tim_cpt_ok_1_CLKF_PT_0_242 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN3,
      O => tim_cpt_ok_1_CLKF_PT_0
    );
  tim_cpt_ok_1_CLKF_243 : X_OR2
    port map (
      I0 => tim_cpt_ok_1_CLKF_PT_0,
      I1 => tim_cpt_ok_1_CLKF_PT_0,
      O => tim_cpt_ok_1_CLKF
    );
  tim_cpt_ok_1_D1_244 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_ok_1_D1
    );
  tim_cpt_ok_1_D2_PT_0_245 : X_AND2
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_0_IN0,
      I1 => N119,
      O => tim_cpt_ok_1_D2_PT_0
    );
  tim_cpt_ok_1_D2_PT_1_246 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_1_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(0),
      I20 => tim_cpt_ok(1),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_1_D2_PT_1
    );
  tim_cpt_ok_1_D2_PT_2_247 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN19,
      I20 => tim_cpt_ok(3),
      I21 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN21,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_1_D2_PT_2
    );
  tim_cpt_ok_1_D2_PT_3_248 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN19,
      I20 => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN20,
      I21 => tim_cpt_ok(2),
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_1_D2_PT_3
    );
  tim_cpt_ok_1_D2_249 : X_OR4
    port map (
      I0 => tim_cpt_ok_1_D2_PT_0,
      I1 => tim_cpt_ok_1_D2_PT_1,
      I2 => tim_cpt_ok_1_D2_PT_2,
      I3 => tim_cpt_ok_1_D2_PT_3,
      O => tim_cpt_ok_1_D2
    );
  tim_cpt_ok_1_XOR : X_XOR2
    port map (
      I0 => tim_cpt_ok_1_D1,
      I1 => tim_cpt_ok_1_D2,
      O => tim_cpt_ok_1_D
    );
  tim_cpt_ok_2_Q_250 : X_BUF
    port map (
      I => tim_cpt_ok_2_Q,
      O => tim_cpt_ok(2)
    );
  tim_cpt_ok_2_REG : X_FF
    port map (
      I => tim_cpt_ok_2_D,
      CE => VCC,
      CLK => tim_cpt_ok_2_CLKF,
      SET => GND,
      RST => PRLD,
      O => tim_cpt_ok_2_Q
    );
  tim_cpt_ok_2_CLKF_PT_0_251 : X_AND4
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN3,
      O => tim_cpt_ok_2_CLKF_PT_0
    );
  tim_cpt_ok_2_CLKF_252 : X_OR2
    port map (
      I0 => tim_cpt_ok_2_CLKF_PT_0,
      I1 => tim_cpt_ok_2_CLKF_PT_0,
      O => tim_cpt_ok_2_CLKF
    );
  tim_cpt_ok_2_D1_253 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tim_cpt_ok_2_D1
    );
  tim_cpt_ok_2_D2_PT_0_254 : X_AND2
    port map (
      I0 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_0_IN0,
      I1 => N119,
      O => tim_cpt_ok_2_D2_PT_0
    );
  tim_cpt_ok_2_D2_PT_1_255 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_1_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(0),
      I20 => tim_cpt_ok(2),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_2_D2_PT_1
    );
  tim_cpt_ok_2_D2_PT_2_256 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_2_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => tim_cpt_ok(1),
      I20 => tim_cpt_ok(2),
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_2_D2_PT_2
    );
  tim_cpt_ok_2_D2_PT_3_257 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN14,
      I15 => N70,
      I16 => N64,
      I17 => N67,
      I18 => N61,
      I19 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN19,
      I20 => tim_cpt_ok(3),
      I21 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN21,
      I22 => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN22,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => tim_cpt_ok_2_D2_PT_3
    );
  tim_cpt_ok_2_D2_258 : X_OR4
    port map (
      I0 => tim_cpt_ok_2_D2_PT_0,
      I1 => tim_cpt_ok_2_D2_PT_1,
      I2 => tim_cpt_ok_2_D2_PT_2,
      I3 => tim_cpt_ok_2_D2_PT_3,
      O => tim_cpt_ok_2_D2
    );
  tim_cpt_ok_2_XOR : X_XOR2
    port map (
      I0 => tim_cpt_ok_2_D1,
      I1 => tim_cpt_ok_2_D2,
      O => tim_cpt_ok_2_D
    );
  tr_cpt_1_Q_259 : X_BUF
    port map (
      I => tr_cpt_1_Q,
      O => tr_cpt(1)
    );
  tr_cpt_1_R_OR_PRLD_260 : X_OR2
    port map (
      I0 => tr_cpt_1_RSTF,
      I1 => PRLD,
      O => tr_cpt_1_R_OR_PRLD
    );
  tr_cpt_1_REG : X_FF
    port map (
      I => tr_cpt_1_D,
      CE => tr_cpt_1_CE,
      CLK => tr_cpt_1_CLKF,
      SET => GND,
      RST => tr_cpt_1_R_OR_PRLD,
      O => tr_cpt_1_Q
    );
  tr_cpt_1_CLKF_PT_0_261 : X_AND4
    port map (
      I0 => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN0,
      I1 => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN1,
      I2 => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN2,
      I3 => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN3,
      O => tr_cpt_1_CLKF_PT_0
    );
  tr_cpt_1_CLKF_262 : X_OR2
    port map (
      I0 => tr_cpt_1_CLKF_PT_0,
      I1 => tr_cpt_1_CLKF_PT_0,
      O => tr_cpt_1_CLKF
    );
  tr_cpt_1_RSTF_PT_0_263 : X_AND2
    port map (
      I0 => NlwInverterSignal_tr_cpt_1_RSTF_PT_0_IN0,
      I1 => N122,
      O => tr_cpt_1_RSTF_PT_0
    );
  tr_cpt_1_RSTF_264 : X_OR2
    port map (
      I0 => tr_cpt_1_RSTF_PT_0,
      I1 => tr_cpt_1_RSTF_PT_0,
      O => tr_cpt_1_RSTF
    );
  tr_cpt_1_CE_PT_0_265 : X_AND2
    port map (
      I0 => N128,
      I1 => N128,
      O => tr_cpt_1_CE_PT_0
    );
  tr_cpt_1_CE_266 : X_OR2
    port map (
      I0 => tr_cpt_1_CE_PT_0,
      I1 => tr_cpt_1_CE_PT_0,
      O => tr_cpt_1_CE
    );
  tr_cpt_1_D1_267 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => tr_cpt_1_D1
    );
  tr_cpt_1_D2_PT_0_268 : X_AND2
    port map (
      I0 => tr_cpt(0),
      I1 => tr_cpt(0),
      O => tr_cpt_1_D2_PT_0
    );
  tr_cpt_1_D2_269 : X_OR2
    port map (
      I0 => tr_cpt_1_D2_PT_0,
      I1 => tr_cpt_1_D2_PT_0,
      O => tr_cpt_1_D2
    );
  tr_cpt_1_D_270 : X_XOR2
    port map (
      I0 => tr_cpt_1_D_TFF,
      I1 => tr_cpt_1_Q,
      O => tr_cpt_1_D
    );
  tr_cpt_1_XOR : X_XOR2
    port map (
      I0 => tr_cpt_1_D1,
      I1 => tr_cpt_1_D2,
      O => tr_cpt_1_D_TFF
    );
  ok_o_271 : X_BUF
    port map (
      I => N119_Q_0,
      O => ok_o
    );
  reception_o_272 : X_BUF
    port map (
      I => N120_Q,
      O => reception_o
    );
  N120_Q_273 : X_BUF
    port map (
      I => N120_Q_3,
      O => N120_Q
    );
  N120_REG : X_BUF
    port map (
      I => N120_D,
      O => N120_Q_3
    );
  N120_D1_274 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N120_D1
    );
  N120_D2_PT_0_275 : X_AND32
    port map (
      I0 => N85,
      I1 => N88,
      I2 => N91,
      I3 => N94,
      I4 => N97,
      I5 => N100,
      I6 => N58,
      I7 => N109,
      I8 => N103,
      I9 => N106,
      I10 => N73,
      I11 => N76,
      I12 => N79,
      I13 => N82,
      I14 => N70,
      I15 => N64,
      I16 => N67,
      I17 => N61,
      I18 => VCC,
      I19 => VCC,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => N120_D2_PT_0
    );
  N120_D2_276 : X_OR2
    port map (
      I0 => N120_D2_PT_0,
      I1 => N120_D2_PT_0,
      O => N120_D2
    );
  N120_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_N120_XOR_IN0,
      I1 => N120_D2,
      O => N120_D
    );
  valide_o_277 : X_BUF
    port map (
      I => N122_Q_2,
      O => valide_o
    );
  trame_278 : X_BUF
    port map (
      I => N137,
      O => trame
    );
  N137_279 : X_BUF
    port map (
      I => N137_Q,
      O => N137
    );
  N137_REG : X_BUF
    port map (
      I => N137_D,
      O => N137_Q
    );
  N137_D1_280 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N137_D1
    );
  N137_D2_PT_0_281 : X_AND3
    port map (
      I0 => NlwInverterSignal_N137_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N137_D2_PT_0_IN1,
      I2 => NlwInverterSignal_N137_D2_PT_0_IN2,
      O => N137_D2_PT_0
    );
  N137_D2_282 : X_OR2
    port map (
      I0 => N137_D2_PT_0,
      I1 => N137_D2_PT_0,
      O => N137_D2
    );
  N137_XOR : X_XOR2
    port map (
      I0 => N137_D1,
      I1 => N137_D2,
      O => N137_D
    );
  NlwInverterBlock_N118_D2_PT_0_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(0),
      O => NlwInverterSignal_N118_D2_PT_0_IN0
    );
  NlwInverterBlock_N118_D2_PT_0_IN1 : X_INV
    port map (
      I => tim_cpt_erreur(1),
      O => NlwInverterSignal_N118_D2_PT_0_IN1
    );
  NlwInverterBlock_N118_D2_PT_0_IN2 : X_INV
    port map (
      I => tim_cpt_erreur(2),
      O => NlwInverterSignal_N118_D2_PT_0_IN2
    );
  NlwInverterBlock_N118_D2_PT_0_IN3 : X_INV
    port map (
      I => tim_cpt_erreur(3),
      O => NlwInverterSignal_N118_D2_PT_0_IN3
    );
  NlwInverterBlock_N118_XOR_IN0 : X_INV
    port map (
      I => N118_D1,
      O => NlwInverterSignal_N118_XOR_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_0_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_0_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_0_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_erreur_0_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_erreur_0_CLKF_PT_0_IN3
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_0_D2_PT_0_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(0),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_0_IN0
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_0_D2_PT_1_IN0 : X_INV
    port map (
      I => Q_OpTx_FX_DC_37_UIM,
      O => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN0
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_0_D2_PT_1_IN1 : X_INV
    port map (
      I => BUF_tim_cpt_erreur_3_UIM,
      O => NlwInverterSignal_BUF_tim_cpt_erreur_0_D2_PT_1_IN1
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_0_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(0),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN0
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_0_IN1 : X_INV
    port map (
      I => tim_cpt_erreur(1),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN1
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_0_IN2 : X_INV
    port map (
      I => tim_cpt_erreur(2),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN2
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_0_IN3 : X_INV
    port map (
      I => tim_cpt_erreur(3),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_0_IN3
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_1_IN14 : X_INV
    port map (
      I => tim_cpt_erreur(3),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN14
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_1_IN19 : X_INV
    port map (
      I => N119,
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_1_IN19
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_2_IN14 : X_INV
    port map (
      I => tim_cpt_erreur(0),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN14
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_2_IN15 : X_INV
    port map (
      I => tim_cpt_erreur(1),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN15
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_2_IN16 : X_INV
    port map (
      I => tim_cpt_erreur(2),
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN16
    );
  NlwInverterBlock_BUF_tim_cpt_erreur_3_D2_PT_2_IN21 : X_INV
    port map (
      I => N119,
      O => NlwInverterSignal_BUF_tim_cpt_erreur_3_D2_PT_2_IN21
    );
  NlwInverterBlock_tim_cpt_erreur_1_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_1_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_1_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_erreur_1_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_erreur_1_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_erreur_1_D2_PT_0_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(1),
      O => NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_1_D2_PT_0_IN1 : X_INV
    port map (
      I => BUF_tim_cpt_erreur_0_UIM,
      O => NlwInverterSignal_tim_cpt_erreur_1_D2_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_1_XOR_IN0 : X_INV
    port map (
      I => tim_cpt_erreur_1_D1,
      O => NlwInverterSignal_tim_cpt_erreur_1_XOR_IN0
    );
  NlwInverterBlock_h_cpt_timer_0_D2_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_timer_0_D2_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_timer_0_D2_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_2_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_2_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_2_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_erreur_2_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_erreur_2_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_erreur_2_D2_PT_0_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(1),
      O => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_2_D2_PT_1_IN0 : X_INV
    port map (
      I => tim_cpt_erreur(2),
      O => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_2_D2_PT_1_IN2 : X_INV
    port map (
      I => Q_OpTx_FX_DC_37_UIM,
      O => NlwInverterSignal_tim_cpt_erreur_2_D2_PT_1_IN2
    );
  NlwInverterBlock_tim_cpt_erreur_3_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_erreur_3_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_erreur_3_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_erreur_3_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_erreur_3_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_erreur_3_XOR_IN0 : X_INV
    port map (
      I => tim_cpt_erreur_3_D1,
      O => NlwInverterSignal_tim_cpt_erreur_3_XOR_IN0
    );
  NlwInverterBlock_N119_D2_PT_2_IN15 : X_INV
    port map (
      I => N64,
      O => NlwInverterSignal_N119_D2_PT_2_IN15
    );
  NlwInverterBlock_N119_D2_PT_3_IN13 : X_INV
    port map (
      I => N70,
      O => NlwInverterSignal_N119_D2_PT_3_IN13
    );
  NlwInverterBlock_N119_D2_PT_4_IN6 : X_INV
    port map (
      I => N58,
      O => NlwInverterSignal_N119_D2_PT_4_IN6
    );
  NlwInverterBlock_N119_D2_PT_5_IN6 : X_INV
    port map (
      I => N109,
      O => NlwInverterSignal_N119_D2_PT_5_IN6
    );
  NlwInverterBlock_N119_D2_PT_6_IN1 : X_INV
    port map (
      I => N91,
      O => NlwInverterSignal_N119_D2_PT_6_IN1
    );
  NlwInverterBlock_EXP5_EXP_PT_1_IN11 : X_INV
    port map (
      I => N79,
      O => NlwInverterSignal_EXP5_EXP_PT_1_IN11
    );
  NlwInverterBlock_EXP5_EXP_PT_2_IN10 : X_INV
    port map (
      I => N73,
      O => NlwInverterSignal_EXP5_EXP_PT_2_IN10
    );
  NlwInverterBlock_EXP5_EXP_PT_3_IN7 : X_INV
    port map (
      I => N106,
      O => NlwInverterSignal_EXP5_EXP_PT_3_IN7
    );
  NlwInverterBlock_EXP5_EXP_PT_4_IN4 : X_INV
    port map (
      I => N100,
      O => NlwInverterSignal_EXP5_EXP_PT_4_IN4
    );
  NlwInverterBlock_EXP5_EXP_PT_5_IN3 : X_INV
    port map (
      I => N97,
      O => NlwInverterSignal_EXP5_EXP_PT_5_IN3
    );
  NlwInverterBlock_EXP4_EXP_PT_0_IN15 : X_INV
    port map (
      I => N61,
      O => NlwInverterSignal_EXP4_EXP_PT_0_IN15
    );
  NlwInverterBlock_EXP4_EXP_PT_1_IN0 : X_INV
    port map (
      I => N85,
      O => NlwInverterSignal_EXP4_EXP_PT_1_IN0
    );
  NlwInverterBlock_EXP6_EXP_PT_1_IN14 : X_INV
    port map (
      I => N67,
      O => NlwInverterSignal_EXP6_EXP_PT_1_IN14
    );
  NlwInverterBlock_EXP6_EXP_PT_2_IN10 : X_INV
    port map (
      I => N76,
      O => NlwInverterSignal_EXP6_EXP_PT_2_IN10
    );
  NlwInverterBlock_EXP6_EXP_PT_3_IN7 : X_INV
    port map (
      I => N103,
      O => NlwInverterSignal_EXP6_EXP_PT_3_IN7
    );
  NlwInverterBlock_EXP6_EXP_PT_4_IN2 : X_INV
    port map (
      I => N94,
      O => NlwInverterSignal_EXP6_EXP_PT_4_IN2
    );
  NlwInverterBlock_EXP6_EXP_PT_5_IN0 : X_INV
    port map (
      I => N88,
      O => NlwInverterSignal_EXP6_EXP_PT_5_IN0
    );
  NlwInverterBlock_EXP7_EXP_PT_0_IN12 : X_INV
    port map (
      I => N82,
      O => NlwInverterSignal_EXP7_EXP_PT_0_IN12
    );
  NlwInverterBlock_N130_XOR_IN0 : X_INV
    port map (
      I => N130_D1,
      O => NlwInverterSignal_N130_XOR_IN0
    );
  NlwInverterBlock_tr_cpt_0_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_trame(0),
      O => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tr_cpt_0_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_trame(1),
      O => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tr_cpt_0_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_trame(2),
      O => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tr_cpt_0_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_trame(3),
      O => NlwInverterSignal_tr_cpt_0_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tr_cpt_0_RSTF_PT_0_IN0 : X_INV
    port map (
      I => tr_I1_I0,
      O => NlwInverterSignal_tr_cpt_0_RSTF_PT_0_IN0
    );
  NlwInverterBlock_tr_cpt_0_D2_PT_0_IN0 : X_INV
    port map (
      I => tr_cpt(0),
      O => NlwInverterSignal_tr_cpt_0_D2_PT_0_IN0
    );
  NlwInverterBlock_tr_cpt_0_D2_PT_0_IN1 : X_INV
    port map (
      I => tr_cpt(0),
      O => NlwInverterSignal_tr_cpt_0_D2_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_trame_0_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_trame_0_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_mod(4),
      O => NlwInverterSignal_h_cpt_trame_0_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_trame_0_D2_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_trame(0),
      O => NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_trame_0_D2_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_trame(0),
      O => NlwInverterSignal_h_cpt_trame_0_D2_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_3_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_3_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_3_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_3_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_h_cpt_mod_3_CLKF_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_mod_0_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_0_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_0_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_0_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_h_cpt_mod_0_CLKF_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_mod_0_D2_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_0_D2_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_mod(0),
      O => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_0_D2_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_mod(1),
      O => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_mod_0_D2_PT_0_IN4 : X_INV
    port map (
      I => h_cpt_mod(2),
      O => NlwInverterSignal_h_cpt_mod_0_D2_PT_0_IN4
    );
  NlwInverterBlock_h_cpt_mod_0_XOR_IN0 : X_INV
    port map (
      I => h_cpt_mod_0_D1,
      O => NlwInverterSignal_h_cpt_mod_0_XOR_IN0
    );
  NlwInverterBlock_h_cpt_mod_4_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_4_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_4_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_4_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_h_cpt_mod_4_CLKF_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_mod_4_D2_PT_1_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN0
    );
  NlwInverterBlock_h_cpt_mod_4_D2_PT_1_IN2 : X_INV
    port map (
      I => h_cpt_mod(0),
      O => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN2
    );
  NlwInverterBlock_h_cpt_mod_4_D2_PT_1_IN3 : X_INV
    port map (
      I => h_cpt_mod(1),
      O => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN3
    );
  NlwInverterBlock_h_cpt_mod_4_D2_PT_1_IN4 : X_INV
    port map (
      I => h_cpt_mod(2),
      O => NlwInverterSignal_h_cpt_mod_4_D2_PT_1_IN4
    );
  NlwInverterBlock_h_cpt_mod_1_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_1_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_1_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_1_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_h_cpt_mod_1_CLKF_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_mod_2_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_mod_2_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_mod_2_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN2
    );
  NlwInverterBlock_h_cpt_mod_2_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_h_cpt_mod_2_CLKF_PT_0_IN3
    );
  NlwInverterBlock_h_cpt_trame_1_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_trame_1_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_mod(4),
      O => NlwInverterSignal_h_cpt_trame_1_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_trame_2_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_trame_2_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_mod(4),
      O => NlwInverterSignal_h_cpt_trame_2_CLKF_PT_0_IN1
    );
  NlwInverterBlock_h_cpt_trame_3_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN0
    );
  NlwInverterBlock_h_cpt_trame_3_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_mod(4),
      O => NlwInverterSignal_h_cpt_trame_3_CLKF_PT_0_IN1
    );
  NlwInverterBlock_N122_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_N122_CLKF_PT_0_IN0
    );
  NlwInverterBlock_N122_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_N122_CLKF_PT_0_IN1
    );
  NlwInverterBlock_N122_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_N122_CLKF_PT_0_IN2
    );
  NlwInverterBlock_N122_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_N122_CLKF_PT_0_IN3
    );
  NlwInverterBlock_N122_D2_PT_0_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_N122_D2_PT_0_IN14
    );
  NlwInverterBlock_N122_D2_PT_0_IN20 : X_INV
    port map (
      I => tim_cpt_ok(3),
      O => NlwInverterSignal_N122_D2_PT_0_IN20
    );
  NlwInverterBlock_N122_D2_PT_0_IN21 : X_INV
    port map (
      I => tim_cpt_ok(1),
      O => NlwInverterSignal_N122_D2_PT_0_IN21
    );
  NlwInverterBlock_N122_D2_PT_0_IN22 : X_INV
    port map (
      I => tim_cpt_ok(2),
      O => NlwInverterSignal_N122_D2_PT_0_IN22
    );
  NlwInverterBlock_tim_cpt_ok_0_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_0_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_ok_0_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_ok_0_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_ok_0_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_0_IN0 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_1_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN14
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_1_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_1_IN19
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_2_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN14
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_2_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_2_IN19
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_3_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN14
    );
  NlwInverterBlock_tim_cpt_ok_0_D2_PT_3_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_0_D2_PT_3_IN19
    );
  NlwInverterBlock_tim_cpt_ok_3_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_3_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_ok_3_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_ok_3_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_ok_3_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_ok_3_D2_PT_0_IN0 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_3_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_3_D2_PT_1_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_3_D2_PT_1_IN14
    );
  NlwInverterBlock_tim_cpt_ok_3_D2_PT_2_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_3_D2_PT_2_IN14
    );
  NlwInverterBlock_tim_cpt_ok_3_D2_PT_3_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_3_D2_PT_3_IN14
    );
  NlwInverterBlock_tim_cpt_ok_1_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_1_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_ok_1_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_ok_1_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_ok_1_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_0_IN0 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_1_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_1_IN14
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_2_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN14
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_2_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN19
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_2_IN21 : X_INV
    port map (
      I => tim_cpt_ok(1),
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_2_IN21
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_3_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN14
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_3_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN19
    );
  NlwInverterBlock_tim_cpt_ok_1_D2_PT_3_IN20 : X_INV
    port map (
      I => tim_cpt_ok(1),
      O => NlwInverterSignal_tim_cpt_ok_1_D2_PT_3_IN20
    );
  NlwInverterBlock_tim_cpt_ok_2_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_timer(0),
      O => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_2_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_timer(1),
      O => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tim_cpt_ok_2_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_timer(2),
      O => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tim_cpt_ok_2_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_timer(3),
      O => NlwInverterSignal_tim_cpt_ok_2_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_0_IN0 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_0_IN0
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_1_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_1_IN14
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_2_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_2_IN14
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_3_IN14 : X_INV
    port map (
      I => N118_UIM,
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN14
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_3_IN19 : X_INV
    port map (
      I => tim_cpt_ok(0),
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN19
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_3_IN21 : X_INV
    port map (
      I => tim_cpt_ok(1),
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN21
    );
  NlwInverterBlock_tim_cpt_ok_2_D2_PT_3_IN22 : X_INV
    port map (
      I => tim_cpt_ok(2),
      O => NlwInverterSignal_tim_cpt_ok_2_D2_PT_3_IN22
    );
  NlwInverterBlock_tr_cpt_1_CLKF_PT_0_IN0 : X_INV
    port map (
      I => h_cpt_trame(0),
      O => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN0
    );
  NlwInverterBlock_tr_cpt_1_CLKF_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_trame(1),
      O => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN1
    );
  NlwInverterBlock_tr_cpt_1_CLKF_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_trame(2),
      O => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN2
    );
  NlwInverterBlock_tr_cpt_1_CLKF_PT_0_IN3 : X_INV
    port map (
      I => h_cpt_trame(3),
      O => NlwInverterSignal_tr_cpt_1_CLKF_PT_0_IN3
    );
  NlwInverterBlock_tr_cpt_1_RSTF_PT_0_IN0 : X_INV
    port map (
      I => tr_I1_I0,
      O => NlwInverterSignal_tr_cpt_1_RSTF_PT_0_IN0
    );
  NlwInverterBlock_N120_XOR_IN0 : X_INV
    port map (
      I => N120_D1,
      O => NlwInverterSignal_N120_XOR_IN0
    );
  NlwInverterBlock_N137_D2_PT_0_IN0 : X_INV
    port map (
      I => tr_cpt(0),
      O => NlwInverterSignal_N137_D2_PT_0_IN0
    );
  NlwInverterBlock_N137_D2_PT_0_IN1 : X_INV
    port map (
      I => h_cpt_mod(3),
      O => NlwInverterSignal_N137_D2_PT_0_IN1
    );
  NlwInverterBlock_N137_D2_PT_0_IN2 : X_INV
    port map (
      I => h_cpt_mod(4),
      O => NlwInverterSignal_N137_D2_PT_0_IN2
    );
  NlwBlockROC : ROC generic map ( WIDTH => 100 ns)
     port map (O => PRLD);
end Structure;

