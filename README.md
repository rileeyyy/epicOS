# epicOS
### a stupid operating system i made that somehow works

# RUNNING
if you dont wanna compile it (i dont blame you) you can download one of the disk images in the "imgs" folder  
then run it using  
```
qemu-system-i386 -drive format=raw,file=epicOS.img,if=floppy
```
note: rename it to epicOS.img
have fun!

# COMPILING

## windows
you need:  

- [epicOS](https://github.com/rileeyyy/epicos/archive/refs/heads/main.zip)  
- [NASM](https://nasm.us/)   
- [MSYS MinGW64](https://www.msys2.org/) (or any other bash platform)    
- [QEMU](https://www.qemu.org/) (or any i386 emulator)   
- a basic knowledge of how not to blow up your computer   

note: when executing these commands, put the files in the directory (of nasm, msys, etc.) or use cd [directory]    
open windows cmd, using nasm type:  
```
nasm -f bin bootloader.asm -o bootloader.bin
```  
```
nasm -f bin kernel.asm -o kernel.bin
```    
then in MSYS type:  
```
cat bootloader.bin kernel.bin > epicOS.img
```  
finally in windows cmd type:  
```
qemu-system-i386 -drive format=raw,file=epicOS.img,if=floppy
```

have fun!  

## macOS

youll need:

- [epicOS](https://github.com/rileeyyy/epicos/archive/refs/heads/main.zip)
- [NASM](https://nasm.us/)
- [Homebrew](https://brew.sh/) (for easy installation of NASM and QEMU)
- [QEMU](https://www.qemu.org/) (or any i386 emulator)
- a basic knowledge of how not to blow up your computer

note: when executing these commands, put the files in the directory or use cd [directory]  

open terminal and install nasm and qemu by typing

```
brew install nasm qemu
```

go to the epicOS directory and compile them by typing

```
nasm -f bin bootloader.asm -o bootloader.bin
nasm -f bin kernel.asm -o kernel.bin
```

then type this to get the disk image

```
cat bootloader.bin kernel.bin > epicOS.img
```

finally, run epicos on qemu

```
qemu-system-i386 -drive format=raw,file=epicOS.img
```

have fun!

## linux
youll need:

- [epicOS](https://github.com/rileeyyy/epicos/archive/refs/heads/main.zip)
- [NASM](https://nasm.us/)
- [QEMU](https://www.qemu.org/)
- a basic knowledge of how not to blow up your computer

note: when executing these commands, put the files in the directory or use cd [directory]  

note: ubuntu and some other linux distros use sudo apt so i guess just use your package manager

```
sudo apt install nasm qemu-system-x86
```

navigate to the directory containing the epicOS code.

compile the bootloader and kernel using nasm:

```
nasm -f bin bootloader.asm -o bootloader.bin
nasm -f bin kernel.asm -o kernel.bin
```

then type this to get the disk image:

```
cat bootloader.bin kernel.bin > epicOS.img
```

finally, run epicOS using qemu:

```
qemu-system-i386 -drive format=raw,file=epicOS.img
```

have fun!

# WHY DID I MAKE THIS?
boredom.
sheer boredom.


# HOW DID I MAKE THIS???

assembly
### assembly
## assembly
# ASSEMBLY
