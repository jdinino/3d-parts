# TrackPoint Cap Full Specifications Document

## Overview

Replacement TrackPoint pointing stick cap for Dell Latitude E7440 laptop keyboards. Features flattened dome profile with square stem hole for press-fit attachment.

## Cap Specifications

| Parameter | Value |
|-----------|-------|
| Total Height | 3.75mm |
| Outer Diameter | 8.65mm |
| Outer Ring Height | 0.72mm |
| Inner Diameter | 7.65mm |
| Inner Height | 3.0mm |
| Square Hole | 3.1 x 3.1mm |
| Square Hole Depth | 1.9mm |
| Hole Draft Angle | 0.8 degrees |
| Bottom Chamfer | 0.4mm |
| Step Fillet Radius | 0.5mm |
| Material | TPU |

### Cross Section
```
    <--- 8.65mm --->
    +---------------+
    |               |  0.72mm (outer ring)
    +--+---------+--+
       |         |     3.0mm (inner cylinder)
       |  [   ]  |     <- 3.1mm square hole, 1.9mm deep
       |         |
       +---------+
       <- 7.65mm ->
```

### Profile Detail
- Stepped cylinder: wider base ring with narrower upper cylinder
- Fillet at step transition for stress relief
- Bottom edge chamfer for bed adhesion during printing
- Square hole with draft angle and entry chamfer for stem fit

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| TPU | **Recommended** | Soft grip, flexible press-fit, comfortable finger feel |
| PETG | Not recommended | Too rigid, uncomfortable for pointing stick use |
| PLA | Not recommended | Too rigid, brittle over time |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r01 | 2026-02-05 | Initial release - flattened dome, TPU optimized |
