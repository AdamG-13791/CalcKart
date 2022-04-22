sdcc %1.c -mz80 --nolabelopt --callee-saves-bc --reserve-regs-iy --opt-code-size --fomit-frame-pointer --asm=z80asm -S -o %1.z80
python cAsm.py %1