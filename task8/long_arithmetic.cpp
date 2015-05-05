#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

void str2bigint(const char* str, int *x, int *len) {
    *len = strlen(str);
    x = (int*) malloc(len * sizeof(int));

    for (int i = 0; i < len; i++) {
        x[i] = str[i] - '0';
    }
}

void int2bigint(int n, int *x, int *len) {
    *len = (int) log10(n) + 1;
    x = (int*) malloc(*len * sizeof(int));

    int i = 0;

    while (n > 0) {
        x[i++] = n % 10;
        n /= 10;
    }
}

char* bigint2str(int *x, int len) {
    char *res = (char*) malloc((len + 1) * sizeof(char));

    for (int i = 0; i < len; i++) {
        res[i] = x[i] + '0';
    }

    res[len] = '\0';

    return res;
}

void copy(int *dst, int *src, int n);
void add(int *x, int x_len, int *y, int y_len, int *z, int *z_len);
void mul(int *x, int x_len, int *y, int y_len, int *z, int *z_len);
void div(int *x, int x_len, int *y, int y_len, int *z, int *z_len);

int main() {
    int *a = 0, *b = 0, *c = 0;
    int a_len = 0, b_len = 0, c_len = 0;

    str2bigint("999999999999", a, &a_len);
    str2bigint("1000000000000", b, &b_len);
    int2bigint(3, c, &c_len);

    printf("a = %s\n", bigint2str(a, a_len));
    printf("b = %s\n", bigint2str(b, b_len));
    printf("c = %s\n", bigint2str(c, c_len));

    add(a, a_len, b, b_len, c, &c_len);
    printf("a + b = %s\n", bigint2str(c, c_len));

    mul(a, a_len, b, b_len, c, &c_len);
    printf("a * b = %s\n", bigint2str(c, c_len));

    int2bigint(3, b, &b_len);
    div(a, a_len, b, b_len, c, &c_len);
    printf("a / %s = %s\n", bigint2str(b, b_len), bigint2str(c, c_len));

    return 0;
}