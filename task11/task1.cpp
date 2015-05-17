#include <stdio.h>
#include <stdlib.h>

void kopiuj(int *cel, int *zrodlo, unsigned int n) {
    int result;

    asm(
        // "movl %%3, %%ecx" // n
        // "imull $4, %%ecx;" // integer copy
        // "movl %%1, %%edi" // dst
        // "movl %%2, %%esi" // src
        "rep movsd;"
        : "=a"(result)
        : "D"(cel), "S"(zrodlo), "c"(n)
        // : "ecx", "edi", "esi"
    );
}

int main() {
    int a[] = { 1, 4, 5, 8, 6, 3, 2, 9, 7, 0};
    int *b = new int[10];

    printf("a: ");

    for (int i = 0; i < 10; i++) {
        printf("%d ", a[i]);
    }

    printf("\n");

    printf("b: ");

    for (int i = 0; i < 10; i++) {
        printf("%d ", b[i]);
    }

    printf("\n");

    kopiuj(b, a, 10);

    printf("a: ");

    for (int i = 0; i < 10; i++) {
        printf("%d ", a[i]);
    }

    printf("\n");

    printf("b: ");

    for (int i = 0; i < 10; i++) {
        printf("%d ", b[i]);
    }

    printf("\n");

    return 0;
}