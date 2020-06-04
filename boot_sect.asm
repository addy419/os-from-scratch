; A simple boot sector that demonstrates stack

  [org 0x7c00]          ; Skip boot sector.

  mov ah, 0x0e          ; Scrolling teletype BIOS routine.

  mov bx, 4

  cmp bx, 40
  jl set_b
  mov al, 'C'
  jmp print

set_b:
  cmp bx, 4
  jle set_a
  mov al, 'B'
  jmp print

set_a:
  mov al, 'A'

print:
  int 0x10 ; Interrupt print al

  jmp $                 ; Jump to the current address forever.

  times 510-($-$$) db 0 ; Tell our assembly compiler to pad out our
                        ; program with enough zero bytes (db 0) to bring us to the
                        ; 510 th byte.

  dw 0xaa55