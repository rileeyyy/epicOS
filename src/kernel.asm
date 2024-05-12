[org 0x8000]
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7000

    mov ah, 0x06
    xor al, al
    mov bh, 0x07
    xor cx, cx
    mov dx, 0x184f
    int 0x10

    mov ah, 0x0e
    mov al, 0x0a
    int 0x10

    mov si, os_name
    call print_string
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10

    mov si, prompt
    call print_string

shell:
    mov si, input_buffer
    call read_string

    mov si, input_buffer
    mov di, ver_command
    call compare_strings
    cmp al, 1
    je print_version
    jmp shell

print_version:
    mov si, version_string
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

read_string:
    mov si, input_buffer
    mov cx, 32
    mov ah, 0
read_loop:
    int 0x16
    cmp al, 0x0D
    je done_reading
    mov ah, 0x0e
    int 0x10
    stosb
    loop read_loop
done_reading:
    mov ah, 0x0e
    mov al, 0x0d
    int 0x10
    mov al, 0x0a
    int 0x10
    ret

compare_strings:
next_char:
    lodsb
    cmp al, byte [di]
    jne not_equal
    cmp al, 0
    je equal
    inc di
    jmp next_char
not_equal:
    mov al, 0
    ret
equal:
    mov al, 1
    ret

os_name db "epicOS v1.1", 0
prompt db "> ", 0
input_buffer db 32
ver_command db "ver", 0
version_string db "epicOS test build", 0

times 512-($-$$) db 0
