## task1

Do rejestru ECX (adres tekstu) jest przesyłany wskażnik na adres tekstu. Musi być

    set $ecx=0x80490a0

## task3

    set $ecx=0x80490a0
    set $edx=7
    set variable *0x80490a0=0x4c494146 # FAIL
    set variable *0x80490a4=0x000d0a21 # !\0

## task4

W funkcji `_Z5checkPKc` (dojść tam można pry pomocy `b _Z5checkPKc`) w dokładnie tej linijce

    => 0x08048efb <+39>:    test   al,al

trzeba ustalić rejestr `AL` równym **ZERO**:

    set $al = 0
    (gdb) p $ebp-0x4
    $1 = (void *) 0xffffc464
    set variable *0xffffc464=0x2ad

Wynikiem jest żart =)

    TOP SECRET
    ----------
    Puk puk.
    - Kto tam?
    (długa cisza)
    - Java.

    Puk puk.
    - Kto tam?
    - C++.

    Puk puk.
    - Assembler.