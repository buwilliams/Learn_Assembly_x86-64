del /f /q hello-world.exe hello-world.obj
nasm -f win64 -o hello-world.obj hello-world.asm
link hello-world.obj /subsystem:console /out:hello-world.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib