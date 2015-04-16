/*
COMPILACJA:

    gcc -c -m32 -o task2_c.o task2.c
    nasm -felf32 -g -o task2_asm.o task2.asm
    gcc -m32 -g -o task2 task2_c.o task2_asm.o
*/

#include <stdio.h>

extern void prostopadloscian(float a, float b, float c, float *v, float *s);

int main() {
  float surface = 0, volume = 0;
  prostopadloscian(4, 5, 6, &volume, &surface);
  printf("volume: %0.3f surface: %0.3f\n", volume, surface);

  return 0;
}
