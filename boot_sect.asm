; A simple boot sector that demonstrated addressing

  [org 0x7c00]          ; Skip boot sector

  mov ah, 0x0e          ; scrolling teletype BIOS routine.

  mov al, [the_secret]
  int 0x10

  jmp $                 ; Jump to the current address forever.

the_secret:
  db 'X'

  times 510-($-$$) db 0 ; Tell our assembly compiler to pad out our
                        ; program with enough zero bytes (db 0) to bring us to the
                        ; 510 th byte.

  dw 0xaa55