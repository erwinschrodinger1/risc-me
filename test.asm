# Program to calculate the sum of numbers from 1 to 10 in risc-me
# Initialize registers
LOAD R1 1      # Initialize R1 with 1 (start value)
LOAD R2 10     # Initialize R2 with 10 (end value)
LOAD R3 0      # Initialize R3 (accumulator) with 0
LOAD R4 1      # Initialize R4 (increment) with 1

# Perform addition using repeated ADD instructions
ADD R3 R1      # Add R1 to accumulator R3 (1 + 0 = 1)
ADD R1 R4      # Increment R1 by 1 (1 + 1 = 2)
ADD R3 R1      # Add R1 to accumulator R3 (2 + 2 = 4)
ADD R1 R4      # Increment R1 by 1 (2 + 1 = 3)
ADD R3 R1      # Add R1 to accumulator R3 (3 + 3 = 6)
ADD R1 R4      # Increment R1 by 1 (3 + 1 = 4)
ADD R3 R1      # Add R1 to accumulator R3 (4 + 4 = 8)
ADD R1 R4      # Increment R1 by 1 (4 + 1 = 5)
ADD R3 R1      # Add R1 to accumulator R3 (5 + 5 = 10)
ADD R1 R4      # Increment R1 by 1 (5 + 1 = 6)
ADD R3 R1      # Add R1 to accumulator R3 (6 + 6 = 12)
ADD R1 R4      # Increment R1 by 1 (6 + 1 = 7)
ADD R3 R1      # Add R1 to accumulator R3 (7 + 7 = 14)
ADD R1 R4      # Increment R1 by 1 (7 + 1 = 8)
ADD R3 R1      # Add R1 to accumulator R3 (8 + 8 = 16)
ADD R1 R4      # Increment R1 by 1 (8 + 1 = 9)
ADD R3 R1      # Add R1 to accumulator R3 (9 + 9 = 18)
ADD R1 R4      # Increment R1 by 1 (9 + 1 = 10)
ADD R3 R1      # Add R1 to accumulator R3 (10 + 10 = 20)

# Store the sum (R3) at memory address 50
STORE R3 50

# End of program
JMP R0         # End of program
