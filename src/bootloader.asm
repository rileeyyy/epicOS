; haha no comments
[org 0x7c00]

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    
    mov ah, 0
    int 0x13

    mov si, message
    call print_string
    
    mov bx, kernel_load_address
    mov dh, 0
    mov dl, 0
    mov ch, 0
    mov cl, 2
    mov ah, 0x02
    mov al, 1
    int 0x13

    jc disk_error
    
    mov si, kernel_message
    call print_string

    jmp 0x8000

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

message db "loading epicOS...", 0
kernel_message db "jumping to kernel...", 0
disk_error_message db "a disk read error has occurred, how unfortunate", 0

kernel_load_address equ 0x8000

times 510-($-$$) db 0
dw 0xAA55
