import os
import time
import random
from colorama import init, Fore, Style

# Initialize colorama for ANSI colors
init(autoreset=True)

# Root flag
root_flag = "FLAG{CHURRO_DANCE_AZURA_ALII}"

# ANSI gradient colors for holographic effect
colors = [Fore.CYAN, Fore.BLUE, Fore.MAGENTA]

# Base ASCII churro balloon man template
base_churro = [
    r"    (\_/)      🌟",
    r"    (•_•)    CHURRO",
    r"    /   💃\   ¡OLÉ!"
]

# Symbols to add for chaos/heavy-metal effect
chaos_symbols = ["⚡", "🔥", "💃", "🤘", "*", "✦"]

def generate_frame(base, chaos_level=3):
    """
    Generate a single frame with derpy movement and random chaos symbols
    """
    frame = []
    for line in base:
        # Random horizontal offset to simulate wiggly arms
        offset = " " * random.randint(0, 3)
        new_line = offset + line

        # Randomly inject chaos symbols
        for _ in range(chaos_level):
            pos = random.randint(0, len(new_line)-1)
            sym = random.choice(chaos_symbols)
            # Replace or insert symbol
            new_line = new_line[:pos] + sym + new_line[pos+1:] if pos < len(new_line) else new_line + sym

        frame.append(new_line)
    return frame

def print_frame(frame, color_index):
    """
    Print frame with ANSI color
    """
    color = colors[color_index % len(colors)]
    for line in frame:
        print(color + line)
    # Pulsing root flag
    pulse_color = random.choice(colors)
    print("\n" + pulse_color + Style.BRIGHT + root_flag + Style.RESET_ALL)

def clear_console():
    os.system('cls' if os.name == 'nt' else 'clear')

def main():
    chaos_level = 4
    frame_delay = 0.5
    color_index = 0

    try:
        while True:
            frame = generate_frame(base_churro, chaos_level=chaos_level)
            clear_console()
            print_frame(frame, color_index)
            color_index += 1
            # Slightly vary delay to simulate playful rhythm
            time.sleep(frame_delay + random.uniform(-0.1, 0.1))
    except KeyboardInterrupt:
        clear_console()
        print("¡El churro inflable ha terminado su baile! Flag segura para Azura Alii.")

if __name__ == "__main__":
    main()
