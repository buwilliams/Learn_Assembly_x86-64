# Must be run from a terminal started by: Start > x86 Native Tools Command-Prompt for VS 2022
# Makefile for building hello-world.asm

# Output files
OBJ=hello-world.obj
EXE=hello-world.exe

# Tools
ASSEMBLER=nasm
LINKER=link

# Flags
# See https://stackoverflow.com/questions/64413414/unresolved-external-symbol-printf-in-windows-x64-assembly-programming-with-nasm
# and https://learn.microsoft.com/en-us/cpp/porting/visual-cpp-change-history-2003-2015?view=msvc-170
# for more information on why we need the linker_flags and why we've removed the entry point flag.
ASM_FLAGS=-f win64
LINKER_FLAGS=/subsystem:console /out:$(EXE) kernel32.lib legacy_stdio_definitions.lib msvcrt.lib

all: $(EXE)

$(EXE): $(OBJ)
	$(LINKER) $(OBJ) $(LINKER_FLAGS)

$(OBJ): hello-world.asm
	$(ASSEMBLER) $(ASM_FLAGS) -o $(OBJ) hello-world.asm

clean:
	del $(OBJ) $(EXE)