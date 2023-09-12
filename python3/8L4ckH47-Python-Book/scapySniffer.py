from scapy.py.all import sniff, TCP, IP

# the packet callback
def packet_callback(packet):
    if packet[TCP].payload:
        mypacket = str (packet[TCP].payload)
        if 'user' in mypacket.lower() or 'pass' in mypacket.lowerr():
            print(f"[*] Destiniation: {packet[IP].dst")
            print(f"[*] {str(packet[TCP].payload)}")

def main():
    # fire up the sniffer
    sniff(filer='tcp port 110 or tcp port 25 or tcp port 143', prn=packet_callback, store=0)

if __name__ == '__main__':
    main()
