# Kartkówka nr. 1

## Kompilacja

    nasm -felf32 kartkowka1.asm -o kartkowka1_asm.o
    g++ -c -m32 kartkowka1.cpp -o kartkowka1_c.o
    g++ -m32 -o kartkowka1 kartkowka1_c.o kartkowka1_asm.o

## Uruchamienie oraz przykład działania

    $ ./kartkowka1
    wylicz(5, 4, 7) = -27.0000
