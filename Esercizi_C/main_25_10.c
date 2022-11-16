#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h>
#include <math.h>

void es_6_arr(){

    char stringa[100];

    printf("Inserire la stringa con ripetizione\n");
    scanf("%[^\n]s",&stringa);

    char temp[20], temp2[20];
    int inizio = 0, fine = 0, inizio2 = 0, fine2 = 0;

    for(int i = 0; i < strlen(stringa) + 1; i++){

        if(stringa[i] == ' '){
            fine = i - 1;
            memcpy(temp, &stringa[inizio], fine + 1);
            temp[(fine - inizio) + 1] = '\0';
            printf("La parola salvata e': %s:", temp);

            for(int j = 0; j < strlen(stringa) + 1; j++){

                if(stringa[j] == ' '){
                    fine2 = j - 1;
                    memcpy(temp2, &stringa[inizio2], fine2 + 1);
                    temp2[(fine2 - inizio2) + 1] = '\0';
                    inizio2 = j + 1;

                    if(strcmp(temp, temp2) == 0){
                        printf("-");
                    }
                }

                if(stringa[j] == '\0'){

                    fine2 = j - 1;
                    memcpy(temp2, &stringa[inizio2], fine2 + 1);
                    temp2[(fine2 - inizio2) + 1] = '\0';

                    if(strcmp(temp, temp2) == 0){
                        printf("-");
                    }
                    break;
                }
            }
            printf("\n");
            inizio = i + 1;

        }

        if(stringa[i] == '\0'){

            fine = i - 1;
            memcpy(temp, &stringa[inizio], fine + 1);
            temp[(fine - inizio) + 1] = '\0';
            printf("La parola salvata e': %s:", temp);
            for(int j = 0; j < strlen(stringa) + 1; j++){

                if(stringa[j] == ' '){
                    fine2 = j - 1;
                    memcpy(temp2, &stringa[inizio2], fine2 + 1);
                    temp2[(fine2 - inizio2) + 1] = '\0';
                    inizio2 = j + 1;

                    if(strcmp(temp, temp2) == 0){
                        //goto scrivi;
                        printf("-");
                    }
                }

                if(stringa[j] == '\0'){

                    fine2 = j - 1;
                    memcpy(temp2, &stringa[inizio2], fine2 + 1);
                    temp2[(fine2 - inizio2) + 1] = '\0';

                    if(strcmp(temp, temp2) == 0){
                        printf("-");
                    }
                    break;
                }
            }
            break;
        }
    }
}

void es1_matrici(){

    int M[15][15];
    srand(time(NULL));

    for(int i = 0; i < 15; i++){
        for(int j = 0; j < 15; j++){
            M[i][j] = rand() % 10;
        }
    }

    int c[15];
    for(int i = 0; i < 15; i++){
        c[i] = 0;
        printf("Row %d ", i);
        for(int j = 0; j < 15; j++){
            printf("%d  ", M[i][j]);
            c[i] += M[i][j];
        }
        printf(" La somma della riga e': %d", c[i]);
        printf("\n");
    }

    int temp = 0;
    for (int i = 0; i < 15; ++i) {
        if(temp < c[i])
            temp = c[i];

    }
    printf("Il valore piu alto e': %d\n", temp);
}

void es2_matrici() {

    int a;
    srand(time(NULL));
    do{
        printf("Inserire la grandezza della matrice quadrata \n");
        scanf("%d", &a);
    }while(a < 0);

    int M[a][a], sr[a], sc[a], dp = 0, ds = 0 ;

    printf("Inserire i valori a mano\n");
    for(int i = 0; i < a; i++){
        for (int j = 0; j < a; ++j) {
            scanf("%d", &M[i][j]);
            //M[i][j] = rand() % 1;
        }
    }

    printf("\n");
    printf("Righe\n");
    for(int i = 0; i < a; i++){
        sr[i] = 0;
        for (int j = 0; j < a; ++j) {
            printf("%d ", M[i][j]);
            sr[i] += M[i][j];
        }
        printf("Somma righa :%d", sr[i]);
        printf("\n");
    }

    printf("\n");
    printf("Colonne\n");
    for(int i = 0; i < a; i++){
        sc[i] = 0;
        for (int j = 0; j < a; ++j) {
            printf("%d ", M[j][i]);
            sc[i] += M[j][i];
        }
        printf("Somma colonna :%d", sc[i]);
        printf("\n");
    }

    printf("\n");
    printf("Diagonale principale\n");
    for(int i = 0; i < a; i++){
        for (int j = 0; j < a; ++j) {
            printf("%d ", M[i][j]);
            if(i == j)
                dp += M[i][j];
        }
        printf("\n");
    }
    printf("Somma diagonale principale %d\n", dp);

    printf("\n");
    printf("Diagonale secondaria\n");
    for(int i = 0; i < a; i++){
        for (int j = 0; j < a; ++j) {
            printf("%d ", M[i][j]);
            if(j == a - i - 1)
                ds += M[i][j];
        }
        printf("\n");
    }
    printf("Somma diagonale secondaria %d\n", ds);

    int bool = 0, val = 1;
    if(ds == dp)
        bool = ds;

    for(int i = 0; i < a ; i++){
        if((sc[i] == bool) && (sr[i] == bool)){
            val = 1;
        }else
            val = 0;
        if(val == 0)
            break;
    }
    if(val == 1)
        printf("Matrice magica!\n");
    else
        printf("Matrice non maigca!\n");
}

void es1_char(){

    char bit[100];
    float n = 0, l = 0;

    printf("Inserire la sequenza di bit da tradurre\n");
    scanf("%s", &bit);

    for(int i = 0; i < strlen(bit); i++){

        if(bit[i] == '1'){

            l = pow(2, (float)strlen(bit) - i - 1);
            n += l;

        }

    }
    printf("Il valore dei bit e': %f", n);

}

void es2_char(){

    char c[100];

    printf("Inserire la stringa\n");
    scanf("%[^\n]s", c);

    for(int i = 0; i < strlen(c); i++){
        if(c[i] == '#')
            break;
        else
            printf("%c", c[i]);
    }
}

void es3_char(){

    char str[50], ch;
    int i = 0;

    printf("Inserisci la stringa: \n");

    ch = getchar();

    while(ch != '\n'){

        if(ch == '?')
            str[i] = '!';
        else
            str[i] = ch;
        i++;
        ch = getchar();

    }
    str[i] ='\0';

    printf("La stringa e': %s", str);

}

void es4_char(){

    char alfabeto[] = {
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
            'i','k', 'l', 'm', 'n', 'o', 'p',
            'r', 's', 't', 'v', 'w', 'x', 'y', 'z','a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
            'i','k', 'l', 'm', 'n', 'o', 'p',
            'r', 's', 't', 'v', 'w', 'x', 'y', 'z'};
    char str[50];
    char traduzione[50];

    printf("Inserisci la stringa: \n");

    scanf("%[^\n]s", str);

    for(int i = 0; i < strlen(str); i++){
        if(isalpha(str[i]) == 0)
            traduzione[i] = str[i];
        if(isalpha(str[i]) != 0){
            for(int j = 0; j < 46; j++){
                if(str[i] == alfabeto[j])
                    traduzione[i] = alfabeto[j + 3];
            }
        }
    }

    printf("La stringa cifrata e': %s", traduzione);

}

void es5_char(){

    char stringa[100];
    printf("Inserire un intervallo in input tipo a-g \n");
    scanf("%s", &stringa);
    for(int i = 0; i < strlen(stringa); i++){

        stringa[i] = toupper(stringa[i]);
    }

    char p, d;

    for(int i = 0; i < strlen(stringa); i++){
        if(stringa[i] == '-'){
            p = stringa[i - 1];
            d = stringa[i + 1];
        }
    }

    printf("primo %d, secodno %d\n" , (int)p, d);

    if((int) p < (int) d){
        int temp = (int) p;
        for(int i = (int) p;i < (int) d; i++){

            printf("%c", i);
        }

    }

    else{
        printf("Intervallo non valido\n");
    }

}

void es1_stringhe(){

    printf("Inserire una stringa\n");

    char str[100], ch;
    int i = 0, count = 0;

    while((ch=getchar()) != EOF && ch != '\n'){
        str[i] = ch;
        i++;
        if(isspace(ch))
            count++;
    }
    printf("Ci sono %d spazi", count);

}

void pointers(){
    int *iPtr;
    int vettore[5]={10,20,30,40,50};
    printf("indirizzo di vettore: %p\n", vettore);
    iPtr = vettore;
    printf("indirizzo di vettore : %X\n",iPtr);
    printf("primo elemento di vettore : %d\n",*vettore);
    printf("secondo elemento di vettore : %d\n",*(vettore +1));
    ++iPtr;
    printf("secondo elemento di vettore : %d\n",*iPtr);

}

void es2_stringhe(){

    char M[2][5][20];

    printf("Inserire le 10 parole\n");

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 5; j++){
            printf("[%d][%d]) ", i, j);
            scanf("%s", &M[i][j]);
            while(strlen(M[i][j]) > 20){
                printf("Parola troppo lunga, non superare i 20 caratteri\n");
                scanf("%s", M[i][j]);
            }
        }
    }
    printf("\n");

    int f = 0;

    for(int i = 0; i < 2; i++){
        for(int j = 0; j < 5; j++){
            f = 0;
            for(int k = 0; k < 2; k++){
                for (int l = 0; l < 5; ++l) {
                    if(strcmp(M[i][j], M[k][l]) == 0){
                        f++;
                    }
                }
            }
            printf("M[%d][%d] = %s e' ripetuta %d\n", i, j, M[i][j], f);
        }
        printf("\n");
    }

}


int funzione_es1(){

    int n, l;
    printf("Inserire il primo valore\n");
    scanf("%d", &n);
    printf("Inserer il secondo valore\n");
    scanf("%d", &l);

    if(n > l)
        return n;
    else
        return l;
}

void funzione_es2(){

    int n, l;
    printf("Inserire un intervallo con divisione -\n");
    do {
        scanf("%d-%d", &n, &l);
    }while (n > l);
    fflush(stdin);
    char c;
    printf("Inserire il carattere da inserire nella stringa\n");
    scanf("%c", &c);

    int v[l + 1];
    for(int i = 0; i < l + 1; i++){

        if(i >= n && i <= l){
            v[i] = c;
        }
        else
            v[i] = ' ';
    }
    v[l] = '\0';
    for(int i = 0; i < l + 1; i++){

        printf("%c", v[i]);
    }
}

void funzione_es3(){

    int n, l;
    printf("Inserire un intervallo con divisione -\n");
    scanf("%d-%d", &n, &l);

    fflush(stdin);
    char c;
    printf("Inserire il carattere da inserire nella stringa\n");
    scanf("%c", &c);

    for(int i = 0; i < l; i++){
        for(int j = 0; j < n; j++){
            printf("%c", c);
        }
        printf("\n");
    }

}

void funzione_es4(int n, int l){

    int temp = 0;

    if(n < l){
        temp = n;
        n = l;
        l = temp;
    }
}

int funzione_es5(){

    double d = 0, n = 0;
    printf("Inserire la base e l'esponente\n");
    scanf("%f, %f", &n, &d);
    if(n == 0 && d == 0){
        printf("Valore indefinito\n");
        return 0;
    }
    if(n == 0)
        return 0;
    if(d == 0)
        return 1;

    double r = pow(n, d);
    return r;

}

int main() {

    //es_6_arr();
    //es1_char();
    //es2_char();
    //es3_char();
    //es4_char();
    //es4_char();
    //es1_matrici();
    //es2_matrici();
    //es1_stringhe();
    //es2_stringhe();
    //pointers();
    //printf("Valore piu' piccolo :%d", funzione_es1());
    //funzione_es2();
    //funzione_es3();
    
    /*int n, l;
    printf("Inserire i valori i due valori divisi da spazio\n");
    scanf("%d %d", &n, &l);
    funzione_es4(&n, &l);
    printf("%d, %d",n, l);*/
    
    funzione_es5();

    return 0;
}
