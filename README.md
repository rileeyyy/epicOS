# epicOS
### a stupid operating system i made that somehow works


# COMPILING
you need:  

[epicOS](https://github.com/rileeyyy/epicos/archive/refs/heads/main.zip)  
[NASM](https://nasm.us/)  
[MSYS MinGW64](https://www.msys2.org/) (or any other bash platform)  
[QEMU](https://www.qemu.org/) (or any i386 emulator)  
a basic knowledge of how not to blow up your computer  

note: when executing these commands, put the files in the directory (of nasm, msys, etc.) or use cd [directory]  
open windows cmd, using nasm type:  
```nasm -f bin bootloader.asm -o bootloader.bin```  
```nasm -f bin kernel.asm -o kernel.bin```    
then in MSYS type:  
```cat bootloader.bin kernel.bin > epicOS.img```  
finally in windows cmd type:  
```qemu-system-i386 -drive format=raw,file=epicOS.img,if=floppy```

have fun!  


# WHY DID I MAKE THIS?
boredom.
sheer boredom.


# HOW DID I MAKE THIS???

assembly
### assembly
## assembly
# ASSEMBLY
