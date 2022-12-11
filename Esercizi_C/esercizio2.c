#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct structEsame{

    char nomeCognome[70];
    char dataNascita[20];
    char nTessera[12];
    int idEsame;
    char dataEsame[20];
    struct structEsame *next;
};

struct structEsame *current = NULL;
struct structEsame *first = NULL;

void inserisciTesta(){

    struct structEsame *link = (struct structEsame*) malloc(sizeof (struct structEsame));

    printf("Inserire il nome e il cognome\n");
    scanf("%[^\n]s", link->nomeCognome);
    fflush(stdin);

    printf("Inserire la data di nascita con il formato dd/mm/yy\n");
    scanf("%s", link->dataNascita);
    fflush(stdin);

    printf("Inserire il numero di tessera\n");
    scanf("%s", link->nTessera);
    fflush(stdin);

    printf("Inserire l'id esame\n");
    scanf("%d", &link->idEsame);

    printf("Inserire la data dell'esame con formato dd/mm/yy\n");
    scanf("%s", link->dataEsame);
    fflush(stdin);

    link->next = first;

    first = link;

}

void stampa(){

    struct structEsame *ptr = first;
    printf("\n");

    while(ptr != NULL){
        printf("I valori sono:\n");
        printf("Nome: %s\n", ptr->nomeCognome);
        printf("Data di nascita: %s\n", ptr->dataNascita);
        printf("Numero di tessera: %s\n", ptr->nTessera);
        printf("Id esame: %d\n", ptr->idEsame);
        printf("Data esame: %s\n", ptr->dataEsame);
        ptr = ptr->next;
    }
}

void cercaEsame(char t[]){

    struct structEsame *temp = first;

    while(strcmp(temp->nTessera, t) != 0){

        first = first->next;
    }
    if(strcmp(temp->nTessera, t) == 0){
        printf("I valori sono:\n");
        printf("Nome: %s\n", temp->nomeCognome);
        printf("Data di nascita: %s\n", temp->dataNascita);
        printf("Numero di tessera: %s\n", temp->nTessera);
        printf("Id esame: %d\n", temp->idEsame);
        printf("Data esame: %s\n\n", temp->dataEsame);
    }
}

void cancella(char t[]){

    current = first;
    struct structEsame *previous = first;

    while(current != NULL){
        if(strcmp(current->nTessera, t) != 0){
            previous = current;
            current = current->next;

        }

        if(strcmp(current->nTessera, t) == 0){
            previous->next = current->next;
        }
    }
}

int main(){

    int n = 0;

    current = (struct structEsame*) malloc(sizeof (struct structEsame));
    do {
        printf("Inserire il numero di elementi\n"),
                scanf("%d",&n);
        fflush(stdin);
    }while(n < 0 || n > 5);

    if(first == NULL){
        for (int i = 0; i < n; ++i) {
            inserisciTesta();
        }
    }
    stampa();

    char tessera[12];
    printf("Inserire il valore di tessera sanitaria da cercare\n");
    scanf("%s", tessera);
    fflush(stdin);
    cercaEsame(tessera);

    printf("Inserire il valore di tessera sanitaria da eliminare\n");
    scanf("%s", tessera);
    fflush(stdin);
    cancella(tessera);

}
