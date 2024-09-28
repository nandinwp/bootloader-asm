[BITS 16]
[ORG 0x7c00]

start:
    cli
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti

    mov si, menu_msg
    call print_string

menu:
    call read_input

    cmp al, '1'
    je shutdown
    cmp al, '2'
    je reboot

    jmp menu

shutdown:
    cli
    hlt ; Para a execução da CPU

reboot:
    jmp start

print_string:
    lodsb 
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print_string

done:
    ret

read_input:
    mov ah, 0x01
    int 0x21
    ret

menu_msg db "Menu: 1. Desligar  2. Reiniciar", 0

times 510 - ($ - $$) db 0

dw 0xAA55
