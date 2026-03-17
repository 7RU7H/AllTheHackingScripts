import time
import os

# Simple Rick & Morty themed ASCII frames
frames = [
r"""
   ____  _  _  _  _    __  __ ___  _  _ 
  |  _ \| || || || |  |  \/  | _ \| \| |
  | |_) | __ || __ |  | |\/| |  _/| .` |
  |____/|_||_||_||_|  |_|  |_|_|  |_|\_|
  
     Wubba Lubba Dub Dub!
""",
r"""
   ____  _  _  _  _    __  __ ___  _  _ 
  |  _ \| || || || |  |  \/  | _ \| \| |
  | |_) | __ || __ |  | |\/| |  _/| .` |
  |____/|_||_||_||_|  |_|  |_|_|  |_|\_|
  
       Rick is here!
""",
r"""
   ____  _  _  _  _    __  __ ___  _  _ 
  |  _ \| || || || |  |  \/  | _ \| \| |
  | |_) | __ || __ |  | |\/| |  _/| .` |
  |____/|_||_||_||_|  |_|  |_|_|  |_|\_|
  
       Morty panicking!
"""
]

# Simulated root flag
root_flag = "FLAG{Wubba_Lubba_Dub_Dub_You_Found_Me}"

try:
    for i in range(10):  # Loop 10 times
        os.system('cls' if os.name == 'nt' else 'clear')  # Clear terminal
        print(frames[i % len(frames)])
        print("\nRoot Flag: ", root_flag)
        time.sleep(0.5)
except KeyboardInterrupt:
    print("\nAnimation stopped!")