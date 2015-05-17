#include <stdio.h>
#include <stdlib.h>

char* dodaj(char *s1, char *s2, int n) {
    char* res = (char*) malloc(((2 * n) + 1) * sizeof(char));

    asm(
        "movl %%ecx, %%edx\n" // edx = n
        "movl %%eax, %%esi\n" // esi = eax (s1)
        "rep movsb\n"         // copy s1 to res
        "movl %%edx, %%ecx\n" // ecx = n
        "movl %%ebx, %%esi\n" // esi = ebx (s2)
        "rep movsb\n"         // copy s2 to res
        "inc %%edi\n"
        "movb $0, (%%edi)\n"
        :
        : "D"(res), "a"(s1), "b"(s2), "c"(n)
    );

    return res;
}

int main() {
    char *s1 = "moo", *s2 = "foo";
    char *res = dodaj(s1, s2, 3);

    printf("s1: %s\n", s1);
    printf("s2: %s\n", s2);
    printf("sum: %s\n", res);

    return 0;
}