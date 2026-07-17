# Harley-Davidson V-Rod Airbox Mounting Bushing

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

3D printable TPU replacement for the Harley-Davidson V-Rod airbox cover mounting bushing (OEM 11519) — the rubber grommet the airbox cover prongs press into, frequently lost when the cover is removed.

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/airbox-bushing-r03/11519-r03.stl">Download the Bushing</a></h2>
<h3 align="center"><a href="11519-r03.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/automotive/harley-davidson-v-rod-airbox-bushing/render.html">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-TPU_95A-brightgreen" alt="Material: TPU 95A">
  <img src="https://img.shields.io/badge/Revision-r03-blue" alt="Revision: r03">
</p>

## Compatible Part Numbers

| Part Number | Type |
|-------------|------|
| **11519** | Current OEM (RUBBER MOUNT, AIRBOX COVER) |
| 11519-A | Alternate |

## Compatible Motorcycle Models

### Harley-Davidson
- **VRSC V-Rod family** (2002+) — airbox cover mounting
- Later VRSC models also use this grommet for the coolant overflow bottle mount — verify against your model-year parts catalog

## Specifications

| Parameter | Value |
|-----------|-------|
| **Base Flange OD** | 20 mm |
| **Base Flange Height** | 3 mm |
| **Groove (panel snap)** | Ø11 × 3 mm |
| **Head (retention lip)** | Ø16 → Ø13 taper |
| **Overall Height** | 9 mm |
| **Through-Bore** | Ø8, flared to Ø12 at underside |

## Print Settings

### Bushing - TPU 95A

| Setting | Value |
|---------|-------|
| Layer Height | 0.2 mm |
| Wall Count | **1** |
| Infill | **0%** |
| Print Speed | 20-25 mm/s |
| Nozzle Temp | 225-230°C |
| Bed Temp | 45-50°C |
| Cooling | 50-70% |
| Orientation | Base down |
| Supports | **Required** — a single perimeter cannot bridge the head underside over the groove; supports tear cleanly out of TPU |

The 1-perimeter / 0% infill combination is deliberate, not a draft setting: it prints the bushing as a hollow rubber shell, which is what makes a 95A filament squish like the softer OEM molded part. Printing solid produces a bushing too stiff to snap into the panel or accept the cover prong.

### Material Notes

| Part | Material | Status | Notes |
|------|----------|--------|-------|
| Bushing | TPU 95A | **Recommended** | Tested with hollow print settings above |
| Bushing | TPU 85A | Untested | Closer to OEM durometer; may allow solid print |
| Bushing | PLA/PETG/ABS | Not recommended | Rigid — cannot snap in or damp vibration |

## Files

| File | Description |
|------|-------------|
| `11519-r03.stl` | 3D printable model |
| `11519-r03.scad` | OpenSCAD parametric source |
| `airbox-bushing-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

## Installation

1. Print in TPU 95A per settings above; remove supports from the groove and flare
2. Press the bushing head-first into the airbox panel hole until the Ø11 groove snaps into the panel
3. Press the airbox cover prong into the Ø8 bore — the flared underside provides the lead-in
4. A drop of adhesive between flange and panel is a common V-Rod owner trick to keep the grommet from walking out with the cover

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r01 | 2026-07-17 | Initial candidate profiles from OEM part measurement |
| r02 | 2026-07-17 | Bore flare relocated to bottom face |
| **r03** | **2026-07-17** | **Head raised 1 mm (groove 3 mm), flare widened to Ø12, hollow print settings validated, fit-tested** |

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- V-Rod model and year
- Photo of fitment
- Any dimensional adjustments needed

## Keywords

`11519` `11519-A` `harley-davidson` `harley` `v-rod` `vrsc` `vrsca` `vrscb` `vrscaw` `vrscdx` `vrscf` `airbox` `air box` `airbox cover` `grommet` `bushing` `rubber mount` `overflow bottle` `tpu` `motorcycle` `3d print` `replacement part`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2Fautomotive%2Fharley-davidson-v-rod-airbox-bushing&label=Views&countColor=%23263759" alt="Views" />
</p>
