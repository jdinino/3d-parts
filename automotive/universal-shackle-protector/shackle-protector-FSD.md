# Shackle Protector Full Specifications Document

## Overview

Half-torus shackle protector with C-channel cross-section, designed to fit standard 3/4" D-ring or bow shackles. Reduces noise and prevents paint/surface damage from shackle contact.

## Protector Specifications

| Parameter | Value |
|-----------|-------|
| Center Hole Diameter | 40mm |
| C-Channel Outer Radius | 9mm |
| C-Channel Diameter | 18mm |
| C-Channel Inner Radius | 6.5mm |
| Wall Thickness | 2.5mm |
| Gap Angle | 80° |
| Flat Band Width | 5mm |
| Fillet Radius | 1mm |
| Major Radius (tube path) | 29mm |
| Overall Width | ~71mm |
| Overall Height | ~35mm |
| Side Depth | ~18mm |
| Material | TPU 95A |

### Cross Section

```
        GAP (80°)
        /     \
       |       |
      | |     | |   <- Wall 2.5mm
      | |     | |
       | |   | |    <- r_out = 9mm
        | |_| |     <- r_in = 6.5mm
         |___|

    Flat band (5mm) on top and bottom
    of outer surface for embossed text
```

### Variants

| Variant | C-Channel Radius | Wall | Side Depth |
|---------|-----------------|------|------------|
| Lean (18mm) | 9mm | 2.5mm | 18mm |
| Reference (26mm) | 13mm | 5.3mm | 26mm |

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| TPU 95A | **Recommended** | Flexible, absorbs impact, snaps onto shackle via C-channel stretch |
| TPU 85A | Acceptable | Softer, easier snap-on but less durable |
| PETG | Not recommended | Too rigid, C-channel won't flex to snap onto shackle |
| PLA | Not recommended | Brittle, no flex, will crack |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| **r01** | **2026-04-15** | **Initial design: half-torus, C-channel profile, flat bands, embossed text, two variants** |
