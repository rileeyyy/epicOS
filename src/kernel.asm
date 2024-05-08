[org 0x8000]

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7000
    
    mov si, loading_message
    call print_string
    mov ax, 0x8100
    mov ds, ax
    mov es, ax

    jmp 0x8100

disk_error:
    mov si, disk_error_message
    call print_string
    cli
    hlt

print_string:
    lodsb
    cmp al, 0
    je done_print
    mov ah, 0x0e
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp print_string

done_print:
    ret

disk_error_message db "ruh oh spagettios disk error whoopsies skidoopsies", 0
loading_message db "loading shell...", 0

times 512-($-$$) db 0
