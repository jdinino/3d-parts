# Harley-Davidson V-Rod Clutch Bleeder Tool Full Specifications Document

## Overview

Clutch bleeder tool for the Harley-Davidson V-Rod secondary clutch actuator. During the bleed procedure the OEM bleeder screw (HD part 36757-01K) is removed from the secondary clutch actuator bleed port; this tool is then threaded into that port and accepts a vinyl bleeder hose over the dome and stem. Fluid flows through the 2 mm through-bore into the hose during bleeding, keeping DOT brake fluid off paint and frame. After bleeding, the tool is removed and the OEM bleeder screw is reinstalled. **This is a tool, not a part of the motorcycle. It does not perform the OEM screw's sealing function — it is a fluid-routing aid used only during the bleed procedure.**

## Tool Specifications

| Parameter | Value |
|-----------|-------|
| Thread | M5 × 0.8 (ISO 60° metric) |
| Threaded Shaft Length | 12 mm |
| Threaded Shaft Major Diameter | 5.0 mm |
| Threaded Shaft Minor Diameter | 4.134 mm |
| Hex Grip Across Flats | 8 mm |
| Hex Grip Across Corners | 9.238 mm |
| Hex Grip Height | 3 mm |
| Hex Countersink Chamfer (45°) | 2.552 mm |
| Curved Over-Hex Taper | 2.5 mm (cosine, AF→stem) |
| Stem Diameter | 5 mm |
| Stem Length | 5 mm |
| Under-Dome Cone | 1 mm (D5→D7, 45°) |
| Dome | 7 mm full hemisphere |
| Through-Bore | 2 mm (full length) |
| Overall Length | ~29.55 mm |
| Material | PLA |

### Cross Section

```
                                    ___
                                  /     \              <- Dome (D7, hemisphere)
                                 |   .   |
                                 |___|___|             <- Bore exits at apex
                                   |   |
                                   /   \               <- Under-dome cone (45°, 1mm)
                                  |     |
                                  |  .  |              <- Stem (D5, H=5mm)
                                  |  .  |
                                  |     |
                                /         \            <- Curved cosine taper (2.5mm)
                               |           |
                              /=============\          <- Hex grip (AF=8, H=3mm)
                              \=============/
                               \           /
                                \         /            <- 45° countersink chamfer (2.55mm)
                                 |       |
                                 |||||||||             <- M5 × 0.8 threaded shaft
                                 |||| | ||                 (D=5, L=12mm, bore=2mm)
                                 |||||||||
                                 |||| | ||
                                 |||||||||

         Through-bore: 2mm continuous from threaded tip through dome apex.
         Threads: ISO 60° external, no taper, bevel at hex side only.
```

### Part Markings

The shipped STL is printed without engraved markings — at M5 hex scale (~4.6 mm flats) FDM bridging artifacts make the letters illegible at standard layer heights. The OpenSCAD source has an optional `EMBOSS_TEXT` parameter that adds "DO NOT TORQ" / "DO NOT TORQ" across the six hex flats (sequence: `DO`, `NOT`, `TORQ`, `DO`, `NOT`, `TORQ` at 30°, 90°, 150°, 210°, 270°, 330°).

To enable: set `EMBOSS_TEXT = true` in `36757-01B-r01.scad` (line 75) and re-export the STL. Recommended only if printing at ≥1.5× scale or with a 0.2 mm nozzle and 0.08 mm layer height.

The interactive viewer (`render.html`) shows the embossed variant for reference even though the shipped STL is plain — this is intentional, so the visualization documents the marking layout that the SCAD source supports.

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| PLA | **Recommended** | Tested. Used at zero torque (threaded in by hand only). Brief DOT brake fluid contact during bleed procedure. Tool is removed after bleed. |
| PETG | Acceptable | More chemical-resistant if tool stays installed across long bleed sessions. Threads slightly looser due to higher shrink. |
| ABS | Acceptable | Better solvent resistance. Dimensional shrink (~0.7%) may affect M5 thread fit — consider scaling X/Y by 1.005. |
| TPU | Not recommended | Too flexible — threads will deform even when finger-installed. |
| Nylon | Acceptable | Highest fluid resistance, but moisture absorption affects thread tolerance and bed adhesion is harder. |

## Functional Notes

- **Zero torque — finger install only.** This is a fluid-routing fitting, not a fastener. Thread it in by hand until it bottoms out; do not apply any wrench torque. FDM-printed M5 threads will strip immediately under load.
- **Brief fluid contact only.** PLA degrades under prolonged DOT brake fluid exposure (months, not minutes). For overnight bleeds use PETG or ABS.
- **Through-bore must remain open.** Verify the 2 mm bore is clear after print — bridging artifacts inside the bore will block fluid flow.
- **Print orientation matters.** Threads-down, dome-up gives the best thread quality. The dome and curved taper print support-free in this orientation.
- **Hex grip is for finger purchase only.** It exists to make the tool easier to thread in/out by hand; a wrench should never touch it.

## Print Quality Checks

Before slicing, verify:

1. **Seam position is set to Random.** Aligned or sharpest-corner seams put every layer's start/stop point on the same radial line, gashing every thread along that line. The M5 will not engage cleanly with an aligned seam.
2. **Z-hop is enabled (≥0.4 mm).** The part has a small first-layer footprint and a tall, narrow profile — without Z-hop the nozzle will drag across the dome during travel moves and pull the print off the bed. The brim alone is not enough to resist nozzle drag at this scale.

After printing, verify:

1. M5 thread tip starts cleanly (no elephant's foot smearing the first thread)
2. No vertical seam scar runs continuously down the threaded shaft (if you see one, your slicer is using aligned seam — re-slice with Random)
3. Through-bore is unobstructed (sight line through the part)
4. Hex grip flats are square — rocking during print produces rounded corners that won't give finger purchase
5. Dome surface is smooth — layer artifacts here are cosmetic but may impede fluid path

If the part rocks loose mid-print: print 3-4 copies on the bed at once for added footprint, or use a sacrificial print pad.

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| **r01** | **2026-05-06** | **Initial design: M5×0.8 threaded shaft, hex grip with 45° countersink, cosine over-hex taper, 5mm stem, 7mm hemisphere dome, 2mm through-bore. PLA tested on V-Rod.** |
