// ============================================================
//  CHARGEPOINT TESLA BALL TO J1772 ADAPTER
//  Docks a Tesla (NACS) charging handle that wears a TeslaTap
//  (Tesla -> J1772 adapter) in a ChargePoint Home Flex NACS holster.
//    stem : Tesla-shaped nose that clicks into the holster
//           (Tesla TS-0023666 rev 1.1, section 5.1)
//    cup  : J1772 vehicle inlet the TeslaTap latches into
//           (SAE J1772 OCT2017, Appendix A)
//  Material: PCTG  |  rev r16
//  Render: openscad -o holster-adapter-r16.stl holster-adapter-r16.scad
//          (about 4 minutes in OpenSCAD 2021.01)
//
//  Frame = print orientation. Z is the plug axis, the stem tip sits
//  on the bed at z = 0 and the cup rim is on top. +Y is up when
//  docked (latch ramp, wide side of the Tesla outline); -Y is the
//  J1772 keyway and the stem's latch pocket. Units mm.
//  The whole part is one open tube: hollow stem, funnel, cup bore.
// ============================================================

overhang = 40;              // steepest overhang anywhere, degrees from vertical
T = tan(overhang);          // sideways growth per mm of height (0.839)

// ---- NACS connector nose (TS-0023666) ----------------------------------
// The outer profile is not dimensioned in the spec ("refer to 3D model");
// these arcs were scaled off the p.13 front view (+-0.15), relative to
// datum A (the DC socket axis), just behind the front lead-in.
nose_w     = 39.77;         // width
nose_top   = 10.87;         // top above datum A
nose_bot   = -24.19;        // bottom below datum A (height 35.06)
nose_rt    = 42.9;          // top arc radius
nose_rs    = 29.3;          // side arc radius
nose_rb    = 24.8;          // bottom arc radius
nose_yw    = -2.0;          // level of the widest point
nose_r_top = 8.3;           // upper corner blends
nose_r_bot = 4.9;           // lower corner blends
nose_ref_z = 4.0;           // that profile sits this far behind the front face
nose_draft = 0.0055;        // growth per side per mm toward the handle (pp.14, 25)
datum_c    = 32.49;         // front face to datum C (p.14); draft held constant behind it
pocket_from_c = 12.25;      // latch pocket centre to datum C (p.25) -> 20.24 from the tip
pocket_l   = 6.2;           // latch pocket base, along the axis (p.25)
pocket_w   = 9.71;          // latch pocket base, across (p.25)
pocket_d   = 4.0;           // latch pocket depth (p.25)

// ---- stem as printed -----------------------------------------------------
stem_over   = 0.10;         // stem = nominal nose + this per side behind the lead-in...
stem_over_z = [5.5, 20.24]; // ...fading in from nothing at 5.5 to full at the pocket centre
// printed lead-in: [distance from the tip, how far inside the nominal nose]
// (39 deg chamfer for the first 1.0, then the real nose's curve)
stem_lead   = [[0.0, 1.50], [1.0, 0.70], [1.7, 0.52], [2.5, 0.35], [3.3, 0.21], [4.4, 0.11], [5.5, 0.0]];
stem_l      = 42.46;        // straight stem before the flare. Fit-tested in the holster:
                            // 45 (r10) clicks but loose; 44 (r15) less slop;
                            // 42.46 (r16) nearly perfect; 41.46 (r17) does not click.
                            // 42.46 = 45 - 2.0 flare step - 0.54 for the rounded key boss,
                            // whose rounding moves the flare's first contact 0.54 away from the tip
pocket_rear  = 24.0;        // pocket floor ends here (holster tooth end 23 + 1), rear wall opens at `overhang`
pocket_allow = 0.2;         // added to each pocket wall and the depth (printed pockets come out small)
wall      = 3.2;            // stem wall (a real nose's shell is about 3.3)
wall_bot  = pocket_d + pocket_allow + 1.6;  // bottom wall 5.8: leaves 1.6 behind the latch pocket
funnel_z0 = 1.2;            // funnel to the cup bore starts this far above the stem top

// ---- J1772 cup (SAE J1772 Appendix A, tuned to the TeslaTap) ---------------
j_ramp_top    = 30.0;       // latch ramp top, from the axis (A-1)
j_surf_p      = 26.0;       // surface P, where the latch hook lands (A-1, A-4)
j_ramp_full   = 10.0;       // ramp full height from here behind the rim (A-1)
j_ramp_start  = 2.0;        // ramp starts here (A-1)
j_ramp_w_top  = 15.0;       // ramp width at the top (A-1)
j_ramp_w_base = 19.0;       // ramp width at its base (A-1)
bore_r    = 22.3;           // bore 44.6 for the inlet's 44.2
bore_d    = 34.5;           // keyway depth below the rim (connector nose 33.5 +-0.5)
mouth_ch  = 0.8;            // bore mouth chamfer
rim_ch    = 0.5;            // outer rim chamfer
cup_r     = 25.2;           // barrel radius (inlet barrel 50.4)
key_w     = 8.9;            // keyway width (8.5 + allowance)
key_r     = 25.9;           // keyway floor radius (25.6 + allowance)
boss_w    = 14.0;           // key boss width
boss_r    = 28.0;           // key boss outer face, from the axis
boss_round = 2.0;           // every outside edge of the key boss rounded to this (r16)
catch_d   = 21.3;           // flat latch catch face, from the rim (standard 20.1; tuned to the TeslaTap hook)
hook_gap  = 11.4;           // clear width between the two cheeks (TeslaTap hook is 9 wide)
ledge     = 31.5;           // support ledge top, from the rim (past the longest latch, 29.5)
ledge_r   = 31.0;           // ledge underside cone passes through this radius...
ledge_edge = 0.4;           // ...this far below the ledge top
cheek_run = 1.0;            // cheeks keep full height this far behind the catch face
floor_gap = 4.5;            // keyway bottom above the top of the shoulder cone

// ---- marking -------------------------------------------------------------
mark_text  = "V16";         // design version V16 = repository revision r16
mark_h     = 5.5;           // text height
mark_depth = 0.5;           // sunk into the +Y side of the funnel (read looking into the cup)

// ==========================================================================
// derived values
// ==========================================================================
y_shift = -(nose_top + nose_bot) / 2;   // centres the nose outline on the cup axis
function over(z) = stem_over * min(max((z - stem_over_z[0]) / (stem_over_z[1] - stem_over_z[0]), 0), 1);
function grow(z) = nose_draft * (min(z, datum_c) - nose_ref_z) + over(z) - lookup(z, stem_lead);
function half_h(z) = (nose_top - nose_bot) / 2 + grow(z);   // half the stem outline's height at z

stations = [0, 1.0, 1.7, 2.5, 3.3, 4.4, 5.5, stem_over_z[1], datum_c, stem_l];  // outline is linear between these

cone_h  = (cup_r - half_h(stem_l)) / T;        // shoulder cone at `overhang` from the stem to the barrel
z_floor = stem_l + cone_h + floor_gap;         // keyway bottom
z_rim   = z_floor + bore_d;                    // overall height
z_cup0  = stem_l + cone_h - 0.01;

pocket_z0 = datum_c - pocket_from_c - pocket_l / 2 - pocket_allow;   // front wall, 16.94 from the tip
pocket_y  = -half_h(datum_c - pocket_from_c) + pocket_d + pocket_allow;
pocket_wd = pocket_w + 2 * pocket_allow;

z_f0 = stem_l + funnel_z0;                                       // funnel start
z_f1 = z_f0 + (bore_r - (half_h(stem_l) - wall)) / T;           // funnel reaches the bore

zc    = z_rim - catch_d;
z_led = z_rim - ledge;
wt = j_ramp_w_top / 2;
wb = j_ramp_w_base / 2;
z_lo = max(zc - cheek_run - (j_ramp_top - (bore_r - 0.5)) / T, z_cup0);
z_a = z_floor - floor_gap - (cup_r - 15) / T;   // key boss underside continues the cone's slope
z_b = z_a + (boss_r - 15) / T;

echo(str("overall ", z_rim, "  cone ", cone_h, "  funnel ", z_f0, "..", z_f1, "  catch at z ", zc));

// ==========================================================================
// geometry
// ==========================================================================
module prism_yz(pts, x0, x1)    // section pts in the Y-Z plane, run from x0 to x1
    multmatrix([[0, 0, 1, x0], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1]])
        linear_extrude(x1 - x0) polygon(pts);

module nose_discs() intersection() {
    translate([0, nose_top - nose_rt]) circle(r = nose_rt, $fn = 720);
    translate([  nose_rs - nose_w / 2,  nose_yw]) circle(r = nose_rs, $fn = 720);
    translate([-(nose_rs - nose_w / 2), nose_yw]) circle(r = nose_rs, $fn = 720);
    translate([0, nose_bot + nose_rb]) circle(r = nose_rb, $fn = 720);
}

module nose_nominal() union() {
    intersection() {
        offset(r = nose_r_top, $fn = 256) offset(r = -nose_r_top, $fn = 256) nose_discs();
        translate([-50, nose_yw]) square([100, 100]);
    }
    intersection() {
        offset(r = nose_r_bot, $fn = 256) offset(r = -nose_r_bot, $fn = 256) nose_discs();
        translate([-50, -100]) square([100, 100 + nose_yw]);
    }
}

module stem_outline(z) translate([0, y_shift]) offset(r = grow(z), $fn = 192) nose_nominal();

module cavity_outline(z) {
    zz = min(max(z, 0), stem_l);
    intersection() {
        offset(r = -wall, $fn = 192) stem_outline(zz);
        translate([-50, -half_h(zz) + wall_bot]) square([100, 100]);
    }
}

module slab(z)      translate([0, 0, max(z - 0.01, 0)]) linear_extrude(0.01) stem_outline(z);
module cslab(z, zz) translate([0, 0, zz]) linear_extrude(0.01) cavity_outline(z);

module stem() for (i = [0 : len(stations) - 2]) hull() { slab(stations[i]); slab(stations[i + 1]); }

// (its top stays 0.001 inside the barrel, so cone and barrel never touch along
//  a bare ring; that keeps the exported STL a clean manifold)
module cone() hull() {
    translate([0, 0, stem_l - 0.01]) linear_extrude(0.01) stem_outline(stem_l);
    translate([0, 0, stem_l + cone_h - 0.01]) cylinder(h = 0.01, r = cup_r - 0.001, $fn = 180);
}

// latch pocket on -Y: front wall per the spec; floor runs past the holster tooth,
// then the rear wall opens at `overhang` (no bridge, so no support)
module pocket() {
    y_out = -half_h(datum_c) - 3.0;
    prism_yz([[y_out, pocket_z0], [pocket_y, pocket_z0], [pocket_y, pocket_rear],
              [y_out, pocket_rear + (pocket_y - y_out) / T]], -pocket_wd / 2, pocket_wd / 2);
}

module cup_shell() rotate_extrude($fn = 180)
    polygon([[0, z_cup0], [cup_r, z_cup0], [cup_r, z_rim - rim_ch], [cup_r - rim_ch, z_rim], [0, z_rim]]);

module bore() rotate_extrude($fn = 180)
    polygon([[0, z_f1], [bore_r, z_f1], [bore_r, z_rim - mouth_ch], [bore_r + mouth_ch, z_rim],
             [bore_r + mouth_ch + 1, z_rim + 1], [0, z_rim + 1]]);

module cavity() {
    hull() { cslab(0, -1); cslab(0, 0); }
    for (i = [0 : len(stations) - 2])
        hull() { cslab(stations[i], max(stations[i] - 0.01, 0)); cslab(stations[i + 1], stations[i + 1] - 0.01); }
    hull() { cslab(stem_l, stem_l - 0.02); cslab(stem_l, z_f0); }
}

module funnel() hull() {
    cslab(stem_l, z_f0 - 0.01);
    translate([0, 0, z_f1]) cylinder(h = 0.01, r = bore_r, $fn = 180);
}

module ramp_sect() polygon([[-wb, bore_r + 0.3], [-wb, j_surf_p], [-wt, j_ramp_top],
                            [wt, j_ramp_top], [wb, j_surf_p], [wb, bore_r + 0.3]]);

// latch ramp, flat catch face carried by two cheeks, surface P pad, support ledge
module latch_add() {
    intersection() {
        translate([0, 0, z_lo]) linear_extrude(z_rim - z_lo) ramp_sect();
        prism_yz([[0, z_lo], [j_ramp_top - (zc - cheek_run - z_lo) * T, z_lo], [j_ramp_top, zc - cheek_run],
                  [j_ramp_top, z_rim - j_ramp_full], [j_surf_p, z_rim - j_ramp_start], [j_surf_p, z_rim], [0, z_rim]],
                 -wb - 1, wb + 1);
    }
    intersection() {
        translate([0, 0, z_led]) cylinder(h = zc - z_led, r = j_surf_p, $fn = 180);
        translate([-wb, 0, z_cup0 - 1]) cube([2 * wb, 40, z_rim - z_cup0 + 2]);
    }
    z_u = z_led - ledge_edge;
    intersection() {
        translate([0, 0, z_cup0]) linear_extrude(z_led - z_cup0) ramp_sect();
        rotate_extrude($fn = 180) polygon([[0, z_u - ledge_r / T], [ledge_r, z_u], [ledge_r + 3, z_u],
                                           [ledge_r + 3, z_led + 1], [0, z_led + 1]]);
    }
}

// the hook's room between the cheeks: from the ledge up to the catch face, down to surface P
module latch_gap() difference() {
    translate([-hook_gap / 2, 0, z_led]) cube([hook_gap, 40, zc - z_led]);
    translate([0, 0, z_led - 1]) cylinder(h = zc - z_led + 2, r = j_surf_p, $fn = 180);
}

// boss on -Y that carries the keyway; underside continues the shoulder cone,
// every outside edge rounded to boss_round (hull of balls cut back to the block)
module key_boss() {
    r = boss_round;
    ya = -15 + r * cos(overhang);
    za = z_a + r * sin(overhang);
    corners = [[-boss_r + r, za + (ya - (-boss_r + r)) / T], [-boss_r + r, z_rim + 6],
               [-8, za + (ya + 8) / T], [-8, z_rim + 6]];
    intersection() {
        hull() for (sx = [-1, 1], p = corners) translate([sx * (boss_w / 2 - r), p[0], p[1]]) sphere(r = r, $fn = 64);
        prism_yz([[-15, z_a], [-boss_r, z_b], [-boss_r, z_rim - rim_ch], [-boss_r + rim_ch, z_rim], [-15, z_rim]],
                 -boss_w / 2, boss_w / 2);
    }
}

module keyway() translate([-key_w / 2, -key_r, z_floor]) cube([key_w, key_r - 15, z_rim + 1 - z_floor]);

module mark() {
    cy = (half_h(stem_l) - wall + bore_r) / 2;
    drop = mark_depth / T;
    intersection() {
        translate([0, 0, z_f0 - 2]) linear_extrude(z_f1 - z_f0 + 4)
            translate([0, cy]) resize([0, mark_h], auto = true)
                text(mark_text, font = "DejaVu Sans:style=Bold", halign = "center", valign = "center");
        union() {
            translate([0, 0, -drop]) funnel();
            translate([0, 0, z_f1 - drop - 0.01]) cylinder(h = drop + 0.02, r = bore_r, $fn = 180);
        }
    }
}

difference() {
    union() {
        stem();
        cone();
        cup_shell();
        key_boss();
        latch_add();
    }
    pocket();
    latch_gap();
    bore();
    cavity();
    funnel();
    keyway();
    mark();
}
