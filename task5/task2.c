#include <stdio.h>
#include <stdlib.h>

extern int suma(int n, int *a);

int main() {
    int n, *a, i;

    printf("Wprowadż liczbę n: ");
    scanf("%d", &n);

    a = (int*) malloc(n * sizeof(int));

    printf("Wprowadż %d liczb: ", n);

    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    printf("Suma liczb tablicy = %d\n", suma(n, a));

    return 0;
}