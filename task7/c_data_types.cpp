#include <stdio.h>

    int main() {
        printf("size(char) = %d bytes\n", sizeof(char));
        printf("size(short) = %d bytes\n", sizeof(short));
        printf("size(int) = %d bytes\n", sizeof(int));
        printf("size(long) = %d bytes\n", sizeof(long));
        printf("size(long long) = %d bytes\n", sizeof(long long));
        printf("size(float) = %d bytes\n", sizeof(float));
        printf("size(double) = %d bytes\n", sizeof(double));
        printf("size(long double) = %d bytes\n", sizeof(long double));

        printf("size(char*) = %d bytes\n", sizeof(char*));
        printf("size(short*) = %d bytes\n", sizeof(short*));
        printf("size(int*) = %d bytes\n", sizeof(int*));
        printf("size(long*) = %d bytes\n", sizeof(long*));
        printf("size(long long*) = %d bytes\n", sizeof(long long*));
        printf("size(float*) = %d bytes\n", sizeof(float*));
        printf("size(double*) = %d bytes\n", sizeof(double*));
        printf("size(long double*) = %d bytes\n", sizeof(long double*));

        return 0;
    }
