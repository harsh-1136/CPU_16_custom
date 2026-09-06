# CPU_16_custom

A custom-designed 16-bit, single-cycle CPU built from scratch in Verilog — instruction set, decoder, ALU, register file, memory, and branch logic, all designed and wired up module by module rather than following a pre-existing architecture.

## Overview

This project implements a complete single-cycle CPU: every instruction goes through fetch, decode, execute, and writeback within one clock cycle. It supports arithmetic and logic operations, shifts and rotates, signed and unsigned comparison, memory load/store, and conditional branching driven by a dedicated flag register.

Full instruction set documentation — opcode map, sub-instruction encodings, ALU operation codes, and flag definitions — is in [`ISA_reference.pdf`](./ISA_reference.pdf).

## Architecture

| Module | Role |
|---|---|
| `program_counter` | Holds the current instruction address; increments each cycle or loads a branch target |
| `instruction_mem` | 256 x 16-bit instruction ROM, addressed by the PC |
| `main_decoder` | Decodes opcode + mode_bits into control signals (reg_write, alu_src, mem_read, mem_write, mem_to_reg, branch, alu_op, hlt) |
| `reg_file_16` | 16 general-purpose 16-bit registers, two read ports + one write port |
| `ALU` | ADD, SUB, AND, OR, NOT, XOR, MUL, MULS, all four shift/rotate types, signed and unsigned comparison |
| Flag register | Latches zero/carry/sign/overflow/eq/gt/lt only on ADD, SUB, CMP, or CMPS |
| `main_memory` | 256 x 16-bit data RAM for load/store instructions |
| Branch logic | Evaluates latched flags against the branch condition code to decide whether to redirect the PC |
| `final_CPU` | Top-level module wiring everything above into one datapath |

## Repository structure

```
CPU_project.srcs/   Vivado-managed source directory (build artifact)
RTL_Design/          Hand-written Verilog source files (the actual project)
tb/                  Testbenches
CPU_project.xpr      Vivado project file
ISA_reference.pdf    Full instruction set documentation
```

## Instruction format

Every instruction is a 16-bit word: `[15:12]` opcode, `[11:8]` mode_bits or destination register (depends on instruction group), `[7:4]` source register or destination (MOV/Shift), `[3:0]` second source register, 4-bit immediate, or low nibble of a branch target. See `ISA_reference.pdf` for the complete breakdown.

## Status

Core datapath (PC, instruction memory, decoder, register file, ALU, data memory) is implemented and tested. Branching and flag logic are implemented and under active verification. See `ISA_reference.pdf`'s Design Notes section for what's confirmed vs. still open.

## Simulation

Testbenches are in `tb/`. Simulate in Vivado (or another Verilog simulator) with `final_CPU` as the top module and a chosen `instruction_mem.v` test program loaded.
