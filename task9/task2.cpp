#include <stdio.h>

// wartosc(a, b, x) = a*x + b
extern "C" double wartosc(double a, double b, double x);

int main() {
    double a = 4, b = 3, x = 2, w = wartosc(a, b, x);

    printf("Wartosc(%0.3f, %0.3f, %0.3f) = %0.3f\n", a, b, x, w);

    return 0;
}