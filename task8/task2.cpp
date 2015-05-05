#include <stdio.h>
#include <stdlib.h>

extern void kopiuj(int *cel, int *zrodlo, int n);
extern void zeruj(int *cel, int n);

void print_array(int *a, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }

    printf("\n");
}

int main() {
    int *a = (int*) malloc(5 * sizeof(int));
    int b[] = { 1, 2, 7, 19, 4 };

    printf("Initial state: \n");
    printf("a: ");
    print_array(a, 5);
    printf("b: ");
    print_array(b, 5);

    kopiuj(a, b, 5);

    printf("Kopied: \n");
    printf("a: ");
    print_array(a, 5);
    printf("b: ");
    print_array(b, 5);

    zeruj(b, 5);

    printf("Zeroed b: \n");
    printf("a: ");
    print_array(a, 5);
    printf("b: ");
    print_array(b, 5);

    return 0;
}