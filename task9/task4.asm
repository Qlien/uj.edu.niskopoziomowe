global podatek
podatek:

    enter 0, 0

    ; rdi - id
    ; xmm0 - obrot
    ; xmm1 - podatekNaliczony
    ; xmm2 - stawkaPodatku

    ; podatek = (obrót - podatekNaliczony) * stawkaPodatku
    ; subps xmm0, xmm1
    ; mulps xmm0, xmm2
    movq xmm0, rcx

    leave
    ret

global wypisz
wypisz:

    enter 0, 0

    leave
    ret