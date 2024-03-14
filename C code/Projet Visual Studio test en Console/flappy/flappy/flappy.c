#include <stdio.h>
#include <time.h>
#include <Windows.h>
#include <stdbool.h>
#include "flappy.h"


//Tout en variable Local, pcq idk comment l'API va fonctionner.
//OUT VERS LE PPU:
int BackgroundX = 0;
int BackgroundY = 0;
int flappyX = 0;
int flappyY = 180;

int tuyauxX[NBTUYAUX] = { 500, 500, 800, 800};

int tuyauxY[NBTUYAUX] = { 900, 300, 990, 350};

int image_debut_fin_partieX = 0;
int image_debut_fin_partieY = 0;

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


    if (flappyY >= 0 && flappyY <= ROWS - 8)
        for (int i = flappyY; i < flappyY + 8; i++)
            for (int j = 0; j < 8; j++)
                matrix[i][j + 24] = 1;

    for (int k = 0; k < NBTUYAUX; k++)
        for (int i = tuyauxY[k] / 10; i < tuyauxY[k] / 10 + 18; i++)
            for (int j = tuyauxX[k] / 10; j < tuyauxX[k] / 10 + 5; j++){
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
    
    

    for (int i = 0; i < NBTUYAUX; i++)
        if (tuyauxX[i] <= 0)
            tuyauxX[i] = GRILLE;
        else
            tuyauxX[i] -= 8;

    if (tuyauxX[0] >= 300 && tuyauxX[0] <= 360) {
        if (*flappyY >= tuyauxY[0])
            return 0;
    }
    return 1;
}


void genererDeplacementYflappy(int *flappyY, int *etatBouton, float *vitesseFlappyY) {
    const int hauteurMax = 360-80; // Hauteur maximale du Flappy Bird (nb pixelY - grosseurY du flappy)

    if (*etatBouton == 1) {
        *vitesseFlappyY = -4; // Simuler un saut
    }
    *flappyY += *vitesseFlappyY;
    *vitesseFlappyY += 0.2;
    

    // Limiter la position du Flappy Bird entre 0 et la hauteur maximale
    if (*flappyY < 0) {
        *flappyY = 0;
    }
    if (*flappyY > hauteurMax) {
        *flappyY = hauteurMax;
    }
}


    

int main() {
    const double target_frame_time_ms = 16.6;
    const clock_t target_frame_ticks = (clock_t)(target_frame_time_ms * CLOCKS_PER_SEC / 1000.0);
    
    clock_t last_frame_time = clock();
    float vitesseFlappyY = 2;
    int gameOn = 1;
    while (gameOn = 1) {
        clock_t current_time = clock();
        clock_t elapsed_time_ticks = current_time - last_frame_time;

        if (elapsed_time_ticks >= target_frame_ticks) {
            //Jeu ICI
            genererDeplacementBackground(&BackgroundX);
            etatBouton = etatBarreEspace();
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
