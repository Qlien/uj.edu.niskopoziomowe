#include <stdio.h>

// (b + a) * (b - k)
extern "C" float wylicz(double a, double b, int k);

int main() {
    printf("wylicz(5, 4, 7) = %0.4f\n", wylicz(5.0, 4.0, 7));

    return 0;
}