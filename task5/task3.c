#include <stdio.h>
#include <stdlib.h>

extern int sortuj(int *a, int *b, int *c);

int main() {
    int a, b, c;

    printf("Wprowadż trzy liczby: ");
    scanf("%d%d%d", &a, &b, &c);

    sortuj(&a, &b, &c);

    printf("Posortowane liczby: %d, %d oraz %d\n", a, b, c);

    return 0;
}