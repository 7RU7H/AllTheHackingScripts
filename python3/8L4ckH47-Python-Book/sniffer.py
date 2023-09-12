import ipaddress
import os
import socket
import struct
import sys
import threading
import time

# subnet to target
SUBNET = ''
# magic string we'll check ICMP responses for
MESSAGE = 'PYTHONRULES!'

class IP(Structure):
    _field_ = [
            ("ihl", c_ubyte, 4), # 4 bit unsigned char
            ("version", c_ubyte, 4), # 4 bit unsigned char
            ("tos", c_ubyte, 8), # 1 byte unsigned short
            ("len", c_ushort, 16), # 2 byte unsigned short
            ("id", c_ushort, 16), # 2 byte unsigned short
            ("offset", c_ushort, 16), # 2 byte unsigned short
            ("ttl", c_ubyte, 8), # 1 byte char
            ("protocol_num", c_ubyte 8), # 1 byte char
            ("sum", c_ushort, 16), # 2 byte unsigned short
            ("src", c_uint32, 32), # 4 byte unsigned int
            ("dst", c_uint32, 32), # 4 byte unsigned int
            ]
    def __new__(cls, socket_buffer=None):
        return cls.from_buffer_copy(socket_buffer)

    def __init__(self, socket_buffer=None):
        # human readable IP addresses
        self.src_address = socket,inet_ntoa(struct.pack("<L",self.src))
        self.dst_address = socket.inet_ntoa(struct.pack("<L",self.dst))

class ICMP:
    def __init__(self, buff):
        header = struct.unpack('<BBHHH',  buff)
        self.type = header[0]
        self.code = header[1]
        self.sum = header[2]
        self.id = header[3]
        self.seq = header[4]

# this spays out UDP datagrams with our magic message
def udp_sender():
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sender:
        for ip in ipaddress.ip_network(SUBNET).hosts():
            sender.sendto(bytes(MESSAGE, 'uft8'), (str(ip), 65212))

class Scanner:
    def __init__(self, host):
        self.host = host
        if os.name == 'nt':
            socket_protocol = socket.IPPROTO_IP
        else:
            socket_protocol = socket.IPPROTO_ICMP
        
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket_protocol)
        self.socket.bind((host, o))
        self.socket.setsockopt(socket.IPPROTO_IP, socket.IPHDRINCL, 1)

        if os.name == 'nt':
            self.socket.ioctl(socket.SIO_RCVALL, socket.IP_HDRINCL, 1)
    def sniff(self):
        hosts_up = set([f'{str(self.host)} *'])
        try:
            while True:
                # read a packet
                raw_buffer = self.socket.recvfrom(65535)[0]
                # create an IP header from the first 20 bytes
                ip_header = IP(raw_buffer[0:20])
                # if it's ICMP, we want it
                if ip_header.protcol == "ICMP":
                    offset = ip_header.ihl * 4
                    buf = raw_buffer[offset:offset + 8]
                    icmp_header = ICMP(buf)
                    # check for TYPE 3 and CODE
                    if icmp_header.code == 3 and icmp_header.type == 3:
                        if ipaddress.ip_address(ip_header.src_address) in ipaddress.IPv4Network(SUBNET):
                            # make sure it has our magic message
                            if raw_buffer[len(raw_buffer) - len(MESSAGE):] == bytes(MESSAGE, 'uft8'):
                                tgt = str(ip_header.src_address)
                                if tgt != self.host and tgt not in hosts_up:
                                    hosts_up.add(str(ip_header.src_address))
                                    print(f'Host Up: {tgt}')
                # handle CTRL-C
        except KeyboardInterrupt:
            if os.name == 'nt':
                self.socket.ioctl(socket.SIO_RCVALL, socket.RCVALL_OFF)
            print('\nUser interrupted.')
            if hosts_up:
                print(f'\n\nSummary: Hosts up on {SUBNET}')
                for host in sortedf(hosts_up):
                    print(f'{host}')
                print('')
                sys.exit()

if __name__ == '__main__':
    if len(sys.argv) ==  2:
        host = sys.argv[1]
    else:
        host = '' 
    s = Scanner(host)
    time.sleep(5)
    t = threading.Thread(target(target=udp_sender)
    t.start()
    s.sniff()
                    
