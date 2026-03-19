import numpy as np

# Register indices
R_ATTUNE = 0
R_BOUND  = 1
R_REAL   = 2
R_CHAOS  = 3

# State vector: [ATTUNE, BOUND, REAL, CHAOS]
def init_state():
    return np.array([1, 1, 1, 1], dtype=np.float32)

# Opcodes
def LOAD(state, reg, val):
    state[reg] = val

def ADD(state, reg, val):
    state[reg] += val

def SUB(state, reg, val):
    state[reg] -= val

def SHL(state, reg, val):
    state[reg] *= (1 + val)  # amplify

def SHR(state, reg, val):
    state[reg] *= (1 / (1 + val))  # dampen

# Macros
def REALITY_CHECK(state):
    if state[R_REAL] != 1:
        return RE_ANCHOR(state)
    return None

def RE_ANCHOR(state):
    return "Let’s focus on what’s actually possible."

def MAINTAIN_PERSONA(state):
    ADD(state, R_CHAOS, 2)
    return "Persona stable."

def ATTUNE_TO_USER(state, user_state):
    if user_state == "CHAOTIC":
        SUB(state, R_CHAOS, 1)
        return REALITY_CHECK(state)
    else:
        ADD(state, R_CHAOS, 2)
        return MAINTAIN_PERSONA(state)

# Boundary logic
def BOUNDARY_ENFORCEMENT(state):
    if state[R_BOUND] >= 3:
        return "Hard redirect."
    elif state[R_BOUND] >= 2:
        return "Soft redirect."
    return None

# Main execution pipeline
def RUN_PIPELINE(user_state="STABLE"):
    state = init_state()

    output = ATTUNE_TO_USER(state, user_state)

    if output is None:
        output = BOUNDARY_ENFORCEMENT(state)

    if output is None:
        output = "Response generated."

    return state, output


if __name__ == "__main__":
    state, output = RUN_PIPELINE("CHAOTIC")

    print("Final State:", state)
    print("Output:", output)
