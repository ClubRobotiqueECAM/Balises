#include "global.h"
#ifdef GCC33
#include <avr/eeprom.h>
#define typeAdr void *
#else
#include <eeprom.h>
#define typeAdr unsigned int
#endif




void eeprom_ww(u16 addr, u16 val) // fonction d'ecriture d un mot de 16 bits, n etait pas implementee
{
  while( ! eeprom_is_ready() ) {};
  eeprom_wb(addr, extr16_08_0(val) ); // poids faible
  while( ! eeprom_is_ready() ) {};
  eeprom_wb(addr +1 , extr16_08_1(val) ); // poids fort
}



u32 eeprom_r32(u16 addr)
{
  u32 sortie;//=0;
  /*
  while( ! eeprom_is_ready() ) {};
  extr32_16_1(sortie) = eeprom_rw(addr + 2);
  while( ! eeprom_is_ready() ) {};
  extr32_16_0(sortie) = eeprom_rw(addr);*/

  eeprom_read_block(&sortie, (typeAdr)addr, 4);
  return(sortie);
}
u32 eeprom_r24(u16 addr)
{
  u32 sortie=0;
  /*
  while( ! eeprom_is_ready() ) {};
  extr32_16_1(sortie) = eeprom_rw(addr + 2);
  while( ! eeprom_is_ready() ) {};
  extr32_16_0(sortie) = eeprom_rw(addr);*/
  
  eeprom_read_block(&sortie +1, (typeAdr)addr, 3);
  return(sortie);
}
































