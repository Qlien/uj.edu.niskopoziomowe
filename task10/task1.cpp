#include <stdio.h>

extern "C" void diff(int n, float *a, float *c);

void print_array(float * a, int n, const char *label = 0) {
    if (label) {
        printf("%s", label);
    }

    for (int i = 0; i < n; i++) {
        printf("%0.3f ", a[i]);
    }

    printf("\n");
}

int main() {
    float a[] = { 1, 2, 3, 4, 5 };
    float b[] = { 2, 7, 9, 12, -3 };
    float *c = new float[5];

    diff(5, b, c);

    // print_array(a, 5, "a: ");
    print_array(b, 5, "b: ");
    print_array(c, 4, "diff(b): ");

    return 0;
}