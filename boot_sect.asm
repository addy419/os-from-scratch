; A simple boot sector program that loops forever.
loop:
    jmp loop

times 510-($-$$) db 0  ; Tell our assembly compiler to pad out our
                       ; program with enough zero bytes (db 0) to bring us to the
                       ; 510 th byte.

dw 0xaa55