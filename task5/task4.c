#include <stdio.h>

typedef struct{
    int min;
    int max;
} MM;

extern "C" MM minmax(int N, ...);

int main() {
   MM wynik = minmax(5, 1, -2, 4 , 90, 4);

   printf("min = %d, max = %d \n", wynik.min, wynik.max);

   return 0;
}