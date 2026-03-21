import os
import sys
import time
import math

# ANSI color codes
colors = [
    "\033[91m",  # red
    "\033[93m",  # yellow
    "\033[92m",  # green
    "\033[96m",  # cyan
    "\033[94m",  # blue
    "\033[95m",  # magenta
]

reset = "\033[0m"

width = 60
height = 20

def clear():
    os.system("cls" if os.name == "nt" else "clear")

def draw_frame(t):
    for y in range(height):
        line = ""
        for x in range(width):
            # Wave effect
            wave = math.sin(x * 0.2 + t) + math.cos(y * 0.3 + t)

            if wave > 0.5:
                color = colors[(x + y + int(t)) % len(colors)]
                line += color + "#" + reset
            else:
                line += " "
        print(line)

try:
    t = 0
    while True:
        clear()
        print("ROOT FLAG ACTIVE\n")
        draw_frame(t)
        t += 0.2
        time.sleep(0.05)

except KeyboardInterrupt:
    print("\nExiting cleanly.")
