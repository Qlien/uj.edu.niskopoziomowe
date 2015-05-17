#include <stdio.h>

extern "C" int iloczyn(int n, ...);

int main() {
    int r = iloczyn(5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2);

    printf("Iloczyn(2^5) = %d\n", r);

    return 0;
}