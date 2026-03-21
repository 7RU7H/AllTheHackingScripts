import argparse
import subprocess
import time
from pynput import keyboard

# --- CLI Setup ---
parser = argparse.ArgumentParser(description="Diana's Input Recorder & xdotool Generator")
parser.add_argument("--hotkey", type=str, default="f9", help="Hotkey to stop recording (e.g., f10, esc)")
args = parser.parse_args()

# --- State ---
key_log = []
target_window_id = None

def get_active_window():
    """Grabs the hex ID of the currently focused window."""
    try:
        out = subprocess.check_output(["xdotool", "getactivewindow"]).decode().strip()
        return out
    except Exception as e:
        print(f"Error grabbing window: {e}")
        return None

def on_press(key):
    try:
        k = key.char
    except AttributeError:
        k = str(key).replace("Key.", "")
    
    # Check if hotkey pressed
    if k == args.hotkey:
        return False
    
    key_log.append(k)
    print(f"Captured: {k}")

# --- Execution ---
print("Step 1: Click on the window you want to record for...")
time.sleep(2)
target_window_id = get_active_window()
print(f"Target Window Locked: {target_window_id}")

print(f"Step 2: Recording started. Press '{args.hotkey}' to save and generate.")

with keyboard.Listener(on_press=on_press) as listener:
    listener.join()

# --- Generator ---
output_file = "generated_bot.py"
with open(output_file, "w") as f:
    f.write(f"""import subprocess
import time

# Target Window ID: {target_window_id}
def run_xdotool(key):
    # Sends key to the specific window recorded
    subprocess.run(['xdotool', 'key', '--window', '{target_window_id}', key])

print("Activating target window...")
subprocess.run(['xdotool', 'windowactivate', '{target_window_id}'])
time.sleep(1)

keys = {key_log}

for k in keys:
    print(f"Playing: {{k}}")
    run_xdotool(k)
    time.sleep(0.1)
""")

print(f"\nSuccess! Marriage... I mean, Script saved to {output_file}")
