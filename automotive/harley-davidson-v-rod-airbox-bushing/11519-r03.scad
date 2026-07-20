// ============================================================
//  BUSHING, V-ROD AIRBOX MOUNTING — Harley-Davidson 11519
//  (OEM desc: RUBBER MOUNT, AIRBOX COVER; alternate: 11519-A)
//  Material: TPU 95A  |  rev r03
//  Render: openscad -o 11519-r03.stl 11519-r03.scad
// ============================================================

base_od    = 20.0;   // base flange OD
base_h     = 3.0;    // base flange height
groove_d   = 11.0;   // panel-snap groove diameter
groove_h   = 3.0;    // groove height
head_bot_d = 16.0;   // head max diameter (retention lip)
head_top_d = 13.0;   // head top-face diameter
total_h    = 9.0;    // overall height
bore_d     = 8.0;    // through-bore ID (straight, top side)
flare_d    = 12.0;   // flare mouth diameter at BOTTOM face (45 deg cone)
flare_h    = 2.0;    // flare cone height

// Part marking (CONTRIBUTING.md: revision first). Debossed into the
// bottom face, flipped about X to read correctly when viewing the
// underside (the 180-degree rotation alone provides the mirror —
// do NOT add mirror(), which double-corrects into unreadable text).
// Depth is 0.4 mm — NOT deeper: with the validated 1-perimeter / 0%
// infill print settings only the bottom skin (~0.8 mm) is solid, and
// a deeper cut would perforate it.
mark_text  = "r03";
mark_h     = 2.8;    // glyph cap height
mark_r     = 7.9;    // radial center of text (clears Ø12 flare + Ø20 rim)
mark_depth = 0.4;

$fn = 192;

difference() {
    rotate_extrude()
        polygon([
            [flare_d/2, 0],
            [base_od/2, 0],
            [base_od/2, base_h],
            [groove_d/2, base_h],
            [groove_d/2, base_h+groove_h],
            [head_bot_d/2, base_h+groove_h],
            [head_top_d/2, total_h],
            [bore_d/2, total_h],
            [bore_d/2, flare_h],
            [flare_d/2, 0]
        ]);
    // bottom marking; rotate flips it to cut upward through the bottom
    // face AND supplies the mirror that makes it read from below
    translate([0, -mark_r, mark_depth])
        rotate([180,0,0])
            linear_extrude(mark_depth + 0.2)
                text(mark_text, size=mark_h, font="DejaVu Sans:style=Bold",
                     halign="center", valign="center");
}

// ============================================================
//  PRINT — TPU 95A — FIELD-VALIDATED (owner-tested, r03):
//    perimeters = 1 (+1 on first groove layer, z 3.0-3.2 — REQUIRED,
//                    flex concentrates at the flange/stem junction and
//                    a single-perimeter layer tears there in service)
//    infill     = 0%        (hollow shell = matches OEM rubber squish)
//    supports   = ENABLED   (single wall can't bridge head underside)
//  Orientation: base down.
//  225C / bed 30C / 20-25 mm/s (1.8 mm3/s cap) / retr 0.8mm @ 60mm/s.
//  Exact profile: 11519-r03.3mf (PrusaSlicer, AnkerMake M5C, 0.4mm).
// ============================================================
