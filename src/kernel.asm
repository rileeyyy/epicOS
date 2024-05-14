[org 0x8000]
start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    mov si, os_name
    call print_string

    mov si, prompt
    call print_string

shell:
    mov ah, 0
    int 0x16

    cmp al, 0x0D
    jne check_command

    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10

    mov si, prompt
    call print_string
    jmp shell

check_command:
    mov si, buffer
    mov di, command
    cld
    mov cx, 3
    repe cmpsb

    jne shell
    mov si, ver_msg
    call print_string
    jmp shell

print_string:
    lodsb
    or al, al
    jz done_print
    mov ah, 0x0e
    int 0x10
    jmp print_string

done_print:
    ret

os_name db "epicOS v1.1", 0
prompt db "> ", 0
buffer db 100, 0
command db "ver", 0
ver_msg db "epicOS test build", 0

times 510-($-$$) db 0
dw 0xaa55

; radiohead
