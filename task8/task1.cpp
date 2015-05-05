#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern unsigned int rotate(unsigned int x, int n = 1);
extern unsigned char rotate(unsigned char x, int n = 1);

void print_binary(unsigned int n) {
    unsigned int l = 0, n2 = n;
    int *bits = (int*) calloc(((int) log2(n) + 1), sizeof(int));

    while (n > 0) {
        bits[l++] = (n % 2);
        n /= 2;
    }

    printf("bits(%d) = ", n2);

    for (int i = 32; i > l; i--) {
        printf("0");
    }

    for (int i = l - 1; i > 0; i--) {
        printf("%d", bits[i]);
    }

    printf("\n");

    free(bits);
}

int main() {
    print_binary((unsigned int) 32767);
    printf("rotated by 5: ");
    print_binary(rotate((unsigned int) 32767, 5));

    print_binary((unsigned char) 254);
    printf("rotated by 2: ");
    print_binary(rotate((unsigned char) 254, 2));

    print_binary((unsigned char) 12);
    printf("rotated by 2: ");
    print_binary(rotate((unsigned char) 12, 2));

    print_binary((unsigned char) 7);
    printf("rotated by 1: ");
    print_binary(rotate((unsigned char) 7, 1));

    return 0;
}