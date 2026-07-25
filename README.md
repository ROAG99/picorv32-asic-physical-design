# picorv32-asic-physical-design
ASIC Physical Design of the PicoRV32 RISC-V core using Synopsys Design Compiler, ICC2, and SAED 32nm technology.
# PicoRV32 ASIC Physical Design (RTL-to-GDSII)

[![ASIC](https://img.shields.io/badge/Flow-RTL--to--GDSII-blue)]()
[![Language](https://img.shields.io/badge/HDL-Verilog-orange)]()
[![EDA](https://img.shields.io/badge/EDA-Synopsys-green)]()
[![Technology](https://img.shields.io/badge/Technology-SAED32nm-red)]()

## 🚀 Project at a Glance

| | |
|---|---|
| 🖥️ Core | PicoRV32 (RISC-V RV32IMC) |
| 🔬 Technology | SAED 32nm |
| 🛠️ Tools | Synopsys DC & ICC2 |
| ⏱️ Frequency | 200 MHz |
| 📐 Core Utilization | 59.38% |
| ⚡ Estimated Power | 4.83 mW |
| 🌳 Clock Sinks | 1,557 |
| 📦 Output | GDSII |
| ✅ Timing | Setup & Hold Closed |
| ✅ Signoff | 0 DRC, 0 LVS Shorts, 0 LVS Opens |

## 📊 Implementation Specifications

| Category | Specification |
|-----------|---------------|
| **Processor Core** | PicoRV32 (Open-Source RISC-V RV32IMC) |
| **RTL Language** | Verilog HDL |
| **Technology Node** | SAED 32nm Standard Cell Library |
| **Implementation Flow** | RTL → Synthesis → Floorplan → Power Planning → Placement → CTS → Routing → Signoff → GDSII |
| **EDA Tools** | Synopsys Design Compiler, Synopsys IC Compiler II |
| **Operating Environment** | Linux (ICC2 U-2022.12-SP3) |

---

## ⚙️ Design Specifications

| Parameter | Value |
|-----------|------:|
| Target Clock Frequency | **200 MHz** |
| Clock Period | **5 ns** |
| Standard Cells | **~9,800** |
| Clock Sinks | **1,557 Flip-Flops** |
| Signal Nets | **8,136** |
| Core Utilization | **59.38%** |
| Cell Area | **26,466–26,474 µm²** |
| Total Core Area | **44,574.82 µm²** |

---

## ⏱️ Timing Summary

| Metric | Result |
|--------|--------|
| Setup WNS | **+0.11 ns** |
| Hold WNS | **+0.07 ns** |
| Total Negative Slack (TNS) | **0.00 ns** |
| Violating Endpoints (NVE) | **0** |
| Timing Closure | ✅ Achieved |

---

## 🌳 Clock Tree Summary

| Parameter | Value |
|-----------|------:|
| CTS Method | NBUFF-based Clock Tree Synthesis |
| Clock Routing Layers | M6–M7 (NDR Applied) |
| Global Skew (Fast Corner) | **0.17 ns** |
| Global Skew (Slow Corner) | **0.28 ns** |
| Maximum Clock Latency | **0.53 ns** |
| Clock Tree Quality | ✅ Timing Clean |

---

## ⚡ Power Distribution Network

| Parameter | Value |
|-----------|------:|
| Power Mesh Layers | M8 / M9 |
| Standard Cell Rails | M1 |
| Power Strap Width | **0.20 µm** |
| Strap Pitch | **4.80 µm** |
| Estimated Total Power | **≈4.83 mW** |

---

## 📐 Physical Verification

| Verification | Status |
|-------------|--------|
| Setup Timing | ✅ PASS |
| Hold Timing | ✅ PASS |
| Route DRC | ✅ 0 Violations |
| LVS Shorts | ✅ 0 |
| LVS Opens | ✅ 0 |
| Floating Routes | ✅ 0 |
| GDSII Generated | ✅ Yes |
| SPEF Extraction | ✅ Fast & Slow Corners |

---

## 📁 Deliverables

- Gate-Level Netlist (`picorv32.v`)
- Final GDSII Layout (`picorv32.gds`)
- SPEF Files (Fast & Slow)
- SDC Constraints
- QoR Reports
- Timing Reports
- Clock QoR Reports
- Route DRC Reports
- LVS Reports

---

## 🏆 Key Achievements

- Complete RTL-to-GDSII ASIC implementation of the PicoRV32 RISC-V processor.
- Successful timing closure at **200 MHz** with positive setup and hold slack.
- Achieved **59.38%** core utilization while maintaining routing feasibility.
- Generated a clean clock tree for **1,557 clock sinks** using NDR-based CTS.
- Produced a DRC-clean and LVS-clean routed layout with successful GDSII generation.




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
