# ECE 51216 - Digital Systems Design Automation
## Homework #5: Complete RTL-to-Logic Design Flow Tutorial

This repository contains materials and scripts for running a complete RTL-to-logic design flow using open-source EDA tools. Students will gain hands-on experience with synthesis, equivalence checking, static timing analysis, and power analysis on a real RISC-V processor design.

---

## Overview

This lab guides you through the essential steps of digital design automation:

1. **RTL Synthesis** - Transform high-level Verilog to gate-level netlists
2. **Logic Equivalence Checking (LEC)** - Verify functional correctness after synthesis
3. **Timing Analysis** - Ensure design meets clock frequency requirements
4. **Power Analysis** - Evaluate power consumption of the synthesized design

### Tools Used

- **Yosys** - Open-source synthesis suite for RTL-to-gate transformation
- **OpenSTA** - Static timing and power analyzer
- **SkyWater 130nm** - Open-source standard cell library
- **RISC-V Core** - 64-bit open-source CPU design files

---

## Important Files

| File | Description |
|------|-------------|
| `script_synth.ys` | Yosys synthesis script |
| `script_equivalence.ys` | Logic equivalence checking script |
| `timingpower.tcl` | OpenSTA timing/power analysis script |
| `verilog/*.v` | Verilog RTL design files |
| `lib/*.lib` | SkyWater 130nm standard cell libraries |
| `ece51216_hw5.pdf` | Complete assignment instructions |

---

## Resources

- [Yosys Manual](http://www.clifford.at/yosys/documentation.html) - Comprehensive synthesis documentation
- [OpenSTA Documentation](https://github.com/The-OpenROAD-Project/OpenSTA) - Timing analysis guide
- [SkyWater PDK](https://github.com/google/skywater-pdk) - Open-source process design kit

---

## Academic Integrity

- **Collaboration:** Discussion with classmates is encouraged
- **Individual Work:** Run all exercises yourself and generate your own solutions
- **No Solution Sharing:** Do not post solutions on the mailing list or elsewhere

---

---

**Course:** ECE 51216 - Digital Systems Design Automation  
**Instructor:** Prof. Anand Raghunathan  
**TA:** Sujay Pandit
**Institution:** Purdue University, School of Electrical and Computer Engineering
