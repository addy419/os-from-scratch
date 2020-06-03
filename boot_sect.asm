; A simple boot sector that demonstrates stack

  [org 0x7c00]          ; Skip boot sector.

  mov ah, 0x0e          ; Scrolling teletype BIOS routine.

  mov bp, 0x8000        ; Set the base of the stack a little above where BIOS is.
  mov sp, bp            ; Loads our boot sector - so it won’t overwrite us.

  push 'A'
  push 'B'
  push 'C'

  pop bx                ; We can only pop 16-bits since we are in 16-bit boundary.
  mov al, bl            ; Most significant bit will be added by assembler as 0x00 so ignore it.
  int 0x10
  
  pop bx
  mov al, bl
  int 0x10

  pop bx
  mov al, bl
  int 0x10

  jmp $                 ; Jump to the current address forever.

  times 510-($-$$) db 0 ; Tell our assembly compiler to pad out our
                        ; program with enough zero bytes (db 0) to bring us to the
                        ; 510 th byte.

  dw 0xaa55