from src.assembler import assemble_program
import argparse


def assemble_file(input_filename, output_filename):
    with open(input_filename, "r") as asm_file:
        assembly_program = asm_file.read()

    machine_code = assemble_program(assembly_program)

    with open(output_filename, "w") as bin_file:
        bin_file.write(machine_code)


def main():
    parser = argparse.ArgumentParser(
        description="Assemble an 8-bit assembly program into machine code."
    )
    parser.add_argument("input", help="Input .asm file path")
    parser.add_argument("output", help="Output .bin file path")

    args = parser.parse_args()

    assemble_file(args.input, args.output)


if __name__ == "__main__":
    main()
