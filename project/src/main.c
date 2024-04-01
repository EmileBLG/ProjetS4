#include "scaler.h"
#include "vdma.h"
#include "xil_printf.h"
#include "myColorRegister.h"
#include "sleep.h"
#include "time.h"
#include "main.h"
#include "stdbool.h"

//Tout en variable Local, pcq idk comment l'API va fonctionner.
//OUT VERS LE PPU:
unsigned short int BackgroundX = 0;
unsigned short int BackgroundY = 0;
unsigned short int flappyX = 0;
unsigned short int flappyY = 180;
unsigned int tuyauxX[NB_TUYAUX] = { 500, 500, 800, 800 };
unsigned int tuyauxY[NB_TUYAUX] = { 900, 300, 990, 350 };
bool flappyMonte = 0;



//IN DE LA MANETTE
bool etatBouton = 0;

void genererDeplacementBackground(int *BackgroundX) {
    if(*BackgroundX >= GRILLE)
        *BackgroundX = 0;
    else
        *BackgroundX += 8;
}

int controleDePartie(int* tuyauxX, int* flappyY) {



    for (int i = 0; i < NB_TUYAUX; i++) {
        if (tuyauxX[i] <= 0)
            tuyauxX[i] = GRILLE;
        else
            tuyauxX[i] -= 8;

        if (tuyauxX[i] >= LARGEUR_ECRAN/2 - LARGEUR_TUYAUX && tuyauxX[i] <= LARGEUR_ECRAN/2) {
            int PosTuyauxHigh = (tuyauxY[i] + HAUTEUR_TUYAUX)% GRILLE;
            int PosTuyauxLow = tuyauxY[i];

            if (PosTuyauxLow > PosTuyauxHigh)
                PosTuyauxLow = 0;
            if ( *flappyY >= PosTuyauxLow)
                if(*flappyY <= PosTuyauxHigh)
                    return 0;
            if (*flappyY + SIZE_FLAPPY >= PosTuyauxLow)
                if(*flappyY + SIZE_FLAPPY <= PosTuyauxHigh)
                    return 0;
        }
    }
    return 1;
}


void genererDeplacementYflappy(int *flappyY, int *etatBouton, float *vitesseFlappyY) {
    const int hauteurMin = HAUTEUR_ECRAN - SIZE_FLAPPY; // Hauteur max du Flappy Bird (vers le bas) (nb pixelY - grosseurY du flappy)

    if (*etatBouton == 1) {
        *vitesseFlappyY = PUISSANCE_SAUT; // Simuler un saut
    }
    *flappyY += *vitesseFlappyY;
    *vitesseFlappyY += GRAVITE;


    // Limiter la position du Flappy Bird entre 0 et la hauteur maximale
    if (*flappyY < 0) {
        *flappyY = 0;
    }
    if (*flappyY > hauteurMin) {
        *flappyY = hauteurMin;
    }
}


int main()
{
	configureScaler();
    configureVdma();

    int colorA = 0;
    int colorB = 0xFF;
    MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 4, colorB);


    //CODE AJOUTE PAR ETIENNE
    const double target_frame_time_ms = 16.6;
    const clock_t target_frame_ticks = (clock_t)(target_frame_time_ms * CLOCKS_PER_SEC / 1000.0);

    clock_t last_frame_time = clock();
    float vitesseFlappyY = VITESSE_FLAPPY_Y_INIT;
    int gameOn = 1;
    while (gameOn) {
        clock_t current_time = clock();
        clock_t elapsed_time_ticks = current_time - last_frame_time;

        if (elapsed_time_ticks >= target_frame_ticks) {
            //Jeu ICI



            genererDeplacementBackground(&BackgroundX);
            genererDeplacementYflappy(&flappyY, &etatBouton, &vitesseFlappyY);
            gameOn = controleDePartie(tuyauxX, &flappyY);

            last_frame_time = current_time;
        }


    }
    //fin code ajoute par Etienne




    while(1)
    {
		MYCOLORREGISTER_mWriteReg(XPAR_MYCOLORREGISTER_0_S00_AXI_BASEADDR, 0, colorA );
		//MYCONTROLLERPPU_mWriteReg(XPAR_MYCONTROLLLERPPU_0_S00_AXI_BASEADDR, 0, instruction);
		colorA = colorA + 1024;
		sleep(1);
    }

    return 0;
}


