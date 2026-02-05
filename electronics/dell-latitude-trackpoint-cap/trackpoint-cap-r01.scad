// Dell TrackPoint Cap — flattened dome, flipped upside-down
// Optimized for TPU (flexible filament) printing
// Prints upright: flat base on bed, square hole open at top

$fn = 100;

// --- Key dimensions (mm) ---
inner_cyl_r    = 3.8233;   // inner cylinder radius
inner_cyl_h    = 3.000;    // inner cylinder height (+1.5mm)
outer_cyl_r    = 4.3233;   // outer cylinder radius
outer_cyl_h    = 0.722;    // outer cylinder height (stepped ring)
stem_half      = 1.55;     // square hole half-width (nominal)
stem_depth     = 1.900;    // square hole depth
total_h        = 3.750;    // total height (+1.5mm)

// --- TPU print adjustments ---
tpu_hole_tol   = 0;        // extra clearance on square hole for TPU flex
chamfer_h      = 0.4;      // bottom edge chamfer height (bed adhesion)
chamfer_w      = 0.4;      // bottom edge chamfer width
fillet_r       = 0.5;      // fillet at cylinder step transition
hole_chamfer   = 0.3;      // chamfer at square hole entry (printability)
hole_draft     = 0.8;      // degrees of draft on square hole walls

// Adjusted hole half-width with tolerance
stem_half_adj  = stem_half + tpu_hole_tol;

// --- Modules ---

// Chamfered ring to improve first-layer adhesion
module bottom_chamfer() {
    translate([0, 0, -0.01])
        difference() {
            cylinder(r=outer_cyl_r + 0.01, h=chamfer_h + 0.01);
            cylinder(r1=outer_cyl_r - chamfer_w, r2=outer_cyl_r, h=chamfer_h + 0.01);
        }
}

// Fillet at the step between outer and inner cylinder
// Approximated as a smooth torus-like transition
module step_fillet() {
    translate([0, 0, outer_cyl_h])
        rotate_extrude()
            translate([inner_cyl_r, 0, 0])
                intersection() {
                    // Quarter-circle fillet profile
                    difference() {
                        square([fillet_r, fillet_r]);
                        translate([fillet_r, fillet_r])
                            circle(r=fillet_r);
                    }
                }
}

// Square hole with draft angle and entry chamfer
module square_hole() {
    floor_z = total_h - stem_depth;

    // Main hole with slight draft (wider at top)
    draft_offset = stem_depth * tan(hole_draft);
    hull() {
        // Bottom of hole (narrower)
        translate([0, 0, floor_z])
            linear_extrude(0.01)
                square([stem_half_adj * 2, stem_half_adj * 2], center=true);
        // Top of hole (wider by draft)
        translate([0, 0, total_h])
            linear_extrude(0.01)
                square([(stem_half_adj + draft_offset) * 2,
                        (stem_half_adj + draft_offset) * 2], center=true);
    }

    // Entry chamfer at top edge — helps TPU layer start
    translate([0, 0, total_h - hole_chamfer])
        linear_extrude(hole_chamfer + 0.01, scale=
            (stem_half_adj + draft_offset + hole_chamfer) /
            (stem_half_adj + draft_offset))
            square([(stem_half_adj + draft_offset) * 2,
                    (stem_half_adj + draft_offset) * 2], center=true);
}

// --- Main assembly ---
module trackpoint_cap() {
    difference() {
        union() {
            // Outer ring (lower, wider)
            cylinder(r=outer_cyl_r, h=outer_cyl_h);

            // Inner cylinder (upper, narrower)
            translate([0, 0, outer_cyl_h])
                cylinder(r=inner_cyl_r, h=inner_cyl_h);

            // Fillet at step transition — reduces stress concentration
            step_fillet();
        }

        // Square hole with draft + chamfer
        square_hole();

        // Bottom edge chamfer for bed adhesion
        bottom_chamfer();
    }
}

trackpoint_cap();
