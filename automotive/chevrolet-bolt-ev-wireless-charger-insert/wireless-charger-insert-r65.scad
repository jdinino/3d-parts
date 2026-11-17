// ============================================================
//  CHEVROLET BOLT EV WIRELESS CHARGER INSERT
//  TPU insert for the console phone slot. Hangs from a 94 x 42 lip,
//  splits the slot into pocket A (over the car's wireless charger,
//  no floor) and pocket B, and carries two slotted-hook bumps on
//  Side B that clip into holes in the car's slot wall.
//  Material: TPU 95A  |  rev r65
//  Render: openscad -o wireless-charger-insert-r65.stl wireless-charger-insert-r65.scad
//
//  Modelling frame = as installed: lip top at z = 0, body hanging
//  down to z = -105. Side A (charger side) = -Y, Side B (bumps) = +Y,
//  ENDs = +-X. Units mm. The finished part is flipped 180 deg about X
//  at the bottom of this file, so the STL comes out in print
//  orientation: lip top on the bed at z = 0, bumps on -Y.
// ============================================================

$fn = 64;

// ---- body (fit-tested in the car) ---------------------------------------
H        = 105;             // overall height
lip_L    = 94;              // lip length
lip_W    = 42;              // lip width
lip_R    = 10;              // lip corner radius
lip_T    = 2;               // lip thickness
out_top  = [85.5, 33.5];    // body outside at the lip top (largest gauge step that fitted)
out_tan  = [80, 30];        // body outside at the tangent line (jig 80 x 30: tight fit)
bot_R    = 6;               // bottom round, all the way round, and plan corner radius
z_tan    = -(H - bot_R);    // tangent line, 6 above the bottom (-99)
wall     = 0.75;
cav_R    = bot_R - wall;    // 5.25 inside corners and inside bottom round

// ---- floor and divider ---------------------------------------------------
floor_T  = 2;               // pocket B floor
z_floor  = -H + floor_T;    // -103
div_T    = 1.5;             // divider thickness
div_y0   = 0;               // divider's A face at the lip top; it leans with the Side A wall
lean     = (out_top[1] - out_tan[1]) / 2 / (-z_tan);   // 1.75 / 99 per mm of depth
trough_y = 8.75;            // pocket B floor trough: centre (pocket B centre at the tangent line)
trough_R = 2.71;            //   bottom radius; 45 deg sides; bottom on the floor (z_floor)
open_x   = 34;              // pocket A: Side A wall and bottom skin removed for |x| <= open_x
open_y0  = -(out_top[1] / 2 + 2);   // cut reaches past the outside of Side A
open_zf  = z_floor + 10;    // floor fill under pocket A removed up to here, whole length

// ---- seating ribs under the lip (1.0 gap to the body wall) ----------------
rib_t    = 1;               // thickness
rib_d    = 2;               // down from the lip underside
rib_edge = 2.285;           // outer face from the lip edge
rib_LA   = 15;              // Side A rib length
rib_LB   = 25;              // Side B rib length

// ---- slotted-hook bumps (Side B) -----------------------------------------
bump_gap = 31;              // between the bumps' inner edges (spec)
bump_L   = 8;               // length along X
z_catch  = -12;             // slot floor = catch face, 10 below the lip underside
slot_w   = 2.5;             // car slot wall 2.0 + 0.5 clearance
slot_d   = 3;               // slot depth -> leg top 3 above the catch (z = -9)
leg_t    = 2;               // leg beyond the slot -> bump 4.5 out
neck     = 1;               // outer face continues this far below the catch
bump_r   = 1.5;             // ramp blends
slot_ch  = 0.5;             // chamfer on the leg's slot-side top corner
sink     = 0.3;             // how far the bump profile runs into the wall

// ---- engraving on the Side A lip band ------------------------------------
eng_d    = 0.4;             // depth
band_y   = -(lip_W / 2 - 2.5);   // band centre line, 2.5 from the lip edge
txt      = "Wireless Charger";
txt_font = "DejaVu Sans:style=Bold";
txt_w    = 38.58;           // ink width (3.90 tall)
groove_w = 0.6;
groove_x = txt_w / 2 + 2.5; // groove starts 2.5 past each end of the text

// ============================================================
//  helpers
// ============================================================
// outer half-width of the body (Y) at depth z, above the tangent line
function half_w(z) = out_top[1] / 2 - lean * (-z);

module rrect(size, r) {
    offset(r = r) square([size[0] - 2 * r, size[1] - 2 * r], center = true);
}

// tapered rounded box with an R round all round the bottom (spherical corners)
module rounded_body(top, tan, r, z_top) {
    hull() {
        translate([0, 0, z_top - 0.001]) linear_extrude(0.001) rrect(top, r);
        for (sx = [-1, 1], sy = [-1, 1])
            translate([sx * (tan[0] / 2 - r), sy * (tan[1] / 2 - r), z_tan])
                sphere(r / cos(180 / $fn));   // facets touch R at the bottom, not inside it
    }
}

module outer()       { rounded_body(out_top, out_tan, bot_R, 0); }
// the cavity, full depth (inside of the 0.75 wall), and carried up through the lip
module cavity_full() {
    rounded_body(out_top - [2, 2] * wall, out_tan - [2, 2] * wall, cav_R, 0);
    translate([0, 0, -0.01]) linear_extrude(5) rrect(out_top - [2, 2] * wall, cav_R);
}

// a (y, z) profile extruded along X from x0 to x1
module along_x(x0, x1, pts) {
    translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(x1 - x0) polygon(pts);
}

// ============================================================
//  features
// ============================================================
module divider() {
    zb = -H - 5;
    intersection() {
        outer();
        along_x(-lip_L / 2, lip_L / 2,
                [[div_y0 - lean, 1], [div_y0 + div_T - lean, 1],
                 [div_y0 + div_T + lean * -zb, zb], [div_y0 + lean * -zb, zb]]);
    }
}

// pocket B floor: everything inside the cavity below a 45 deg V-trough
// with an R2.71 bottom sitting on the floor level
module trough_fill() {
    c  = [trough_y, z_floor + trough_R];             // bottom arc centre
    t  = trough_R / sqrt(2);
    yl = -1; yr = 18;
    arc = [for (a = [-45 : -3 : -135]) c + trough_R * [cos(a), sin(a)]];
    pts = concat([[yl, -H - 5], [yr, -H - 5],
                  [yr, c[1] - t + (yr - (c[0] + t))]],
                 arc,
                 [[yl, c[1] - t + ((c[0] - t) - yl)]]);
    intersection() {
        cavity_full();
        along_x(-lip_L / 2, lip_L / 2, pts);
    }
}

// pocket A: no floor. Side A wall ends square at the tangent line for |x| <= open_x,
// and the floor fill under the pocket is removed along its whole length.
module pocket_a_opening() {
    zb = -H - 5;
    quad = function(zt) [[open_y0, zb], [div_y0 + lean * -zb, zb],
                         [div_y0 + lean * -zt, zt], [open_y0, zt]];
    along_x(-open_x, open_x, quad(z_tan));
    intersection() {
        cavity_full();
        along_x(-lip_L / 2 - 1, lip_L / 2 + 1, quad(open_zf));
    }
}

module lip() {
    difference() {
        translate([0, 0, -lip_T]) linear_extrude(lip_T) rrect([lip_L, lip_W], lip_R);
        cavity_full();
    }
}

module ribs() {
    y_out = lip_W / 2 - rib_edge;
    for (s = [[-1, rib_LA], [1, rib_LB]])
        translate([-s[1] / 2, s[0] > 0 ? y_out - rib_t : -y_out, -lip_T - rib_d])
            cube([s[1], rib_t, rib_d + 0.01]);
}

// bump profile in (y, z), absolute, Side B
function bump_profile() =
    let(
        yw  = half_w(z_catch),                      // wall at the catch level
        top = z_catch + slot_d,                     // leg top, -9
        out = yw + slot_w + leg_t,                  // outer face, 4.5 out
        c1  = [out - bump_r, z_catch - neck],       // convex blend, outer face -> 45 deg ramp
        t1  = c1 + bump_r * [cos(-45), sin(-45)],
        // the ramp ends tangent to the wall direction at y_ref, the wall at the bump's
        // mid-height (two passes settle it)
        zb0 = t1[1] - (t1[0] - (half_w(-13.9) + bump_r - bump_r * cos(45))) - bump_r * sin(45),
        yr  = half_w((top + zb0) / 2),
        zb  = t1[1] - (t1[0] - (yr + bump_r - bump_r * cos(45))) - bump_r * sin(45),
        c2  = [yr + bump_r, zb],                    // concave blend into the wall
        y_in = half_w(zb) - sink
    )
    concat(
        [[y_in, z_catch], [yw + slot_w, z_catch],
         [yw + slot_w, top - slot_ch], [yw + slot_w + slot_ch, top],
         [out, top], [out, c1[1]]],
        [for (a = [-6 : -6 : -45]) c1 + bump_r * [cos(a), sin(a)]],
        [for (a = [135 : 6 : 180]) c2 + bump_r * [cos(a), sin(a)]],
        [[y_in, zb]]);

module bumps() {
    x_in = bump_gap / 2;
    for (s = [-1, 1])
        along_x(s > 0 ? x_in : -x_in - bump_L, s > 0 ? x_in + bump_L : -x_in, bump_profile());
}

// "Wireless Charger" (reads from the driver's seat, Side B nearest)
// and a groove along the band, round the Side A corners, up to the END mid-points
module engraving() {
    translate([0, band_y, -eng_d]) linear_extrude(1) {
        rotate(180)
            resize([txt_w, 0], auto = true)
                text(txt, size = 4, font = txt_font, halign = "center", valign = "center");
        c = [lip_L / 2 - lip_R, -(lip_W / 2 - lip_R)];          // lip corner centre
        rc = lip_R - 2.5;
        for (sx = [-1, 1]) {
            path = concat([[sx * groove_x, 0]],
                          [for (a = [-90 : 5 : 0]) [sx * (c[0] + rc * cos(a)), c[1] + rc * sin(a) - band_y]],
                          [[sx * (c[0] + rc), -band_y]]);
            for (i = [0 : len(path) - 2])
                hull() { translate(path[i]) circle(d = groove_w, $fn = 24);
                         translate(path[i + 1]) circle(d = groove_w, $fn = 24); }
        }
    }
}

// ============================================================
//  part
// ============================================================
module insert() {
    difference() {
        union() {
            difference() {
                outer();
                intersection() {
                    cavity_full();
                    translate([-lip_L, -lip_W, z_floor]) cube([2 * lip_L, 2 * lip_W, H]);
                }
            }
            lip();
            trough_fill();
            divider();
            ribs();
            bumps();
        }
        pocket_a_opening();
        engraving();
    }
}

rotate([180, 0, 0]) insert();      // print orientation: lip top on the bed
