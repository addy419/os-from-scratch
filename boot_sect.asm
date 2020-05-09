; A simple boot sector that prints a message to the screen using a BIOS routine.

mov ah, 0x0e          ; scrolling teletype BIOS routine.

mov al, 'H'
int 0x10              ; interrupt 0x10.
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10              ; 'l' is still on al
mov al, 'o'
int 0x10

jmp $                 ; Jump to the current address forever.

times 510-($-$$) db 0 ; Tell our assembly compiler to pad out our
                      ; program with enough zero bytes (db 0) to bring us to the
                      ; 510 th byte.

dw 0xaa55