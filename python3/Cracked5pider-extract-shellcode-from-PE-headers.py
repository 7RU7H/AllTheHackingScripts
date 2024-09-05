#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import pefile
import argparse

# Credits: https://github.com/Cracked5pider

def main():
    try:

        parser = argparse.ArgumentParser( description = 'Extracts shellcode from a PE.' )
        parser.add_argument( '-f', required = True, help = 'Path to the source executable', type = str )
        parser.add_argument( '-o', required = True, help = 'Path to store the output raw binary', type = str )
        option = parser.parse_args()

        PeExe = pefile.PE( option.f )
        file = open( option.o, 'wb+' )

        for section in PeExe.sections:

            if section.Name.replace( b'\x00', b'' ).decode( 'utf-8' ) == ".text":
                
                print( f"[*] found shellcode [size: {len(section.get_data())} bytes]" )


                file.write( section.get_data() )

                break

        file.close()

    except Exception as e:
        print( '[!] error: {}'.format( e ) )

    return

if __name__ in '__main__':
    main()
