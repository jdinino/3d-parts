// ============================================================
// Shackle Protector — Half-Torus with C-Channel
// Fits standard 3/4" D-Ring or Bow Shackles
// Rev 01 — 2026-04-15
// ============================================================

/* [Main Dimensions] */
center_hole_dia  = 40;    // mm — shackle bolt bore
c_channel_radius = 9;     // mm — C-channel outer radius
wall_thickness   = 2.5;   // mm — C-channel wall
gap_angle        = 80;    // degrees — C-channel opening

/* [Flat Band] */
flat_band_width  = 5;     // mm — flat label surface width

/* [Text] */
text_depth       = 0.5;   // mm — emboss protrusion
text_size_top    = 3.0;   // mm — name text height
text_size_bot    = 2.8;   // mm — spec text height

/* [Resolution] */
$fn = 120;

// ============================================================
//  DERIVED
// ============================================================
r_out    = c_channel_radius;
r_in     = r_out - wall_thickness;
R        = center_hole_dia / 2 + r_out;
gap_half = gap_angle / 2;
v_clip   = sqrt(r_out * r_out - pow(flat_band_width / 2, 2));

echo(str("Major radius: ", R, " mm"));
echo(str("Bore diameter: ", 2 * (R - r_out), " mm"));
echo(str("C-channel diameter: ", 2 * r_out, " mm"));
echo(str("Flat clip at Y = +/-", v_clip, " mm"));

// ============================================================
//  C-CHANNEL 2D PROFILE
// ============================================================
module c_channel_2d() {
    intersection() {
        translate([R - r_out - 1, -v_clip])
            square([2 * r_out + 2, 2 * v_clip]);

        offset(r = 1) offset(r = -1)
        translate([R, 0])
        difference() {
            circle(r = r_out);
            circle(r = r_in);
            polygon([
                [0, 0],
                [(r_out + 1) * cos(-gap_half), (r_out + 1) * sin(-gap_half)],
                [(r_out + 1) * 2, 0],
                [(r_out + 1) * cos(gap_half),  (r_out + 1) * sin(gap_half)]
            ]);
        }
    }
}

// ============================================================
//  HALF-TORUS BODY
// ============================================================
module half_torus() {
    rotate_extrude(angle = 180, convexity = 10)
        c_channel_2d();
}

// ============================================================
//  EMBOSSED TEXT — TOP FLAT BAND
// ============================================================
module text_top() {
    translate([0, v_clip, R])
    rotate([90, 180, 0])
    linear_extrude(height = text_depth)
        text("HALF-TORUS SHACKLE PROTECTOR", size = text_size_top,
             halign = "center", valign = "center",
             font = "Liberation Sans:style=Bold");
}

// ============================================================
//  EMBOSSED TEXT — BOTTOM FLAT BAND
// ============================================================
module text_bottom() {
    ch_dia = 2 * r_out;
    bore   = center_hole_dia;

    translate([0, -v_clip, R])
    rotate([-90, 0, 0])
    mirror([0, 1, 0])
    linear_extrude(height = text_depth) {
        translate([-20, 0])
            text(str("CENTER HOLE: ", bore, "MM"), size = text_size_bot,
                 halign = "center", valign = "center",
                 font = "Liberation Sans:style=Bold");
        text("|", size = text_size_bot + 1,
             halign = "center", valign = "center",
             font = "Liberation Sans:style=Bold");
        translate([22, 0])
            text(str("C-CHANNEL: ", ch_dia, "MM"), size = text_size_bot,
                 halign = "center", valign = "center",
                 font = "Liberation Sans:style=Bold");
    }
}

// ============================================================
//  ASSEMBLY
// ============================================================
union() {
    half_torus();
    text_top();
    text_bottom();
}

// ============================================================
//  PRINT NOTES
// ============================================================
echo("=== PRINT SETTINGS ===");
echo("Material: TPU 95A");
echo("Layer Height: 0.2mm");
echo("Infill: 100%");
echo("Speed: 25mm/s");
echo("Nozzle: 230C, Bed: 50C");
echo("Orientation: Flat cut face down, C-channel opening up");
echo("Supports: None required");
