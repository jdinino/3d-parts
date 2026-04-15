# D-Ring Shackle Protector Full Specifications Document

## Overview

Half-torus D-ring shackle protector with C-channel cross-section, designed to fit standard 3/4" D-ring or bow shackles. Reduces noise and prevents paint/surface damage from shackle contact.

## Shared Specifications

| Parameter | Value |
|-----------|-------|
| Center Hole Diameter | 40mm |
| Gap Angle | 80° |
| Flat Band Width | 5mm |
| Fillet Radius | 1mm |
| Material | TPU 95A |

### Cross Section

```
        GAP (80°)
        /     \
       |       |
      | |     | |   <- Wall
      | |     | |
       | |   | |    <- r_out
        | |_| |     <- r_in
         |___|

    Flat band (5mm) on top and bottom
    of outer surface for embossed text

    TOP BAND (name side):
      "HALF-TORUS SHACKLE PROTECTOR"
      Centered on arc, reads left-to-right when viewed from above

    BOTTOM BAND (spec side):
      "CENTER HOLE: 40MM  |  C-CHANNEL: {dia}MM"
      Pipe character "|" at top dead center of arc
      Text flows outward from pipe in both directions
      Reads left-to-right when part is flipped upside down
```

## Lean Variant (18mm) — `d-ring-shackle-protector-r01.stl`

| Parameter | Value |
|-----------|-------|
| C-Channel Diameter | 18mm |
| C-Channel Outer Radius | 9mm |
| C-Channel Inner Radius | 6.5mm |
| Wall Thickness | 2.5mm |
| Major Radius (tube path) | 29mm |
| Overall Width | ~71mm |
| Overall Height | ~35mm |
| Side Depth | ~18mm |

## Reference Variant (26mm) — `reference-d-ring-shackle-protector.stl`

| Parameter | Value |
|-----------|-------|
| C-Channel Diameter | 26mm |
| C-Channel Outer Radius | 13mm |
| C-Channel Inner Radius | 7.7mm |
| Wall Thickness | 5.3mm |
| Major Radius (tube path) | 33mm |
| Overall Width | ~79mm |
| Overall Height | ~39mm |
| Side Depth | ~26mm |

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
