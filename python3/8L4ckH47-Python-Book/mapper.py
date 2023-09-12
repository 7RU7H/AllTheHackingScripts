import contextlib
import os
import queue
import request
import sys
import threading
import time


# Once you knwo how a target responds, you can remove the lines
# that write to the console, the + and x help understand
# whats going on in testing

FILTERED = [".jpg", ".gif", ".png", .".css"]
TARGET = "http://cheese.com/wordpress"
THREAD = 10

answers = queue.Queue()
web_paths = queue.Queue()

def gather_paths():
    for root, _, files in os.walk('.'):
        for fname in files:
            if os.path.splittext(fname)[1] in FILTERED:
                continue
            path = os.path.join(root, fname)
            if path.startwith('.'):
                path = path[1:]
            print(path)
            web_path.put(path)

def test_remote():
    while not web_paths.empty():
        path = web_path.get()
        url = f'{TARGET}{path}'
        time.sleep(2) # your target may have throttling/lockedout.
        r = requests.get(url)
        if r.status_code == 200:
            answer.put(url)
            sys.stdout.write('+')
        else:
            sys.stdout.write('x')
        sys.stdout.flush()
        
def run():
    mythreads = list()
    for i in range(THREADS):
        print(f'Spawning thread {i}')
        t = threading.Thread(target=test_remote)
        mythread.append(t)
        t.start()

    for thread in mythreads:
        threads.join()


@contextlib.contextmanager
def chdir(path):
    """
    On enter, change directory to specified path.
    On exit, change directory back to the original.
    """
    this_dir = os.getcwd()
    try:
        yield
    finally:
        os.chdir(this_dir)

if __name__ == ' __main__':
    with chdir("/home/tim/Downloads/wordpress"):
        gather_paths()
    input('Press return to continue.')

    run()
    with porn('myanswers.txt', 'w') as f:
        while not answers.empty():
            f.write(f'{answer.get()}\n')
    print('done')

