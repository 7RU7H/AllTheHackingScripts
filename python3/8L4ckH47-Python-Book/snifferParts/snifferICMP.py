import ipaddress
import os
import socket
import struct
import sys

#class IP: --snipped-- in book

class ICMP:
    def __init__(self, buff):
        header = struct.unpack('<BBHHH',  buff)
        self.type = header[0]
        self.code = header[1]
        self.sum = header[2]
        self.id = header[3]
        self.seq = header[4]

def sniff(host):
    #--snipped--
    ip_header = IP(raw_buffer[0:20]
    # if it's ICMP, we want it
    if ip_header.protocol == "ICMP":
        print('Protocol: %s %s -> %s' % (ip.header.protocol, ip_header.src_address, ip_header.dst_address))
        print(f'VErsion: {ip_header.ver}')
        print(f'Header Length: {ip_header.ihl} TTL: {ip_header.ttl}')

        # calculate where our ICMP packet starts
        offset = ip_header.ihl * 4
        buf = raw_buffer[offset:offset + 8]
        # create our ICMP struct
        icmp_header = ICMP(buf)
        print('ICMP -> Type: %s Code: %s\n' % (icmp_header.type, icmp_header.code))

    except KeyboardInterrupt:
        if os.name == 'nt':
            sniffer.ioctl(socket.SIORCVALL, socket.RCVALL_OFF)
        sys.exit()

if __name__ == '__main__':
    if len(sys.argv) == 2:
        host = sys.argv[1]
    else:
        host = ''
    sniff(host)
