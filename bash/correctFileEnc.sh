#!/bin/bash
# https://stackoverflow.com/questions/11316986/how-to-convert-iso8859-15-to-utf8/36619843#36619843
# Liu Gui
# https://stackoverflow.com/users/5557705/li-gui

for i in `iconv -l`
do
   echo $i
   iconv -f $i -t UTF-8 yourfile | grep "hint to tell converted success or not"
done &>/tmp/converted


# My version:
#!/bin/bash

# echo "Enter greppable iconv -l encoding, an array will be built of your grep input: "
# read ENCGREP
# toPOT=$(iconv -l | grep $ENCGREP | tr -d "\n\\," | tr "/" " ")
# make in to a array

DELIM="_"
DIR="directory"
POTENTIAL=(ISO_8859-1 ISO_8859-1:1987 ISO_8859-2 ISO_8859-2:1987 ISO_8859-3 ISO_8859-3:1988 ISO_8859-4 ISO_8859-4:1988 ISO_8859-5 ISO_8859-5:1988 ISO_8859-6 ISO_8859-6:1987 ISO_8859-7 ISO_8859-7:1987 ISO_8859-7:2003 ISO_8859-8 ISO_8859-8:1988 ISO_8859-9 ISO_8859-9:1989 ISO_8859-9E ISO_8859-10 ISO_8859-10:1992 ISO_8859-14 ISO_8859-14:1998 ISO_8859-15 ISO_8859-15:1998 ISO_8859-16 ISO_8859-16:2001)

echo "Enter filepath/filename to decode: " 
echo
read TOCONV
echo "Press any key to continue to view all possible encodings from iconv"
while [ true ] ; do
        read -t 3 -n 1
        if [ $? = 0 ] ; then
                iconv -l
                break
        else
                echo "Awaiting a keypress"
        fi
done
echo "Enter a valid target encoding: "
read TARGET
echo "Enter a file output name: "
read OUTPUTNAME
echo
echo "Preparing Directory and file structure in the /tmp directory" 
echo
rm /tmp/temp_decode_file; rm -r  /tmp/$OUTPUTNAME$DELIM$DIR;
mkdir /tmp/$OUTPUTNAME$DELIM$DIR
cp $TOCONV /tmp/$OUTPUTNAME$DELIM$DIR/temp_decode_file;
TMP=/tmp/$OUTPUTNAME$DELIM$DIR/temp_decode_file;
cd  /tmp/$OUTPUTNAME$DELIM$DIR
echo "Completed file tree and workspace"
echo "Attempting all valid encodings.."
for encoding in "${POTENTIAL[@]}"
do
        echo "Trying..." $encoding
        iconv -f $encoding -t $TARGET < $TMP > $OUTPUTNAME$DELIM$encoding
        wait
done
wait
echo "Task complete please check /tmp/$OUTPUTNAME$DELIM$DIR"
exit;
