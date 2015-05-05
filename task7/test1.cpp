#include <stdio.h>

extern "C" int sum(int n, int *a);

int main() {
    int n = 5, a[] = { 1, 2, 7, 9, -4 };

    printf("sum(a) = %d\n", sum(n, a));

    return 0;
}