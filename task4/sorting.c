#include <stdio.h>

void sort(int *a, int n) {
    int i, t, tmp;

    for (i = 0; i < n; i++) {
        for (t = 0; t < n; t++) {
            if (a[i] > a[t]) {
                tmp = a[i];
                a[i] = a[t];
                a[t] = tmp;
            }
        }
    }
}

int main() {
    int i, n, a[10] = {0};

    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    sort(a, n);

    for (i = 0; i < n; i++) {
        printf("%d\n", a[i]);
    }

    return 0;
}