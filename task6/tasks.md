## task1

Do rejestru ECX (adres tekstu) jest przesyłany wskażnik na adres tekstu. Musi być

    set $ecx=0x80490a0

## task3

    set $ecx=0x80490a0
    set $edx=7
    set variable *0x80490a0=0x4c494146 # FAIL
    set variable *0x80490a4=0x000d0a21 # !\0

## task4

    