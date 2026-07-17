# V-Rod Airbox Mounting Bushing Full Specifications Document

## Overview

Rubber mounting bushing for the Harley-Davidson V-Rod airbox cover (OEM 11519, "RUBBER MOUNT, AIRBOX COVER"; alternate 11519-A). The bushing snaps into the airbox panel hole via its Ø11 groove; the airbox cover's prong presses into the Ø8 bore, which is flared at the underside for lead-in. Printed hollow in TPU 95A (1 perimeter, 0% infill) to reproduce the compliance of the OEM molded rubber.

## Bushing Specifications

| Parameter | Value |
|-----------|-------|
| Base Flange OD | 20.0 mm |
| Base Flange Height | 3.0 mm |
| Groove Diameter | 11.0 mm |
| Groove Height | 3.0 mm |
| Head Max Diameter (retention lip) | 16.0 mm |
| Head Top-Face Diameter | 13.0 mm |
| Head Taper | Ø16 → Ø13 over 3 mm (~27° from vertical) |
| Overall Height | 9.0 mm |
| Through-Bore | 8.0 mm (straight, exits top face) |
| Bore Flare | Ø12 mouth at bottom face, 45° cone closing to Ø8 by 2 mm |
| Material | TPU 95A |

### Cross Section

```
                 ______________
                /              \          <- head: Ø16 -> Ø13 taper
               |                |            (retention lip over groove)
               |__            __|
                  |          |            <- groove Ø11 x 3mm
     _____________|          |_____________
    |                                      |  <- base flange Ø20 x 3mm
    |____                            ______|
         \                          /     <- bore flare: Ø12 mouth
          \________________________/          -> Ø8 by 2mm up

    Through-bore Ø8 continuous; straight at top, flared at bottom.
    Total height 9mm. All surfaces of revolution about part axis.
```

### Part Markings

`r03` debossed 0.4 mm into the bottom face of the base flange, centered at
7.9 mm radius, glyph height 2.8 mm, mirrored to read correctly when viewing
the part's underside. Marking depth is deliberately shallow: with the
validated 1-perimeter / 0% infill print settings, only the bottom solid skin
(~0.8 mm) carries the mark, and a deeper cut would perforate the hollow part.
(The fit-test article carried a 0.9 mm-deep prototype marking and printed
successfully, so 0.4 mm is conservative.) Name and dimension markings are
omitted — no remaining surface is both large enough and functionally free
(the top face and head engage the cover prong, the groove engages the panel).

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| TPU 95A | **Recommended** | Tested. Hollow single-wall print reproduces OEM rubber compliance; damps airbox cover vibration and survives repeated prong insertion. |
| TPU 85A | Untested | Softer shore would be closer to OEM rubber; likely works with solid infill instead of hollow. |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r03 | 2026-07-17 | Head underside raised 1 mm (groove 2→3 mm, head 4→3 mm, steeper Ø16→Ø13 taper); bore flare mouth widened Ø10.5→Ø12; marking changed to `r03` at 0.4 mm depth; print settings validated (1 perimeter, 0% infill, supports). Fit-tested. |
| r02 | 2026-07-17 | Bore flare moved from top face to bottom face per OEM part. |
| r01 | 2026-07-17 | Initial profiles from OEM part measurement: Ø20×3 base, Ø11 groove, Ø16→Ø13 tapered head, Ø8 bore. Three candidate geometries; grommet-with-groove profile (option B) confirmed against OEM part. |
