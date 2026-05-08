# Harley-Davidson V-Rod Secondary Clutch Actuator Bleeder Tool

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

3D printable bleeder tool for the Harley-Davidson V-Rod secondary clutch actuator. Used during the clutch bleed procedure to route fluid through a vinyl hose into a catch container, keeping DOT brake fluid off paint and frame. **This is a service tool, not a part of the motorcycle — it does not seal the bleed port and is never a substitute for the OEM bleeder screw (HD 36757-01K).**

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/clutch-bleeder-tool-r02/36757-01B-r02.stl">Download the Bleeder Tool</a></h2>
<h3 align="center"><a href="36757-01B-r02.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/automotive/harley-davidson-v-rod-clutch-bleeder/render.html">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-PLA-brightgreen" alt="Material: PLA">
  <img src="https://img.shields.io/badge/Revision-r02-blue" alt="Revision: r02">
</p>

## Compatible Part Numbers

| Part Number | Type |
|-------------|------|
| **36757-01B** | This printed bleeder tool (B = bleed) |
| 36757-01K | Harley-Davidson OEM bleeder screw fitted to the V-Rod secondary clutch actuator — listed for searchability. The printed bleeder tool fits the same M5×0.8 bleed port but does **not** perform the screw's sealing function. |

## Compatible Motorcycle Models

### Harley-Davidson
- **2002-2004 VRSCA** V-Rod
- **2004 VRSCB** V-Rod
- **2005-2006 VRSCSE** CVO V-Rod

## Specifications

| Parameter | Value |
|-----------|-------|
| **Thread** | M5 × 0.8 (ISO metric) |
| **Threaded Shaft Length** | 12 mm |
| **Hex Grip (across flats)** | 8 mm |
| **Hex Grip Height** | 3 mm |
| **Stem Diameter** | 5 mm |
| **Stem Length** | 5 mm |
| **Dome Diameter** | 7 mm (hemisphere) |
| **Through-Bore** | 2 mm |
| **Overall Length** | ~30 mm |

## Print Settings

### Bleeder Tool - PLA

| Setting | Value |
|---------|-------|
| **Nozzle Diameter** | **0.2 mm strongly recommended.** A 0.4 mm nozzle prints, but the M5×0.8 thread crests are only 0.43 mm radial — a 0.2 mm nozzle resolves them as discrete ridges instead of smearing them into a coarse helix. Set extrusion width to 0.20–0.22 mm. |
| Layer Height | 0.08 mm with 0.2 mm nozzle, 0.12 mm with 0.4 mm nozzle (0.16 mm acceptable, threads will be coarser) |
| Wall Count | 4 |
| Infill | 100% |
| Print Speed | 15-20 mm/s outer, 50 mm/s inner |
| First Layer Speed | 12 mm/s |
| Nozzle Temp | 205-215°C (215°C first layer, 220°C for silk PLA) |
| Bed Temp | 70°C (full print) |
| Cooling | Off for first 5 layers, then 100% |
| Brim | 15 mm wide, 8 outline loops |
| Orientation | Threads down, dome up |
| Supports | None required |
| **Z-Hop** | **0.4 mm — REQUIRED.** Small first-layer footprint means the brim is the only thing holding the part to the bed. Without Z-hop, the nozzle drags across the dome on travel moves and rips the part off the build plate (silk PLA especially). Enable Z-hop on every retract. PrusaSlicer: Printer Settings → Extruder → Lift Z. |
| Retraction | 1.0-1.5 mm direct drive, 4-5 mm Bowden |
| **Seam Position** | **Random — REQUIRED.** An aligned or sharpest-corner seam places the layer-change scar on a single radial line down the shaft, gashing every thread along that line and ruining the M5 fit. Random seam distributes the artifact around the helix. |

### Material Notes

| Part | Material | Status | Notes |
|------|----------|--------|-------|
| Bleeder Tool | PLA | **Recommended** | Tested. Brief DOT brake fluid contact only — zero-torque, threads in by hand, not a permanent part. |
| Bleeder Tool | PETG | Acceptable | More chemical-resistant if leaving installed during long bleed sessions |
| Bleeder Tool | ABS | Acceptable | Better fluid resistance, dimensional shrink may affect M5 thread fit |

## Files

| File | Description |
|------|-------------|
| `36757-01B-r02.stl` | 3D printable model |
| `36757-01B-r02.scad` | OpenSCAD parametric source (BOSL2 required) |
| `clutch-bleeder-tool-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

## Installation

<p align="center">
  <img src="https://placehold.co/600x400/1a1a2e/4fc3f7?text=Fitment+Photo+Coming+Soon" alt="Fitment Photo Placeholder" width="600">
</p>

1. Print bleeder tool in PLA per settings above
2. Remove the OEM bleeder screw from the secondary clutch actuator (refer to V-Rod service manual for chassis-specific location)
3. Thread the bleeder tool's M5 × 0.8 shaft into the now-empty bleed port by hand until it bottoms out — **zero torque, do not tighten**. The tool only needs to be threaded enough to direct fluid into the hose; it is not a sealing fastener.
4. Slide a length of clear vinyl bleeder hose (≈3–4 mm ID) over the dome and stem; route the other end into a catch container
5. Bleed the clutch per the V-Rod service manual procedure — fluid travels through the 2 mm through-bore into the hose, keeping the workspace clean
6. Unscrew the bleeder tool by hand and reinstall the OEM bleeder screw before riding

> ⚠️ **Zero torque, service tool only.** Do **not** apply any wrench torque — the M5 thread is FDM-printed and will strip immediately under load. Thread it in by hand. This is a temporary fluid-routing fitting, never a substitute for the OEM bleeder screw. Always reinstall the original screw after the bleed is complete.

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r01 | 2026-05-06 | Initial design: M5×0.8 threaded shaft, 8mm hex grip, curved cosine taper, 5mm stem, 7mm hemisphere dome, 2mm through-bore. Tested on V-Rod. |
| **r02** | **2026-05-07** | **Embossed `DO NOT TORQ` text enabled on the six hex flats (CW reading order). Recommends 0.2 mm nozzle / 0.08 mm layer height for legibility.** |

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- V-Rod model and year (VRSCA / VRSCB / VRSCSE)
- Photo of fitment in the bleed port
- Any dimensional adjustments needed

## Keywords

`36757-01B` `36757-01K` `harley-davidson` `harley` `v-rod` `vrsca` `vrscb` `vrscse` `cvo` `clutch` `bleeder` `bleeder tool` `secondary clutch actuator` `hydraulic clutch` `motorcycle` `service tool` `special tool` `m5` `3d print`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2Fautomotive%2Fharley-davidson-v-rod-clutch-bleeder&label=Views&countColor=%23263759" alt="Views" />
</p>
