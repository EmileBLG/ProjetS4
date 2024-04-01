#include <stdio.h>
#include <time.h>
#include <Windows.h>
#include <stdbool.h>
#include "flappy.h"


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
int etatBouton = 0;

// pour windows.h
int matrix[ROWS][COLS];

//pour windows.h
int etatBarreEspace() {
    short etatTouche = GetAsyncKeyState(VK_SPACE);
    if (etatTouche & 0x8000) {
        return 1; 
    }
    else {
        return 0; 
    }
}
//pour windows.h
void printItAll(int flappyY) {

    COORD coord = { 0, 0 };
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleCursorPosition(hConsole, coord);
    HANDLE consoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_CURSOR_INFO cursorInfo;
    GetConsoleCursorInfo(consoleHandle, &cursorInfo);
    cursorInfo.bVisible = FALSE; // Cacher le curseur
    SetConsoleCursorInfo(consoleHandle, &cursorInfo);


    for (int i = 0; i < ROWS; i++)
        for (int j = 0; j < COLS; j++)
            matrix[i][j] = 0;

    //dessiner flappy a X = 240 'a 320
    if (flappyY >= 0 && flappyY <= ROWS - SIZE_FLAPPY/10)
        for (int i = flappyY; i < flappyY + SIZE_FLAPPY/10; i++)
            for (int j = 0; j < SIZE_FLAPPY/10; j++)
                matrix[i][j + 28] = 1;

    for (int k = 0; k < NB_TUYAUX; k++)
        for (int i = tuyauxY[k] / 10; i < tuyauxY[k] / 10 + HAUTEUR_TUYAUX/10; i++)
            for (int j = tuyauxX[k] / 10; j < tuyauxX[k] / 10 + LARGEUR_TUYAUX/10; j++){
                int iMod = i % (GRILLE/10);
                int jMod = j % (GRILLE/10);
                if(iMod <= 36 && iMod >= 0 && jMod < 64 && jMod > 0)
                    matrix[iMod][jMod] = 4;
            }

    // Print the matrix
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            printf("%d", matrix[i][j]);
        }
        printf("\n");
    }


}


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


    

int main() {
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
            //pour windows.h
            etatBouton = etatBarreEspace();


            genererDeplacementBackground(&BackgroundX);
            genererDeplacementYflappy(&flappyY, &etatBouton, &vitesseFlappyY);
            gameOn = controleDePartie(tuyauxX, &flappyY);

            last_frame_time = current_time;

            //pour windows.h
            printItAll(flappyY/10);
            //Prints degueulasse
            //printf("background : %04d\n", BackgroundX);
            //printf("hauteur flappy : %04d\n", flappyY);
            //printf("bouton : %04d\n", etatBouton);


        }
        //Tester si le jeu fonctionne bien 'a 60Hz:
        //else{ printf("pas60 : %04d\n", flappyY); }
    }

    return 0;
}
