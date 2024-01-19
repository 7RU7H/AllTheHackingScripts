import angr
import sys

# Author XCT from https://www.youtube.com/watch?v=UnZj5zzcBG4
# For Kali and other just use:
# python3 -m venv myenv
# source myenv/bin/activate
# pip install angr

# Use symbolic execution to explore all flow control possibilities of a program
# Then print out all the deadends of these explored states
def main(argv):
    binary = "./angel_A"
    project = angr.Project(binary)
    init = project.factory.entry_state()
    simulation_manager = project.factory.simgr(init)
    simulation_manager.explore()
    for state in simulation_manager.deadended:
        print(state.posix.dumps(sys.stdin.fileno()))

if __name__ == '__main__':
    main(sys.argv)
