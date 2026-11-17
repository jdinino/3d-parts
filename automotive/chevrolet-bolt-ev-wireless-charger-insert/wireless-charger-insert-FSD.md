# Chevrolet Bolt EV Wireless Charger Insert Full Specifications Document

## Overview

TPU insert for the Chevrolet Bolt EV's console phone slot. It hangs from a 94 × 42 lip on the slot's rim and splits the slot into two pockets: Side A, over the car's wireless charger, and Side B, which carries two hooked bumps that go into holes in the car's slot wall. The charger pocket has no floor, so the phone stands on the car's own slot floor against the charging wall instead of on a layer of TPU.

All dimensions in mm. Directions are as installed: lip on top, Side A = the charger side, Side B = the bump side, ENDs = the two short sides.

## Insert Specifications

| Parameter | Value |
|-----------|-------|
| Overall height | 105.00 |
| Lip | 94.00 × 42.00, 2.00 thick, R10 corners; overhangs the body 4.25 all round |
| Body outside | 85.50 × 33.50 at the lip top → 80.00 × 30.00 at 99.00 below it (6 above the bottom), straight taper on all four walls, R6.0 corners |
| Bottom | R6 round all the way round, spherical corner blends, no seam |
| Wall | 0.75 |
| Cavity | 84.00 × 32.00 at the opening → 78.50 × 28.50 at the tangent line, R5.25 corners |
| Divider | 1.50, full height, leans with the Side A wall |
| Pocket A (charger side) | 16.00 from top to bottom; no floor for 68 of its length (Side A wall ends square 99 below the lip top) |
| Pocket B | 14.50 at the opening → 11.00 at the tangent line; 2.00 floor |
| Seating ribs | 1.00 thick × 2.00 down from the lip underside, outer face 2.285 from the lip edge (1.00 gap to the body wall); Side A 15.00 long, Side B 25.00 long, both centred |
| Bumps (2×, Side B) | 8.00 long, 4.50 out, 9.78 tall; inner edges ±15.50 (31.00 gap), outer edges ±23.50 |
| Mass | 41.7 g TPU 95A |
| Material | TPU 95A |

The lip, body, wall, pocket, divider, rib and bump positions were measured on the r65 mesh; the rest comes from the design record.

### Cross Section

Section across the insert at a bump, as installed:

```
  Side A (charger side)                                  Side B (bump side)
   ______________________________________________________________
  |______________________________________________________________|  lip 42 x 2
      |_|  |                                          |  |_|        seating ribs 1 x 2,
           |                     ||                   |             1.0 off the wall
           |<--- pocket A 16 --->||<- pocket B 14.5 ->|__ _
           |                     ||                   |  | |       bump (see below)
           |                     ||                   |  |/
           |                     ||                   | /
           |                     ||                   |/
           :                     ::                   :
           |                     ||                   |
           |                     ||    pocket B 11    |
           |  open: the phone    ||___________________|
            \ stands on the      |                   /             2.0 floor under B
              car's slot floor   \__________________/
```

### Retention Bumps

Each bump is a slotted hook on the outside of the Side B wall:

```
   wall |
        |   slot   _      leg top, 7.00 below the lip underside
        |         | |
        |         | |     slot 2.50 wide x 3.00 deep (car wall 2 + 0.5 clearance)
        |_________| |     slot floor = catch face, 10.00 below the lip underside
        |           |     outer face 4.50 from the wall, 2.0 leg
        |          /
        |        /        45° ramp back to the wall, 16.78 below the lip underside
        |      /
        |    /
        |  /
        |/
```

The car's slot wall at the bumps is taken as 2 thick, with a hole for the bumps whose upper edge is about 10 below the lip underside. The slot sits where that wall stands, so the hole's edge lands on the slot floor and the leg ends up behind the wall.

### Floor Under the Charger Pocket

Pocket A is 16.00 wide all the way down, and its Side A wall ends square at the round's tangent line, 99 below the lip top, for 68 of the pocket's length. Below that, the phone meets the car's own slot wall, 0.75 further out, and the car's R6 round and hard slot floor. As it slides down, the TPU wall guides it until its bottom edge passes the wall's end; it then drops outward against the car's wall, its corner seats in the car's R6 round, and it lands on hard plastic instead of soft TPU. That is the click when the phone goes in, and the wall's end gives a slight resistance on the way out. Charging works through this opening. Two side effects: small items can fall through the opening into the console below, and the square wall end can rub a phone case.

### Part Markings

"Wireless Charger" engraved 0.4 deep on the Side A lip top, 3.9 tall (DejaVu Sans Bold), centred on the lip band. A 0.6 groove runs along the band's centre line, 2.50 from the lip edge, from 2.5 past each end of the text, around the Side A corners and up both ENDs to their mid-points. The text reads from the driver's seat, with Side B nearest. There is no revision marking.

### Fit Basis

- Top of the slot: printed step gauges; 85.5 × 33.5 was the largest 0.5-mm step that fitted (86 × 34 did not), and R6.0 corners fitted.
- Bottom of the slot: printed rings and 3D-rounded jigs; 80 × 28 seated with room to spare and 80 × 30 was a tight fit, adopted at 6 above the floor with an R6 round below.
- A straight taper between the two fits the car (r37, r43, r51).
- The OEM insert, measured with calipers, is 105 tall with two square bumps on one long side, their top 10 below the lip underside, and seating ribs under the lip on both long sides.

### Source Files

- `wireless-charger-insert-r65.scad` is the OpenSCAD source. It models the part as installed (lip top at z = 0) and flips it 180° about X at the end, so the render comes out in print orientation (lip top on the bed at z = 0, bumps on -Y). Every dimension above is a named parameter at the top of the file.
- `wireless-charger-insert-r65.stl` is its OpenSCAD 2021.01 render (about 2 minutes in CGAL): watertight, every edge shared by exactly two triangles, volume 34,438 mm³. `wireless-charger-insert-r65.3mf` holds the same mesh placed at X 110, Y 110, with no print settings.
- The engraving needs DejaVu Sans Bold (2.37). OpenSCAD substitutes another font without a warning when it cannot find it, and the lettering then changes. On Windows, OpenSCAD 2021.01 only sees fonts installed for all users; a font installed for one account needs `OPENSCAD_FONT_PATH` pointed at that account's font folder.
- r65 was first designed with a Python script (manifold3d) that is not in the repository. The SCAD reproduces that mesh: away from the engraved lip face the two surfaces are within 0.08 mm of each other (99% of points within 0.015 mm), the engraved letter outlines differ by up to 0.19 mm, and the volume differs by 0.04%.

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| TPU 95A | **Recommended** | Every printed revision was TPU 95A. |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r65 | 2026-10-31 | Side B seating rib 1.0 off the wall, the same as Side A. Sent to print; no fit result recorded yet. |
| r64 | 2026-10-31 | Engraving turned 180° to read from the driver's seat; Side B rib 0.5 off the wall. |
| r63 | 2026-10-31 | Side A rib 15 long, 1.0 off the wall. |
| r62 | 2026-10-30 | Side A rib 1.0 off the wall, 22.5 long: too long. |
| r61 | 2026-10-30 | Side A rib against the wall, 22.5 long: too close. |
| r60 | 2026-10-29 | Hook trimmed to the slot plus a 2.0 leg (4.5 out), slot 3 deep, catch back at 10 below the lip underside. |
| r59 | 2026-10-28 | Bump gap 31 (inner edges ±15.5), was 29. |
| r58 | 2026-10-28 | Slotted hook: a 2.50 × 2.0 slot cut into each bump where the car's 2-mm wall stands. |
| r57 | 2026-10-28 | C-hook with a tip rising at the outer end. Rejected, not printed. |
| r56 | 2026-10-24 | Bumps 8 long. |
| r53-r55 | 2026-10-20 to 2026-10-24 | Two-piece upright versions (glued, snap-on collar, skirted lip), closed floors. Printed; r52 preferred. |
| r52 | 2026-10-20 | r51 pre-flipped for lip-down printing (and an upright, closed-floor variant). Rated best in the car: the phone clicks into place. |
| r51 | 2026-10-20 | Bumps 8 out. Works in the car; items can fall through the pocket A opening. |
| r50 | 2026-10-19 | Floor removed under pocket A; the phone stands on the car's slot floor. Charging confirmed. |
| r49 | 2026-10-19 | Bumps 10 long, flipped (square catch face on top, ramp below), organic supports. |
| r48 | 2026-10-19 | Flipped bumps with supports designed into the model. Withdrawn: the supports failed. |
| r47 | 2026-10-19 | r43 with bumps and seating ribs 1.5 from the lip edge. |
| r45-r46 | before 2026-10-19 | One-piece upright with a 1.0 floor, printed with supports. Printed badly; withdrawn. |
| r43 | before 2026-10-19 | Prototype with 0.75 walls, 84 × 32 opening, straight taper, R6 bottom round, printed lip down. Fit confirmed. |
| r01-r42 | before 2026-10-19 | Layout from the OEM part, step gauges and fit jigs for the slot, wall and pocket studies. |
