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
checksec --verbose --file=$1 | tee -a $1.enumdata $1.checksec
echo "" | tee -a $1.enumdata
echo "#### \`checksec\`" | tee -a $1.enumdata
ldd $1 | tee -a $1.enumdata $1.ldd
echo "" | tee -a $1.enumdata
echo "#### \`objdump -i\`" | tee -a $1.enumdata
objdump -i  $1 | tee -a $1.enumdata $1.objdump
echo "" | tee -a $1.enumdata
echo "#### \`objdump -D\`" | tee -a $1.enumdata
objdump -D $1 | tee -a $1.enumdata $1.objdump
echo ""
echo "If the binary is from a remote machine you need to use \`ldd\`"
echo "Then exfil those libraries and:"
echo "patchelf --set-rpath . $1 # Change the DT_RUNPATH of the executable or library to RUNPATH."
echo "patchelf --set-interpreter ld-linux.so.2 $1 # # Change the dynamic loader ("ELF interpreter") of executable given to INTERPRETER."
echo ""
echo "aW1wb3J0IGFuZ3IKaW1wb3J0IHN5cwoKIyBBdXRob3IgWENUIGZyb20gaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1VblpqNXp6Y0JHNAoKIyBVc2Ugc3ltYm9saWMgZXhlY3V0aW9uIHRvIGV4cGxvcmUgYWxsIGZsb3cgY29udHJvbCBwb3NzaWJpbGl0aWVzIG9mIGEgcHJvZ3JhbQojIFRoZW4gcHJpbnQgb3V0IGFsbCB0aGUgZGVhZGVuZHMgb2YgdGhlc2UgZXhwbG9yZWQgc3RhdGVzCmRlZiBtYWluKGFyZ3YpOgogICAgYmluYXJ5ID0gIkNIQU5HRVRISVMiCiAgICBwcm9qZWN0ID0gYW5nci5Qcm9qZWN0KGJpbmFyeSkKICAgIGluaXQgPSBwcm9qZWN0LmZhY3RvcnkuZW50cnlfc3RhdGUoKQogICAgc2ltdWxhdGlvbl9tYW5hZ2VyID0gcHJvamVjdC5mYWN0b3J5LnNpbWdyKGluaXQpCiAgICBzaW11bGF0aW9uX21hbmFnZXIuZXhwbG9yZSgpCiAgICBmb3Igc3RhdGUgaW4gc2ltdWxhdGlvbl9tYW5hZ2VyLmRlYWRlbmRlZDoKICAgICAgICBwcmludChzdGF0ZS5wb3NpeC5kdW1wcyhzeXMuc3RkaW4uZmlsZW5vKCkpKQoKaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoKICAgIG1haW4oc3lzLmFyZ3YpCgo=" | base64 -d > angr4$1.py
echo ""
sed -i angr4$1.py "s/CHANGETHIS/$1/g"
echo ""
echo "Created angr file ready for use:"
echo ""
cat angr4$1.py
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
