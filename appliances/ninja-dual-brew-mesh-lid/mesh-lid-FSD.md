# Ninja Dual Brew Coffee Reservoir Mesh Lid Full Specifications Document

## Overview

Breathable mesh variant of the Ninja Dual Brew coffee reservoir lid. The solid top surface is replaced with a fine honeycomb mesh pattern that allows water to evaporate while preventing debris from entering the reservoir. Derived from the original design by louspinuso. Uses import-based approach to preserve the complex non-rectangular contour of the original lid.

## Lid Specifications

| Parameter | Value |
|-----------|-------|
| Overall Length | 152mm |
| Overall Width | 96mm |
| Overall Height | 17mm |
| Contour | Complex non-rectangular (wider in middle) |
| Wall Thickness | 3mm |
| Mesh Thickness | 2mm |
| Rim Height | 16mm (Z=1 to Z=17) |
| Mesh Border | 5mm |
| Mesh Area | Fills center opening (~130 × 89mm) |
| OEM Reservoir Part | 129KKW300 |
| Material | TPU |

## Mesh Specifications

| Parameter | Value |
|-----------|-------|
| Pattern | Honeycomb (hexagonal) |
| Hex Hole Circumradius | 1.0mm |
| Hex Hole Diameter (vertex-vertex) | 2mm |
| Hex Hole Width (flat-flat) | ~1.7mm |
| Hex Wall Parameter | 0.8mm |
| Min Wall (vertex-vertex) | ~1.1mm |
| Min Wall (flat-flat) | ~1.4mm |
| Grid Column Spacing | ~3.12mm |
| Grid Row Spacing | ~2.7mm |

### Cross Section (Side View)
```
Z=17  ┌──────────────────────────────────────────┐
      │  ░░░░░░ mesh (2mm) ░░░░░░░░░░░░░░░░░░░  │
Z=15  │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  │
  ────┤                                          ├────  Z=5
  │   │                                          │   │
  │   │           (open interior)                │   │
  │   │                                          │   │  16mm rim
  │   │                                          │   │
  └───┘                                          └───┘  Z=1
──────────────────────────────────────────────────────── Z=0
←3mm→                                            ←3mm→
←──────────────── 152mm ──────────────────────────────→

Note: Contour is non-rectangular (wider in middle, narrower at ends)
```

### Top View (Mesh Pattern)
```
┌────────────────────────────────────────────────┐
│ ┌────────────────────────────────────────────┐ │
│ │  ┌──────────────────────────────────────┐  │ │
│ │  │  ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡  │  │ │
│ │  │   ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡   │  │ │
│ │  │  ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡  │  │ │
│ │  │   ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡   │  │ │
│ │  │  ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡ ⬡  │  │ │
│ │  └──────────────────────────────────────┘  │ │
│ │                mesh border (5mm)           │ │
│ └────────────────────────────────────────────┘ │
│                  wall (3mm)                    │
└────────────────────────────────────────────────┘
```

### Design Features
- Honeycomb mesh pattern maximizes open area while maintaining structural strength
- 5mm solid border around mesh prevents edge weakness
- 3mm perimeter walls for rigid rim structure
- 16mm rim depth for secure seating on reservoir
- Complex contour imported directly from reference STL to match reservoir geometry exactly
- Revision stamp engraved in solid border zone

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| TPU | **Recommended** | Flexible, durable, food safe, heat tolerant |
| PETG | Acceptable | Rigid, heat resistant |
| PLA | Not recommended | Brittle mesh walls, may warp near heat |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r02 | 2026-03-03 | Redesigned from louspinuso reference geometry with import-based approach |
| r01 | 2026-03-03 | Initial release - parametric honeycomb mesh variant |
