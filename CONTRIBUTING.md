# Contributing New Parts

This document describes how to add new 3D printable parts to this repository.

## Directory Structure

```
3d-parts/
├── README.md                    # Main repo index
├── LICENSE                      # CC BY 4.0
├── CONTRIBUTING.md              # This file
└── {category}/                  # appliances, automotive, electronics, furniture, tools
    ├── README.md                # Category index
    └── {brand}-{product}-{part}/    # Part folder
        ├── README.md            # Part documentation
        ├── {partname}-FSD.md    # Functional Specification Document
        ├── {partname}.stl       # 3D printable model
        ├── {partname}.scad      # OpenSCAD parametric source
        └── render.html          # Interactive 3D preview
```

## Naming Conventions

### Folder Names
- Format: `{brand}-{product}-{part}`
- Use lowercase with hyphens
- Examples:
  - `whirlpool-dishwasher-rinse-aid-gasket`
  - `whirlpool-refrigerator-pan-roller`
  - `ikea-malm-drawer-slide`

### File Names
- STL/SCAD: Use OEM part number if available (e.g., `W11578839.stl`)
- If no part number: Use descriptive name with revision (e.g., `gasket-r08.stl`)
- FSD: Match part name (e.g., `pan-roller-FSD.md` or `gasket-r08-FSD.md`)

## Required Files

### 1. README.md (Part Documentation)

Must include these sections in order:

```markdown
# {Brand} {Product} {Part Name}

<p align="center">
  <b>If this part saved you money, consider buying me a thank you!</b><br><br>
  <a href="https://paypal.me/jdinino"><img src="https://img.shields.io/badge/PayPal-Tip_Jar-00457C?style=for-the-badge&logo=paypal&logoColor=white" alt="PayPal Tip Jar"></a>
</p>

---

{Brief description of the part and what it replaces.}

<h2 align="center"><a href="{raw-stl-url}" download>Download the {Part}</a></h2>
<h3 align="center"><a href="{local-stl}">View 3D Model</a> | <a href="{github-pages-url}">Interactive Viewer</a></h3>

<p align="center">
  <img src="https://img.shields.io/badge/Material-{MATERIAL}-brightgreen" alt="Material">
  <img src="https://img.shields.io/badge/Revision-{rXX}-blue" alt="Revision">
  <img src="https://img.shields.io/badge/Size-{dimensions}-orange" alt="Size">
</p>

## Compatible Part Numbers
## Compatible {Product} Models (optional, if known)
## Specifications
## Print Settings
### Material Notes
## Files
## Installation
## Revision History
## License
## Contributing
## Keywords

---

<p align="center">
  <img src="https://api.visitorbadge.io/api/visitors?path={encoded-github-url}&label=Views&countColor=%23263759" alt="Views" />
</p>
```

### 2. FSD.md (Functional Specification Document)

Must include:

```markdown
# {Part Name} Full Specifications Document

## Overview
## Specifications (with dimensions, tolerances)
## Material Requirements
## Print Parameters
## Revision History
```

### 3. STL File(s)
- Binary STL format preferred
- Properly oriented for printing (no supports needed if possible)
- Manifold/watertight mesh

### 4. SCAD File(s)
- OpenSCAD parametric source
- Include all dimensions as variables at top
- Include revision marking in the model

### 5. render.html
- Interactive Three.js viewer
- Follow template from existing parts
- Include specifications display
- Compatible brand badges

## Updating Category Index

When adding a new part, update the category's README.md:

```markdown
| [Part Name](folder-name/) | Brand1, Brand2 | PartNum1, PartNum2 | Material | Status |
```

Status values:
- `Tested` - Verified to work
- `Beta` - Works but may need refinement
- `WIP` - Work in progress

## Commit Message Format

```
Add {product} {part} {part-numbers}

Co-Authored-By: {contributor} <email>
```

Example:
```
Add refrigerator pan roller W11578839/W11573594

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

## Checklist Before Submitting

- [ ] Folder follows naming convention: `{brand}-{product}-{part}`
- [ ] README.md follows template structure
- [ ] FSD.md with full specifications
- [ ] STL file(s) - printable models
- [ ] SCAD file(s) - parametric source
- [ ] render.html - interactive viewer
- [ ] Category README.md updated with new part
- [ ] All file references in README match actual filenames
- [ ] Download links use correct raw GitHub URLs
- [ ] Interactive viewer link uses GitHub Pages URL
- [ ] Keywords section includes all part numbers
- [ ] License links to `../../LICENSE`

## URL Formats

### Raw file download:
```
https://raw.githubusercontent.com/jdinino/3d-parts/main/{category}/{folder}/{file}.stl
```

### GitHub Pages (render.html):
```
https://jdinino.github.io/3d-parts/{category}/{folder}/render.html
```

### Visitor badge path (URL encoded):
```
https%3A%2F%2Fgithub.com%2Fjdinino%2F3d-parts%2Ftree%2Fmain%2F{category}%2F{folder}
```

## Questions?

Open an issue at https://github.com/jdinino/3d-parts/issues
