#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

struct info{

    char nome[30];
    char secNome[30];
    char cognome[30];
};

struct utente{

    int num;
    struct info informazioni;

};

void inserimento(struct utente u[]){

    for (int i = 0; i < 5; ++i) {
        printf("Inserire il nome\n");
        scanf("%s", u[i].informazioni.nome);
        printf("Inserire secondo nome\n");
        scanf("%s", u[i].informazioni.secNome);
        printf("Inserire il cognome\n");
        scanf("%s", u[i].informazioni.cognome);
        u[i].num = rand() % 10001;
    }
}

void stampa(struct utente u[]){

    printf("Stamap con valori passati per parametro\n");
    for(int i = 0; i < 5; i++){
        printf("L'utente %d ha nome %s, cognome %s, secondo nome %s e numero %d\n", i, u[i].informazioni.nome, u[i].informazioni.cognome, u[i].informazioni.secNome, u[i].num);
    }
}

void Pstampa(struct utente *u){

    printf("Stamap con valori passati per riferimento\n");
    for(int i = 0; i < 5; i++){
        printf("L'utente %d ha nome %s, cognome %s, secondo nome %s e numero %d\n", i, (u + i)->informazioni.nome,
               (u + i)->informazioni.cognome, (u + i)->informazioni.secNome, (u + i)->num);
    }
}

int main(){

    struct utente utenti[5];

    srand(time(NULL));

    inserimento(utenti);

    struct utente *Putente = (struct utente*) malloc(5 * sizeof(struct utente));
    Putente = &utenti[0];

    stampa(utenti);

    Pstampa(Putente);

    free(Putente);
}