# Ninja Dual Brew Coffee Reservoir Mesh Lid Full Specifications Document

## Overview

Breathable mesh variant of the Ninja Dual Brew coffee reservoir lid. The solid top surface is replaced with a fine honeycomb mesh pattern that allows water to evaporate while preventing debris from entering the reservoir. Derived from the original design by louspinuso, using the Foster auto-filler lid (Printables 410550) as reference geometry. Uses import-based approach to preserve the rounded rectangle contour of the original lid.

## Lid Specifications

| Parameter | Value |
|-----------|-------|
| Overall Length | 149.9mm |
| Overall Width | 75.1mm |
| Overall Height | 23mm |
| Contour | Rounded rectangle (corner radius 9mm) |
| Wall Thickness | 7.2mm (outer to inner step) |
| Mesh Thickness | 2mm |
| Depression Depth | 2.5mm (auto-filler cutout fill) |
| Rim Height | 20.5mm (Z=2.5 to Z=23) |
| Mesh Border | 5mm |
| Mesh Area | Fills center opening (~125.4 × 50.1mm) |
| Inner Step | 7.2-142.6 × 7.5-67.6mm (at Z=2.5) |
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
←──────────────── 149.9mm ─────────────────────────────→
Z=0   ┌──────────────────────────────────────────────────┐
      │  ░░░░░░░░░░ mesh (2mm) ░░░░░░░░░░░░░░░░░░░░░░  │
Z=2.5 ├────┐                                        ┌────┤
      │    │          (open interior)               │    │
      │    │                                        │    │  20.5mm rim
Z=13  ├────┘                                        └────┤
      │                 (open interior)                  │
Z=23  └──────────────────────────────────────────────────┘
      ←7.2mm→                                      ←7.2mm→

Note: Z=0 is the mesh face (top when installed), Z=23 is the rim end
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
- 7.2mm perimeter walls for rigid rim structure
- 20.5mm rim depth for secure seating on reservoir
- Rounded rectangle contour imported directly from reference STL to match reservoir geometry exactly
- Auto-filler depression (2.5mm) fully filled before mesh cut

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
