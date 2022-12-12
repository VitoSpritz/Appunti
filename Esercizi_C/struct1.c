#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

struct data{
    int giorno;
    char mese[20];
    int anno;
};

void controlloMese(struct data c){

    int count = 0, alpha = 0;
    for (int i = 0; c.mese[i] != '\0'; ++i) {
        count++;
        if(isalpha(c.mese[i]))
            alpha++;
    }

    int cgiorni = 0;
    int mese = 0;

    if(alpha == 0){

        mese = atoi(c.mese);
        if(mese == 1){
            printf("I giorni totali dal %d/%s/%d sono: %d", c.giorno, c.mese, c.anno, c.giorno);
            return;
        }
        else {
            cgiorni = c.giorno;
            mese--;
            do {

                if (mese == 11 || mese == 4 || mese == 6 || mese == 9)
                    cgiorni += 30;
                else if (mese == 2 && ((c.anno % 4) == 0 || (c.anno % 100) == 0 || (c.anno % 400) == 0))
                    cgiorni += 29;
                else if (mese == 2)
                    cgiorni += 28;
                else
                    cgiorni += 31;
                mese--;

            } while (mese > 0);
        }
        printf("I giorni totali dal %d/%s/%d sono: %d", c.giorno, c.mese, c.anno, cgiorni);

    }else{

        char Smese[20];

        for (int i = 0; i < 19; ++i) {
                Smese[i] = tolower(c.mese[i]);
        }
        Smese[20] = '\0';

        printf("\n%s\n", Smese);

        if(strcmp(Smese, "gennaio") == 0){
            mese = 1;
        }
        if(strcmp(Smese, "febbraio") == 0){
            mese = 2;
        }
        if(strcmp(Smese, "marzo") == 0){
            mese = 3;
        }
        if(strcmp(Smese, "aprile") == 0){
            mese = 4;
        }
        if(strcmp(Smese, "maggio") == 0){
            mese = 5;
        }
        if(strcmp(Smese, "giugno") == 0){
            mese = 6;
        }
        if(strcmp(Smese, "luglio") == 0){
            mese = 7;
        }
        if(strcmp(Smese, "agosto") == 0){
            mese = 8;
        }
        if(strcmp(Smese, "settembre") == 0){
            mese = 9;
        }
        if(strcmp(Smese, "ottobre") == 0){
            mese = 10;
        }
        if(strcmp(Smese, "novembre") == 0){
            mese = 11;
        }
        if(strcmp(Smese, "dicembre") == 0){
            mese = 12;
        }

        printf("\nIl valore del mese da stringa a intero e': %d\n", mese);
        if(mese == 1){
            printf("I giorni totali dal %d/%s/%d sono: %d", c.giorno, c.mese, c.anno, c.giorno);
            return;
        }
        else {
            cgiorni = c.giorno;
            mese--;
            do {

                if (mese == 11 || mese == 4 || mese == 6 || mese == 9)
                    cgiorni += 30;
                else if (mese == 2 && ((c.anno % 4) == 0 || (c.anno % 100) == 0 || (c.anno % 400) == 0))
                    cgiorni += 29;
                else if (mese == 2)
                    cgiorni += 28;
                else
                    cgiorni += 31;
                mese--;

            } while (mese > 0);
        }
        printf("I giorni totali dal %d/%s/%d sono: %d", c.giorno, c.mese, c.anno, cgiorni);
    }
}

int main() {

    struct data calendario;
    do {
        printf("Inserire il giorno\n");
        scanf("%d", &calendario.giorno);
        printf("Inserire il mese\n");
        scanf("%s", calendario.mese);
        printf("Inserire l'anno\n");
        scanf("%d", &calendario.anno);

    }while((calendario.giorno > 31 || calendario.giorno < 0) || calendario.anno < 0);

    controlloMese(calendario);

    return 0;
}
