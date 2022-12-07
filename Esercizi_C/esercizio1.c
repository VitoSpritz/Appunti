#include <stdio.h>
#include <string.h>
#include <ctype.h>

void trasforma(char a[], char b[]){

    int c = 0;
    char temp[strlen(a)];

    for(int i = 0; i < strlen(a); i++){

        temp[i] = tolower(a[i]);
        b[c] = " ";

        switch (temp[i]) {
            case 'a': b[c] = temp[i]; c++; break;
            case 'e': b[c] = temp[i]; c++; break;
            case 'i': b[c] = temp[i]; c++; break;
            case 'o': b[c] = temp[i]; c++; break;
            case 'u': b[c] = temp[i]; c++; break;

        }
    }

    for (int i = 0; i < strlen(a); ++i) {

        temp[i] = tolower(a[i]);
        if(temp[i] != 'a' && temp[i] != 'e' && temp[i] != 'i' && temp[i] != 'o' && temp[i] != 'u' && isalpha(temp[i]) != 0){

            b[c] = temp[i];
            c++;

        }

    }

    for (int i = 0; i < strlen(a); ++i) {
        if(isalpha(temp[i]) == 0){
            b[c] = temp[i];
            c++;
        }

    }
    b[c] = '\0';

    printf("%s" ,b);

}

int main() {

    char prima[30], seconda[30], *ptr;

    printf("Inserire la prima stirnga\n");
    scanf("%[^\n]s", prima);

    trasforma(prima, seconda);

    return 0;
}
