#include <stdio.h>

extern "C" double wartosc(double a, double b, double c, double d, double x);

int main() {
  printf("%0.3f\n", wartosc(2, 3, 4, 5, 1.f));
  printf("%0.3f\n", wartosc(2, 3, 4, 5, -1.f));

  return 0;
}
