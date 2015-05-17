#include <stdio.h>

int iloczyn(int n, int *src);

void print_array(int * a, int n, const char *label = 0) {
    if (label) {
        printf("%s", label);
    }

    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }

    printf("\n");
}

int main() {
    int a[] = { 1, 2, 3, 4, 5 };

    int res = iloczyn(5, a);

    print_array(a, 5, "a: ");
    printf("Iloczyn(a) = %d\n", res);

    return 0;
}