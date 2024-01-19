#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <binary>"
	exit
fi

echo "# Complete $1 Enumeration Data" | tee -a $1.enumdata
echo "" | tee -a $1.enumdata
echo "#### \`file\`" | tee -a $1.enumdata
file $1 | tee -a $1.enumdata $1.file
echo "" | tee -a $1.enumdata
echo "#### \`strings -e s\`" | tee -a $1.enumdata
strings -e s $1 | tee -a $1.enumdata $1.strings-es
echo "" | tee -a $1.enumdata
echo "#### \`strings -e S\`" | tee -a $1.enumdata
strings -e S $1 | tee -a $1.enumdata $1.strings-eS
echo "" | tee -a $1.enumdata
echo "#### \`strings -e b\`" | tee -a $1.enumdata
strings -e b $1 | tee -a $1.enumdata $1.strings-eb
echo "" | tee -a $1.enumdata
echo "#### \`strings -e l\`" | tee -a $1.enumdata
strings -e l $1 | tee -a $1.enumdata $1.strings-el
echo "" | tee -a $1.enumdata
echo "#### \`checksec\`" | tee -a $1.enumdata
checksec $1 | tee -a $1.enumdata $1.checksec
echo "" | tee -a $1.enumdata
echo "#### \`checksec\`" | tee -a $1.enumdata
ldd $1 | tee -a $1.enumdata $1.ldd
echo ""
echo "================================="
echo "Install angr for Binary Analysis!"
echo "================================="
echo ""
echo "python3 -m venv myenv"
echo "source myenv/bin/activate"
echo "pip install angr"
echo ""
echo "================================="
echo ""
echo "================================="
echo "Very Important!!"
echo "================================="
echo "The output from ldd, have patched the local binary or for pwntool got them:"
echo "Running from you machine:"
echo ""
echo "$(cat $1.ldd)" 
echo ""
echo "If the binary is from a remote machine you need to use \`ldd\`"
echo "Then exfil those libraries and:"
echo "patchelf --set-rpath . $1 # Change the DT_RUNPATH of the executable or library to RUNPATH."
echo "patchelf --set-interpreter ld-linux.so.2 $1 # # Change the dynamic loader ("ELF interpreter") of executable given to INTERPRETER."
echo ""
