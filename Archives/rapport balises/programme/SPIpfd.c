// Commandes en reception : 60-6F
// Commandes en emission  : 70-7F

#include "global.h"
#include "SPIpfd.h"

#define NB_COMMANDES_A_FILTRER 4

 
////////////////////////////////////////
// ADRESSES DES COMMANDES
////////////////////////////////////////

#define ADD_DEMANDE_STATUT 0x60
#define ADD_DEMANDE_POSITION_BALISE 0x61

#define ADD_RETOUR_STATUT 0x70
#define ADD_RETOUR_POSITION_BALISE 0x71

////////////////////////////////////////
// COMMANDES A EXECUTER APRES RECEPTION 
////////////////////////////////////////


void envoieStatut(void)
{
  if ( RC_taille != 0 )
    return;

  EM(ADD_RETOUR_STATUT,1,&statut);
}
 
void envoiePos(void)
{
  if ( RC_taille != 0 )
    return;

  EM(ADD_RETOUR_POSITION_BALISE,sizeof(position),(char *)&pos);
}

////////////////////////////////////////
// TRAITEMENT DE LA RECEPTION
////////////////////////////////////////

void traitement_RC(void)
{
  
  if (( RC_commande < 0x60 ) || ( RC_commande > 0x6F))
    return;

  switch(RC_commande)
    {
    case ADD_DEMANDE_STATUT : envoieStatut(); break;  // 
    case ADD_DEMANDE_POSITION_BALISE : envoiePos(); break;  // 
    }
}

/////////////////////////////////////////
// COMMANDES A ENVOYER A LA CARTE MERE
/////////////////////////////////////////







