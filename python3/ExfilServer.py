import os, glob, argparse, sys, signal
from http.server import SimpleHTTPRequestHandler, HTTPServer
from urllib.parse import unquote

# Moddified code from https://tryhackme.com/room/ssrfhr 
# Added more secure interface handling
# Write Data to stdout with verbose
# 

class CustomRequestHandler(SimpleHTTPRequestHandler):

    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')  # Allow requests from any origin
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        content_length = self.headers.get('Content-Length')
        if content_length != None:
            content_length = int(content_length)
            get_data = self.rfile.read(content_length).decode('utf-8')
        else:
            get_data = ''
        
        self.wfile.write(b'So long, and thanks for all the GET requests')
        get_data = self.rfile.read(content_length).decode('utf-8')
        if global_verbose:
             print(f'We have recieved a GET request!\nReceived data:\{get_data}')
        
        filename = self.generate_valid_filename('get')
        with open(filename, 'w') as file:
            file.write(get_data + '\n')
            print(f"GET data written to {filename}")
		
	
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length).decode('utf-8')
        self.send_response(200)
        self.end_headers()

        if global_verbose:
            print(f'We have recieved a POST request!\nReceived data:\n{post_data}')
        
        filename = self.generate_valid_filename('post')
        with open('post_data.html', 'a') as file:
            file.write(post_data + '\n')
            print(f"POST data written to {filename}")

    def generate_valid_filename(self, prefix, extension=".html"):
        i = 1
        while True:
            filename = f"{prefix}_data_{i}{extension}"
            if not os.path.exists(filename):
                return filename
            i += 1

def signal_handler(sig, frame):
    print("You pressed CTRL+C!")
    print("Happy Hacking!")
    sys.exit(0)

# This is very dirty, but works will happily accept improvements to this:
global_verbose = False 

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Python3 - Data Receiver - Just Gift your data to please the server!')
    parser.add_argument('-v', action='store_true', default=False, help='Print output to stdout')
    parser.add_argument('-i', type=str, default='127.0.0.1', help='Interface to bind to')
    parser.add_argument('-p', type=int, default=8000, help='Port to listen on')
    args = parser.parse_args()
    # Gloriously bad
    if args.v != False:
        global_verbose = True

    signal.signal(signal.SIGINT, signal_handler)
    server_address = (args.i, args.p)
    httpd = HTTPServer(server_address, CustomRequestHandler)
    print(f"Server running on http://{args.i}:{args.p}/")
    httpd.serve_forever()
