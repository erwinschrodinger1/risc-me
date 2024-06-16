# Define the opcodes and registers
opcodes = {
    "ADD": "000",
    "SUB": "001",
    "AND": "010",
    "OR": "011",
    "LOAD": "100",
    "STORE": "101",
    "JMP": "110",
    "BEQ": "111",
}

registers = {
    "R0": "000",
    "R1": "001",
    "R2": "010",
    "R3": "011",
    "R4": "100",
    "R5": "101",
    "R6": "110",
    "R7": "111",
}


# Function to convert an address to an 8-bit binary string with leading zeros
def address_to_bin(address):
    return format(int(address), "08b")


# Function to assemble a single line of assembly code
def assemble_line(line):
    try:
        parts = line.split()
        print(parts)
        instruction = parts[0]
        opcode = opcodes[instruction]

        if instruction in ["ADD", "SUB", "AND", "OR"]:
            Rdest = registers[parts[1]]
            Rsrc = registers[parts[2]]
            return f"{opcode}{Rdest}{Rsrc[0:2]}"

        elif instruction in ["LOAD", "STORE"]:
            Rreg = registers[parts[1]]
            address = address_to_bin(parts[2])
            return f"{opcode}{Rreg}00\n{address}"

        elif instruction == "JMP":
            Rreg = registers[parts[1]]
            return f"{opcode}{Rreg}00"

        elif instruction == "BEQ":
            Rsrc = registers[parts[1]]
            address = address_to_bin(parts[2])
            return f"{opcode}{Rsrc}00\n{address}"

        else:
            raise ValueError(f"Unknown instruction: {instruction}")
    except:
        raise ValueError(f"Unknown instruction: {instruction}")


# Function to assemble a complete program
def assemble_program(program):
    machine_code = []

    for line in program.splitlines():
        line = line.strip()
        if line == "" or line.startswith("#"):
            continue

        machine_code.append(assemble_line(line))

    return "\n".join(machine_code)
