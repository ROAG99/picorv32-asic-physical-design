# picorv32-asic-physical-design
ASIC Physical Design of the PicoRV32 RISC-V core using Synopsys Design Compiler, ICC2, and SAED 32nm technology.
# PicoRV32 ASIC Physical Design (RTL-to-GDSII)

[![ASIC](https://img.shields.io/badge/Flow-RTL--to--GDSII-blue)]()
[![Language](https://img.shields.io/badge/HDL-Verilog-orange)]()
[![EDA](https://img.shields.io/badge/EDA-Synopsys-green)]()
[![Technology](https://img.shields.io/badge/Technology-SAED32nm-red)]()

## Overview

This repository presents the complete ASIC Physical Design implementation of the open-source PicoRV32 RISC-V processor using the Synopsys Digital Implementation Flow. The project covers every major stage from RTL synthesis to GDSII generation using industry-standard EDA tools.

The implementation was carried out as part of the GTU–eInfochips VLSI Design Internship under the Chips to Startup Programme.

---

## Project Objectives

- RTL synthesis using Synopsys Design Compiler
- Floorplanning
- Power planning
- Standard cell placement
- Clock Tree Synthesis (CTS)
- Global and detailed routing
- Static Timing Analysis (STA)
- Physical verification
- GDSII generation

---

## ASIC Design Flow

RTL Verilog

↓

Synopsys Design Compiler

↓

Gate-Level Netlist

↓

ICC2 Design Setup

↓

Floorplanning

↓

Power Planning

↓

Placement

↓

Clock Tree Synthesis

↓

Routing

↓

Signoff Verification

↓

Final GDSII

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Synopsys Design Compiler | RTL Synthesis |
| Synopsys IC Compiler II | Physical Design |
| Verilog HDL | RTL Design |
| Tcl | Flow Automation |
| SAED 32nm Library | Standard Cell Technology |

---

## Repository Structure

```
rtl/
scripts/
constraints/
reports/
screenshots/
docs/
```

---

## Implementation Results

✔ RTL synthesis completed

✔ Floorplanning completed

✔ Power mesh generation

✔ Cell placement completed

✔ Clock Tree Synthesis completed

✔ Routing completed

✔ Positive setup and hold timing

✔ Zero LVS shorts

✔ Zero LVS opens

✔ Zero Route DRC violations

✔ GDSII generated

---

## Screenshots

Screenshots of every implementation stage are available inside the screenshots folder.

- RTL Synthesis
- Floorplanning
- Power Planning
- Placement
- CTS
- Routing
- Timing Reports
- Final Layout

---

## Documentation

The complete technical report is available in:

```
docs/Report_final.pdf
```

---
## Acknowledgements

This project uses the open-source PicoRV32 RISC-V processor core as the RTL design.

Original project:
https://github.com/YosysHQ/picorv32

The RTL design is the work of the original PicoRV32 authors.

My contribution focuses on the complete ASIC Physical Design implementation, including:
- RTL synthesis using Synopsys Design Compiler
- Floorplanning
- Power planning
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Physical verification
- GDSII generation
- Tcl automation and implementation documentation















## Author

**Mohammad Tawhid Malek**

B.E. Electronics & Communication Engineering

L.D. College of Engineering

Ahmedabad, India

---

## License

MIT License
