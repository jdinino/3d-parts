# Chevrolet Bolt EV Wireless Charger Insert

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

3D printable TPU insert for the Chevrolet Bolt EV's console phone slot, with an open-bottom pocket that lets the phone sit directly on the car's wireless charger.

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/wireless-charger-insert-r65/wireless-charger-insert-r65.stl">Download the Insert</a></h2>
<h3 align="center"><a href="wireless-charger-insert-r65.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/automotive/chevrolet-bolt-ev-wireless-charger-insert/render.html">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-TPU_95A-brightgreen" alt="Material: TPU 95A">
  <img src="https://img.shields.io/badge/Revision-r65-blue" alt="Revision: r65">
</p>

## Compatible Part Numbers

| Part Number | Type |
|-------------|------|
| **N/A** | Replaces the OEM insert in the Bolt EV's console phone slot; GM part number not yet identified |

## Compatible Vehicle Models

### Chevrolet
- **Bolt EV** — console phone slot with the wireless charger (model years not yet confirmed)

## Specifications

| Parameter | Value |
|-----------|-------|
| **Overall Height** | 105 mm |
| **Lip** | 94 × 42 mm, 2 mm thick, R10 corners |
| **Body** | 85.5 × 33.5 mm under the lip → 80 × 30 mm at 6 mm above the bottom, straight taper |
| **Bottom** | R6 round all the way round, spherical corners |
| **Wall** | 0.75 mm |
| **Charger Pocket (Side A)** | 16 mm wide, open at the bottom |
| **Second Pocket (Side B)** | 14.5 mm at the top → 11 mm at the bottom, 2 mm floor |
| **Divider** | 1.5 mm |
| **Retention Bumps (Side B)** | 2 × 8 mm long, 4.5 mm out, 31 mm apart; 2.5 × 3 mm slot for the car's slot wall, catch 10 mm below the lip underside |
| **Seating Ribs** | 1 × 2 mm under the lip, 1 mm off the body wall; Side A 15 mm, Side B 25 mm |
| **Mass** | 41.7 g |

The body was sized with printed step gauges and fit jigs in the car's slot; see the [FSD](wireless-charger-insert-FSD.md) for how each dimension was found.

## Print Settings

There is no validated slicer profile for this revision yet. [`wireless-charger-insert-r65.3mf`](https://github.com/jdinino/3d-parts/releases/download/wireless-charger-insert-r65/wireless-charger-insert-r65.3mf) holds the same mesh as the STL in print orientation, placed at the bed centre (X 110, Y 110), with no print settings embedded.

### Insert - TPU 95A

| Setting | Required | Value |
|---------|:--------:|-------|
| Material | | TPU 95A |
| Orientation | ✓ | **Lip face down on the bed (as in the STL and 3MF)** |
| Supports | ✓ | **Organic, only under the two bump catch faces (slot floors and leg tops); use support enforcers** |
| Support Top Z Distance | | 0.2-0.3 mm |
| Other Settings | | Not recorded for this revision; use your TPU 95A profile |

**Required settings, and why:**

- **Orientation** — printed upright, the lip's 4.25 mm overhang and the seating ribs need supports, and the upright one-piece prints came out badly (r45, r46). Printed lip down, the lip sits on the bed and only the bump catch faces overhang.
- **Supports** — lip down, the slot floors and leg tops of the two bumps are flat faces pointing at the bed. Supports designed into the model failed (r48); organic supports under those faces work. Nothing else needs support.

### Material Notes

| Part | Material | Status | Notes |
|------|----------|--------|-------|
| Insert | TPU 95A | **Recommended** | Every printed revision was TPU 95A |

## Files

| File | Description |
|------|-------------|
| `wireless-charger-insert-r65.stl` | 3D printable model (print orientation, lip down) |
| `wireless-charger-insert-r65.3mf` | Same mesh, placed on the bed; no print settings |
| `wireless-charger-insert-r65.scad` | OpenSCAD parametric source (DejaVu Sans Bold font required) |
| `wireless-charger-insert-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

## Installation

1. Print the insert lip down in TPU 95A, then remove the supports from the two bump slots.
2. Push the insert into the console slot with the bumps (Side B) towards the slot wall with the hole for the bumps, until the lip rests on the rim and the bumps go into the hole.
3. Slide the phone into the charger pocket (Side A, under the "Wireless Charger" engraving). It drops past the end of the pocket wall onto the car's slot floor and clicks into place.

Small items can fall through the open bottom of the charger pocket into the console below, and the square end of the pocket wall can rub a phone case.

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r43 | before 2026-10-19 | Body fit confirmed in the car: 85.5 × 33.5 under the lip → 80 × 30 near the bottom, R6 bottom round, 0.75 walls |
| r47 | 2026-10-19 | Retention bumps and seating ribs added |
| r50-r51 | 2026-10-19 to 2026-10-20 | Floor removed under the charger pocket so the phone sits on the car's charger (charging confirmed); bumps 8 mm out |
| r52-r55 | 2026-10-20 to 2026-10-24 | r52, pre-flipped for lip-down printing, rated best in the car: the phone clicks into place. r53-r55 (two-piece and closed-floor experiments) were not preferred |
| r56 | 2026-10-24 | Bumps 8 mm long |
| r58-r59 | 2026-10-28 | Slotted-hook bumps for the car's 2 mm slot wall; bump gap 31 mm |
| r60 | 2026-10-29 | Hook trimmed to 4.5 mm out, slot 3 mm deep, catch 10 mm below the lip underside |
| r61-r63 | 2026-10-30 to 2026-10-31 | Side A seating rib moved to 1 mm off the wall and shortened to 15 mm |
| r64 | 2026-10-31 | Engraving turned to read from the driver's seat; Side B rib 0.5 mm off the wall |
| **r65** | **2026-10-31** | **Side B rib 1 mm off the wall, the same as Side A. No fit result recorded yet** |

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- Bolt EV model year
- Photo of fitment
- Whether the bumps seat fully and the hook holds
- Any dimensional adjustments needed

## Keywords

`chevrolet` `chevy` `bolt` `bolt ev` `wireless charger` `wireless charging` `phone holder` `phone slot` `console insert` `center console` `tpu` `3d print` `replacement part`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2Fautomotive%2Fchevrolet-bolt-ev-wireless-charger-insert&label=Views&countColor=%23263759" alt="Views" />
</p>
