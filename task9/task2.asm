global wartosc
wartosc:
    ; xmm0   a
    ; xmm1   b
    ; xmm2   x
    enter 0, 0

    mulpd xmm0, xmm2
    addpd xmm0, xmm1

    leave
    ret