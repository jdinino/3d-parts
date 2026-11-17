# ChargePoint Home Flex Holster Adapter Full Specifications Document

## Overview

Dock adapter for a ChargePoint Home Flex (CPH50) with a NACS (Tesla) cable and holster insert, for owners who keep a TeslaTap (NACS → J1772 adapter) on the charging handle. A Tesla-shaped stem clicks into the holster ("holster ball") the way a bare NACS handle would, and the other end is a J1772 vehicle inlet cup that the TeslaTap's J1772 nose plugs into and latches on. The handle then hangs in the holster with the TeslaTap left on.

The stem follows the NACS connector nose in Tesla's *North American Charging Standard* TS-0023666 rev 1.1, §5.1 (outer profile, lead-in, draft, latch pocket). The cup follows the J1772 vehicle inlet in SAE J1772 OCT2017, Appendix A (sheets A-1, A-2, A-4). Fit values that differ from the standards were set on real hardware and are marked *[fit]*.

The part is one hollow, open tube from the stem tip to the cup rim, printed stem-down. The only support it needs is under the J1772 latch catch, and that support stands on a ledge inside the cup, not on the bed. The 3MF marks it with a support enforcer.

## Stem Specifications (NACS nose)

| Parameter | Value |
|-----------|-------|
| Outer profile | NACS nose outline (TS-0023666 p.13, scaled from the drawing: the spec does not dimension it) |
| Size at the tip, behind the lead-in (5.5 mm) | 39.8 × 35.1 mm (nominal nose) |
| Size at the latch pocket (20.24 mm) | 40.15 × 35.44 mm (nominal + 0.10 per side) *[fit]* |
| Size from datum C (32.49 mm) to the flare | 40.28 × 35.57 mm |
| Front lead-in | 39° chamfer for the first 1.0 mm, then the real nose's lead-in curve to 5.5 mm |
| Draft | 0.0055 per side per mm up to datum C (as the spec drawings show), constant behind it |
| Straight stem length | 42.46 mm *[fit]* (see Fit Trials) |
| Latch pocket | on the narrow (keyway) side; 10.11 wide × 4.2 deep; front wall 16.94 mm from the tip (spec + 0.2 per wall) |
| Pocket rear wall | floor runs to 24.0 mm, then opens at 40° to the surface (no bridge, so no support) |
| Wall | 3.2 mm (5.8 mm along the pocket side, leaving 1.6 mm behind the pocket) |
| Flare (shoulder) | 40° cone from the stem to the Ø50.4 barrel, 42.46 → 51.30 mm from the tip |
| Flare's first contact | key boss lower corners, 41.84 mm from the tip (24.90 mm from the pocket front wall) |

## Cup Specifications (J1772 inlet)

| Parameter | Value |
|-----------|-------|
| Bore | Ø44.6 mm (inlet Ø44.2 + allowance), 0.8 mm mouth chamfer, open through to the stem |
| Barrel | Ø50.4 mm (standard inlet barrel) |
| Keyway | 8.9 mm wide, floor R25.9, 34.5 mm deep from the rim (inlet: 8.5, R25.6) |
| Key boss | 14 mm wide to R28; every outside edge rounded R2 |
| Latch ramp | 15 mm wide at the top, 19 at the base; starts 2.0 mm behind the rim, full height (R30.0) from 10.0 mm |
| Latch catch face | flat, **21.3 mm from the rim** *[fit]* (standard inlet: 20.1); spans an 11.4 mm slot between two cheeks |
| Surface P (hook landing) | R26.0, from the catch face back to the ledge |
| Support ledge | flat top 31.5 mm from the rim (past the longest standard latch, 29.5); 40° conical underside |
| Overall length | 90.30 mm (stem 42.46 + flare 8.84 + cup 39.00) |
| Volume | 40.8 cm³ |
| Material | PCTG |

### Cross Section

Side view along the axis, as docked (latch ramp on top), holster end on the left:

```
  tip (on the bed)                                                         rim
   |<------------- stem 42.46 ------------>|<-flare->|<------- cup 39.00 ------->|
                                                     ____________________________
                                                    /  latch ramp; catch face    |
   ________________________________________________/   21.3 from the rim         |
  |  stem: NACS nose outline 40.3 x 35.6                                          |
  |  hollow, wall 3.2            open through -->       J1772 bore 44.6          |
  |____   ___________________________________                                     |
       |_|                                   \         keyway in the key boss    |
                                              \__________________________________|
   latch pocket, front wall 16.94             ^
   (the holster's latch tooth clicks in)      flare's first contact, 41.84
                                              (stops on the holster rim)
```

Stops when docked: pulled out, the holster's latch tooth bears on the pocket's front wall; pushed in, the key boss corners at the start of the flare bear on the holster's rim. The distance between the two (pocket front wall to flare's first contact) sets the in/out slop.

### Fit Trials

Every version from r10 on is r10 with one change. Printed and tried in a ChargePoint Home Flex NACS holster with a TeslaTap:

| Rev | Change from r10 | Pocket front wall → flare's first contact | Result |
|-----|-----------------|:----:|--------|
| r13 | tip 5 mm longer | 26.89 mm | Did not click |
| r14 | tip 4 mm longer | 26.89 mm | Did not click |
| r12 | tip 3 mm longer | 26.89 mm | Did not click |
| r10 | — (stem 45) | 26.89 mm | Clicks, 4-5 mm of in/out slop |
| r15 | flare 1 mm nearer the pocket | 25.89 mm | Clicks, less slop |
| **r16** | **flare 2 mm nearer, key boss rounded** | **24.90 mm** | **Clicks, nearly perfect fit** |
| r17 | flare 3 mm nearer | 23.90 mm | Did not click |

What the trials showed: with the tooth latched there is under 3 mm of room between the stem tip and the holster base, so a longer tip bottoms out before the tooth reaches the pocket. Pushing in, the flare on the holster's rim is the stop. Moving the flare toward the pocket in 1 mm steps took up the slop until r17, which stops before the tooth can drop in. The key boss rounding moves the flare's first contact 0.54 mm away from the tip, so r16's stem is 0.54 mm shorter than a plain 2 mm step (45 − 2 − 0.54 = 42.46) to keep the step exact. Steps under 1 mm are inside the print tolerance of this fit.

### Part Markings

`r16` sunk 0.5 mm into the +Y (latch-ramp) side of the internal funnel, 5.5 mm tall (Liberation Sans Bold, which ships with OpenSCAD), read looking into the cup from the rim. Name and dimension markings are omitted: the outside of the stem is the holster fit surface and the cup carries the latch features, so no marking was added that would change the fit-tested part.

### Source Files

- `holster-adapter-r16.scad` is the parametric source, and `holster-adapter-r16.stl` is its OpenSCAD 2021.01 render (about 4 minutes in CGAL). The STL is watertight, with every edge shared by exactly two triangles; its volume is 40,836 mm³.
- `holster-adapter-r16.3mf` is a PrusaSlicer project holding the same mesh as the STL, placed with the plug axis at X 110, Y 110 (the centre of a 220 × 220 bed), with the validated per-object print settings embedded: layer height, perimeters, infill, seam and supports. Temperatures and cooling come from PrusaSlicer's `3D-Fuel Pro PCTG` filament profile; printer, nozzle and brim from your own presets.
- The 3MF also carries a support enforcer, a second volume of the object: a block 11.4 mm wide (the hook slot between the cheeks), from Y 25 mm (inside the surface P pad) out to the ramp top at Y 30 mm, and from the support ledge top (31.5 mm below the rim) to 1.0 mm above the catch face (21.3 mm below the rim). In PrusaSlicer 2.9.7 the support comes out as it does with the automatic settings alone (under the catch only, standing on the ledge, same footprint and height), and the enforcer produces it by itself with automatic supports off. Nothing of the block is printed. The file is marked as a PrusaSlicer 3MF (`slic3rpe:Version3mf`), which PrusaSlicer needs to place the enforcer with the part; other slicers may read the block as part of the model.
- The fit-tested print was made from an earlier export of r16 with different lettering. Away from the lettering, that mesh's vertices are within 0.005 mm of the released STL's surface.

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| PCTG | **Recommended** | Tested: r16 was printed in 3D-Fuel Pro PCTG and fits. Tough and not brittle at the latch catch and the stem's pocket edge, which take the clicks. |
| PETG | Untested | Similar stiffness; expected to fit the same. |
| TPU | Not recommended | The part holds by rigid edges (holster tooth on the pocket wall, TeslaTap hook on the catch face); the fit allowances were sized for a rigid material. |
| PLA | Not recommended | Softens in a hot garage or in sun on an outdoor charger. |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r17 | 2026-11-16 | Flare 3 mm nearer the pocket. Printed: did not click. Not released. |
| r16 | 2026-11-16 | Flare's first contact 2 mm nearer the pocket than r10 (stem 42.46); every outside edge of the key boss rounded R2. Printed in PCTG: clicks, nearly perfect fit. |
| r15 | 2026-11-16 | Flare 1 mm nearer the pocket (stem 44). Printed: clicks, less slop. |
| r12-r14 | 2026-11-13 | Tip 3, 4 and 5 mm longer than r10. Printed: none clicked. |
| r11 | 2026-11-13 | Square rear wall in the stem pocket (second support needed). Not printed. |
| r10 | 2026-11-13 | Stem 45 mm. Printed: clicks, 4-5 mm of in/out slop. |
| r09 | 2026-11-13 | Stem 51 mm. |
| r08 | 2026-11-12 | Hollow, open-through tube; stem 56 mm with the real nose's lead-in; flat latch catch at 21.3 with a support ledge. Printed: fits, stem longer than needed. |
| r04-r07 | 2026-11-12 | Lead-in, pocket and support-free studies (solid). Not printed. |
| r03 | 2026-11-12 | First version from the official specs. Stem and cup fit-test pieces printed: stem 0.15 under nominal wobbled and did not click; catch at 20.0 left 2 mm of play at the TeslaTap latch. |
| r01-r02 | 2026-11-12 | Early layouts. Not printed. |
