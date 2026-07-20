# Adding New Parts

Use this as your template and checklist when adding parts to this repository.

---

## Folder Structure

Create: `{category}/[{brand}-]{product}-{part}/`

Examples: `appliances/whirlpool-refrigerator-pan-roller/`, `automotive/d-ring-shackle-protector/`

---

## Files

Required for every part:

| File | Description |
|------|-------------|
| `README.md` | Part documentation (see template below) |
| `{part}-FSD.md` | Specifications document |
| `{part}-{rXX}.stl` | 3D printable model(s) |
| `{part}-{rXX}.scad` | OpenSCAD source(s) |
| `render.html` | Interactive 3D viewer |

Use OEM part numbers for filenames when available (e.g., `W11578839-r17.stl`). Otherwise use a descriptive name (e.g., `gasket-r10.stl`). Always include the revision number in STL and SCAD filenames.

For multi-part assemblies, include one STL/SCAD pair per component (e.g., `W11578839-r17.stl` + `W11573594-r17.stl`).

### Reference Files (Optional)

A reference file is an extra STL included for comparison — not the main part you'd print. No revision number. Include a `.scad` if it can be regenerated.

Naming: `reference-{part}.stl` (e.g., `reference-d-ring-shackle-protector.stl`, `reference-mesh-lid.stl`).

### Slicer Project (Recommended)

If a print profile has been validated on real hardware, ship it as `{part}-{rXX}.3mf` next to the STL. Summarize the profile in the README Print Settings table, link the 3MF from that section, and attach it to the GitHub Release alongside the STL. Mark any setting the part's function depends on with a ✓ in the Print Settings table's Required column and explain its failure mode below the table (see the airbox bushing and bleeder tool READMEs for the pattern).

### Part Photo (Recommended)

Commit a photo of the printed part as `{part}-{rXX}-photo.{ext}` (e.g., `11519-r03-photo.webp`) — don't hotlink external images, they rot. Place it in the README centered after the badges block, before Compatible Part Numbers.

### Part Markings (Recommended)

Engrave or emboss text directly on parts as functionally allowable to be legible. Priority:

1. **Revision** — e.g., `r10`
2. **Name** — e.g., `HALF-TORUS SHACKLE PROTECTOR`
3. **Specs** — e.g., `CENTER HOLE: 40MM | C-CHANNEL: 18MM`

Document marking locations in the FSD.

---

## README.md Template

Copy and adapt this structure exactly:

```markdown
# [{Brand}] {Product} {Part Name}

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/tipscup"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

{One sentence description.}

<h2 align="center"><a href="https://github.com/jdinino/3d-parts/releases/download/{release-tag}/{part}-{rXX}.stl">Download the {Part}</a></h2>
<h3 align="center"><a href="{part}-{rXX}.stl">View 3D Model</a> | <a href="https://jdinino.github.io/3d-parts/{category}/{folder}/render.html">Interactive Viewer</a></h3>

<!-- For parts with reference variants, add separate download and view links per variant.
     See d-ring-shackle-protector README for example. -->

<p align="center">
  <img src="https://img.shields.io/badge/Material-{MATERIAL}-brightgreen" alt="Material">
  <img src="https://img.shields.io/badge/Revision-{rXX}-blue" alt="Revision">
</p>

<!-- If a photo of the printed part exists:
<p align="center">
  <img src="{part}-{rXX}-photo.webp" alt="{Part description}" width="480">
</p>
-->

## Compatible Part Numbers

| Part Number | Type |
|-------------|------|
| **{PRIMARY}** | Current OEM |
| {ALTERNATE} | Alternate |

## Compatible {Product} Models

### {Brand1}
- Model numbers here

### {Brand2}
- Model numbers here

## Specifications

| Parameter | Value |
|-----------|-------|
| **{Dimension}** | {value} mm |

For multi-part assemblies, use a separate subsection and table per component:

### {Component} ({Part Number})

| Parameter | Value |
|-----------|-------|
| **{Dimension}** | {value} mm |

## Print Settings

<!-- If a validated slicer project is included, open the section with:
The exact validated profile ships as [`{part}-{rXX}.3mf`](https://github.com/jdinino/3d-parts/releases/download/{release-tag}/{part}-{rXX}.3mf) — a {slicer} project ({printer}, {nozzle} nozzle, {filament}). The table below summarizes it.
-->

### {Component} - {Material Name}

| Setting | Value |
|---------|-------|
| Layer Height | {X} mm |
| Wall Count | {X} |
| Infill | 100% |
| Print Speed | {X} mm/s |
| Nozzle Temp | {X}°C |
| Bed Temp | {X}°C |
| Cooling | {X}% |
| Orientation | {description} |
| Supports | None required |

<!-- If any setting is function-critical, add a Required column, mark those rows
     with ✓, keep the value cells short, and explain each below the table:

| Setting | Required | Value |
|---------|:--------:|-------|
| Layer Height | | {X} mm |
| {Critical Setting} | ✓ | **{value}** |

**Required settings, and why:**

- **{Critical Setting}** — {failure mode without it}
-->

For multi-part assemblies, repeat print settings per component/material.

### Material Notes

| Part | Material | Status | Notes |
|------|----------|--------|-------|
| {Component} | {MATERIAL} | **Recommended** | {reason} |
| {Component} | {OTHER} | Not recommended | {reason} |

## Files

| File | Description |
|------|-------------|
| `{part}-{rXX}.stl` | 3D printable model |
| `{part}-{rXX}.scad` | OpenSCAD parametric source |
| `{part}-FSD.md` | Functional Specification Document |
| `render.html` | Interactive 3D preview |

<!-- If a validated slicer project is included, add after the STL row:
     | `{part}-{rXX}.3mf` | PrusaSlicer project — exact validated print profile | -->

## Installation

<!-- Include video if available -->
<p align="center">
  <a href="{youtube-url}"><img src="https://img.youtube.com/vi/{video-id}/hqdefault.jpg" alt="Installation Video" width="480"></a>
</p>

1. Print {component} in {material}
2. Refer to video above for assembly and installation

<!-- If no video, replace with written steps -->

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| **{rXX}** | **{YYYY-MM-DD}** | **{Current version notes}** |

## License

[CC BY 4.0](../../LICENSE)

## Contributing

Issues and improvements welcome. Please include:
- {Product} model number
- Photo of fitment
- Any dimensional adjustments needed

## Keywords

`{part1}` `{part2}` `{brand}` `{product}` `{keywords}` `3d print` `replacement part`

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2F{category}%2F{folder}&label=Views&countColor=%23263759" alt="Views" />
</p>
```

---

## FSD.md Template

```markdown
# {Part Name} Full Specifications Document

## Overview

{One sentence description of what this part does and where it's used.}

## {Part} Specifications

| Parameter | Value |
|-----------|-------|
| {Dimension1} | {value}mm |
| {Dimension2} | {value}mm |
| Material | {MATERIAL} |

### Cross Section
{ASCII diagram showing part geometry - see existing FSD files for examples}

### Part Markings
{Document marking text, locations, and orientation — see `d-ring-shackle-protector-FSD.md` for example}

## Material Requirements

| Material | Status | Reason |
|----------|--------|--------|
| {MATERIAL} | **Recommended** | {Why recommended} |
| {OTHER} | Not recommended | {Why not} |

## Revision History

| Rev | Date | Changes |
|-----|------|---------|
| {rXX} | {YYYY-MM-DD} | {Current version notes} |
| {rXX-1} | {YYYY-MM-DD} | {Previous changes} |
```

---

## render.html

Copy from an existing part (e.g., `whirlpool-refrigerator-pan-roller/render.html`) and modify:
- Title
- Part numbers
- Specifications values
- 3D geometry (Three.js scene)
- Brand compatibility list

---

## Update Category Index

Add row to `{category}/README.md`:

```markdown
| [Part Name](folder-name/) | Brand1, Brand2 | PartNum1, PartNum2 | Material | Tested |
```

For brandless parts, use `—` for Brand and `N/A` for Part Numbers.

---

## Create GitHub Release

Create a release for STL downloads (ensures proper file download instead of browser displaying text).

Release tag format: `{part-name}-{rXX}` (e.g., `pan-roller-r17`, `d-ring-shackle-protector-r01`).

```bash
gh release create {release-tag} "{category}/{folder}/{part}-{rXX}.stl" --title "{Part Name} {rXX}" --notes "{Release notes}"
```

Example:
```bash
gh release create pan-roller-r17 "appliances/whirlpool-refrigerator-pan-roller/W11578839-r17.stl" "appliances/whirlpool-refrigerator-pan-roller/W11573594-r17.stl" --title "Pan Roller r17" --notes "3 legs with rib reinforcement, solid wedge, TPU material"
```

Download URL format: `https://github.com/jdinino/3d-parts/releases/download/{release-tag}/{part}-{rXX}.stl`

If the part ships a 3MF slicer project, attach it to the same release (`gh release upload {release-tag} "{category}/{folder}/{part}-{rXX}.3mf"`) so the README's Print Settings link resolves.

---

## Checklist

Before committing, verify:

- [ ] Folder: `{category}/[{brand}-]{product}-{part}/`
- [ ] README.md matches template structure exactly
- [ ] FSD.md with specifications
- [ ] STL file(s)
- [ ] SCAD file(s)
- [ ] render.html
- [ ] Category README.md updated
- [ ] All filenames in README match actual files
- [ ] GitHub Release created with STL file(s)
- [ ] 3MF slicer project committed and attached to the release (if a validated profile exists)
- [ ] Photo of the printed part committed as `{part}-{rXX}-photo.{ext}` (if available)
- [ ] Download URLs point to GitHub Release assets
- [ ] Interactive Viewer URL uses GitHub Pages path
- [ ] Visitor badge URL is properly encoded
- [ ] License links to `../../LICENSE`

---

## Reference

Working examples: `appliances/whirlpool-refrigerator-pan-roller/` (assembly), `automotive/d-ring-shackle-protector/` (reference variant)
