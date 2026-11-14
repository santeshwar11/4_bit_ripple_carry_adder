# 4-bit Ripple Carry Adder in Verilog

A 4-bit ripple carry adder built from four chained full adders. The carry out of each stage feeds the carry in of the next.

## Files
- src/ripple_adder_4bit.v - design
- tb/tb_ripple_adder_4bit.v - self-checking testbench

## How to simulate
Add the design as a source and the testbench as a simulation source in Vivado, set the testbench as top, and run Behavioral Simulation. The Tcl Console prints PASS when all 512 cases are correct.

## Tools
AMD Vivado 2026.1