#ifndef _PFD_
#define _PFD_

typedef struct position 
{
  s16 x;
  s16 y;
  s16 a;
} position;

extern position pos;
extern u08 statut;

//#define MASTER
#define NB_BITS_SELEC 2 // nombre de bits reserves sur le port B pour la selection des esclaves
#define DELAY_MASTER 255 // temps d'attente du maitre pour attendre l'esclave

// pour les tests:
//#define BCLE_LOCALE // en maitre, le recepteur recoit en miroir tout ce qui est emis localement SEULEMENT
//#define AFFICH_RC // affiche a la reception les donnees recues sous forme de chaine


void traitement_RC(void); // executee apres reception

// tailles des tampons !ne jamais faire de transmissions avec une taille superieure aux tampons
#define T_TAMPON_EM 16 // 255max
#define T_TAMPON_RC 16 // 255max


extern volatile u08 reg_RC[T_TAMPON_RC+3]; // les donnees sont ici
#define RC_commande (reg_RC[1])
#define RC_taille (reg_RC[2])
#define RC_donnees (reg_RC + 3)



#ifdef MASTER
void EM(u08 adrCarte, u08 adresse, u08 taille, u08* donnees); // si l emission precedante n est pas terimee, il y a une boucle....(verifier si on est critique en temps)
void EMGenerique( u08 adrCarte, u08 adresse, u08 taille, ...);
#else
void EM(u08 adresse, u08 taille, u08* donnees); // si l emission precedante n est pas terimee, il y a une boucle....(verifier si on est critique en temps)
void EMGenerique( u08 adresse, u08 taille, ...);
#endif



void initSPI(void);

#endif
