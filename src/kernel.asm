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
    mov ah, 0
    int 0x16
    cmp al, 0x0D
    jne not_enter
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10
    mov si, prompt
    call print_string

    mov si, buffer
    mov di, command
    cld
    lodsb
    mov bl, al
    mov al, byte [di]
    cmp al, bl
    jne execute_command
    inc di
    mov si, di
    mov di, buffer
    call print_string
    jmp shell

execute_command:
    mov si, buffer
    mov di, command
    cld
    rep cmpsb
    jne shell
    mov si, buffer
    add si, 5
    mov di, buffer
    mov cx, 5
copy_text:
    lodsb
    stosb
    loop copy_text
    call print_string
    jmp shell

not_enter:
    mov ah, 0x0e
    int 0x10
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

os_name db "epicOS (pre-release) v1.1", 0
prompt db "> ", 0
buffer db 100, 0
command db "echo ", 0

times 512-($-$$) db 0

