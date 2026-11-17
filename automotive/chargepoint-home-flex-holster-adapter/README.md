# ChargePoint Home Flex Holster Adapter

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

Dock adapter that lets a ChargePoint Home Flex's NACS (Tesla) handle hang in its holster with a TeslaTap (NACS → J1772 adapter) still on it: a Tesla-shaped stem clicks into the holster ball, and the TeslaTap plugs into and latches on a J1772 inlet cup at the other end.

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/holster-adapter-r16/holster-adapter-r16.stl">Download the Adapter</a></h2>
<h3 align="center"><a href="holster-adapter-r16.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/automotive/chargepoint-home-flex-holster-adapter/render.html">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-PCTG-brightgreen" alt="Material: PCTG">
  <img src="https://img.shields.io/badge/Revision-r16-blue" alt="Revision: r16">
</p>

## Compatible Hardware

| Hardware | Compatibility |
|----------|---------------|
| **ChargePoint Home Flex (CPH50), NACS cable and holster insert** | Tested |
| **TeslaTap (NACS → J1772 adapter)** | Tested |
| Other NACS → J1772 adapters | Untested: the latch catch is tuned to the TeslaTap's hook |

## Compatible Charger Models

### ChargePoint
- **Home Flex (CPH50)** with the NACS (Tesla) connector and NACS holster insert
- Other ChargePoint chargers that take the same NACS holster insert should fit, but are untested

### Adapter on the handle
- **TeslaTap** NACS → J1772 (has its own latch on the J1772 end)

## Specifications

| Parameter | Value |
|-----------|-------|
| **Overall Length** | 90.3 mm |
| **Stem** | NACS nose outline, 40.3 × 35.6 mm, 42.5 mm straight |
| **Stem Latch Pocket** | 10.1 mm wide × 4.2 mm deep, front wall 16.94 mm from the tip |
| **J1772 Bore** | Ø44.6 mm |
| **Barrel** | Ø50.4 mm |
| **Keyway** | 8.9 mm wide, 34.5 mm deep |
| **Latch Catch Face** | 21.3 mm from the rim |
| **Wall** | 3.2 mm, hollow and open from tip to rim |

The stem follows the NACS connector nose in Tesla's TS-0023666 §5.1; the cup follows the J1772 vehicle inlet in SAE J1772 Appendix A. The stem length and the catch face were tuned on real hardware; see the [FSD](holster-adapter-FSD.md) for the fit trials.

## Print Settings

The validated profile ships as [`holster-adapter-r16.3mf`](https://github.com/jdinino/3d-parts/releases/download/holster-adapter-r16/holster-adapter-r16.3mf) — a PrusaSlicer project with the layer height, walls, infill, seam and support settings below embedded on the object. It was fit-tested in 3D-Fuel Pro PCTG with PrusaSlicer's generic `3D-Fuel Pro PCTG` filament profile (the one PrusaSlicer lists for non-Prusa printers; Prusa printers get their own versions of it, at 260°C), which sets the temperatures and cooling below; printer, nozzle and brim come from your own presets. The table below summarizes it.

### Adapter - PCTG

| Setting | Required | Value |
|---------|:--------:|-------|
| Layer Height | | 0.2 mm |
| Wall Count | | 4 |
| Infill | | 15% |
| Print Speed | | Your print preset; the filament profile caps flow at 8 mm³/s |
| Nozzle Temp | | 255°C |
| Bed Temp | | 80°C |
| Cooling | | Auto: 0% on layers over 20 s, up to 40% on shorter layers; off for first 3 layers; 80% on bridges |
| Seam | | Aligned |
| Brim | | Filament dependent (the first layer is a 3.2 mm wide ring) |
| Orientation | ✓ | **Stem tip on the bed, cup opening up** |
| Supports | ✓ | **On, everywhere (not build plate only); overhang threshold 45° (48° or less); snug, 0.2 mm contact, 75% XY** |
| Don't Support Bridges | ✓ | **Off** |

**Required settings, and why:**

- **Orientation** — printed stem-down, no surface leans more than 40° from vertical except the latch catch face. Any other orientation puts supports on the stem's fit surfaces and inside the bore.
- **Supports everywhere** — the one support goes under the flat latch catch face inside the cup and stands on the support ledge below it, not on the bed. "Support on build plate only" leaves the catch face unsupported. The overhang threshold has to stay at 48° or less: the flare and the undersides of the key boss and the ledge slope at 50° from horizontal, and from 49° up PrusaSlicer supports them too, under the flare and inside the cup (0, PrusaSlicer's automatic setting, also works).
- **Don't Support Bridges off** — the catch face spans the 11.4 mm slot between two cheeks, so PrusaSlicer treats it as a bridge; with this ticked (the default in stock profiles) it puts no support there. A sagging catch face lets the TeslaTap's latch slip.

### Material Notes

| Part | Material | Status | Notes |
|------|----------|--------|-------|
| Adapter | PCTG | **Recommended** | Tested in 3D-Fuel Pro PCTG |
| Adapter | PETG | Untested | Similar stiffness; expected to fit the same |
| Adapter | TPU | Not recommended | The part holds by rigid edges; fit allowances are sized for a rigid material |
| Adapter | PLA | Not recommended | Softens in a hot garage or in sun |

## Files

| File | Description |
|------|-------------|
| `holster-adapter-r16.stl` | 3D printable model |
| `holster-adapter-r16.3mf` | PrusaSlicer project — validated object settings (layer height, walls, infill, seam, supports) |
| `holster-adapter-r16.scad` | OpenSCAD parametric source |
| `holster-adapter-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

## Installation

1. Print the adapter in PCTG with the settings above (the 3MF sets the object settings; select the `3D-Fuel Pro PCTG` filament profile for the temperatures and cooling).
2. Remove the support from under the latch catch, inside the slot on the cup's latch ramp, and check that the catch face is clean and flat.
3. Push the stem into the ChargePoint's NACS holster with the latch ramp on top (the Tesla-shaped stem only fits one way up) until the holster's latch clicks into the stem's pocket.
4. With the TeslaTap on the charging handle, push its J1772 end into the cup until its latch drops over the catch. Take it out with the TeslaTap's latch release, as you would at a car.

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| r03 | 2026-11-12 | First version from the official NACS and J1772 specs; fit-test pieces printed |
| r08 | 2026-11-12 | Hollow, open-through tube; real nose lead-in; latch catch at 21.3 with a support ledge. Printed: fits, stem longer than needed |
| r10 | 2026-11-13 | Stem shortened to 45 mm. Printed: clicks, 4-5 mm of in/out slop |
| r12-r14 | 2026-11-13 | Tip 3-5 mm longer. Printed: none clicked |
| r15 | 2026-11-16 | Flare 1 mm nearer the latch pocket. Printed: clicks, less slop |
| **r16** | **2026-11-16** | **Flare 2 mm nearer the latch pocket, key boss edges rounded R2. Printed in PCTG: clicks, nearly perfect fit** |

r17 (flare 3 mm nearer) did not click. The [FSD](holster-adapter-FSD.md) has every revision.

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- ChargePoint model and the adapter on your handle
- Photo of fitment
- How much in/out movement is left when docked
- Any dimensional adjustments needed

## Keywords

`chargepoint` `home flex` `cph50` `nacs` `tesla` `j1772` `teslatap` `tesla to j1772` `holster` `holster ball` `holster adapter` `tesla ball` `holster insert` `ev charger` `charging handle` `cable dock` `pctg` `3d print` `replacement part`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2Fautomotive%2Fchargepoint-home-flex-holster-adapter&label=Views&countColor=%23263759" alt="Views" />
</p>
