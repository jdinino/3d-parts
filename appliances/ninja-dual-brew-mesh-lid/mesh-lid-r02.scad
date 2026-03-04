// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r02
// Reference: Coffee Maker Auto-Filler lid (Printables 410550) by Joshua Foster
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307
//
// Modification: Original center opening filled solid, then cut with fine honeycomb mesh

$fn = 64;

// --- Reference lid (Lid.stl) dimensions ---
// 149.9 x 75.1 x 23mm, origin at (0,0,0)
// Z=0:    Base flange, full outer
// Z=2.5:  Innermost step (7.2-142.7 x 7.5-67.6)
// Z=13:   Shelf, full outer
// Z=23:   Top cap (2.2-147.7 x 2.5-72.6)
// Center opening runs from ~Z=2.5 through Z=23

corner_radius = 9.0;

// --- Inner opening dimensions (to be filled) ---
inner_x = 5.35;          // origin X of inner opening
inner_y = 5.5;            // origin Y of inner opening
inner_length = 139.2;     // inner opening length
inner_width = 64.1;       // inner opening width
shelf_z = 13.0;           // Z where top cap begins
total_height = 23.0;

// --- Fine mesh parameters ---
hex_radius = 1.0;         // ~2mm holes
hex_wall = 0.8;           // wall between holes
mesh_border = 5.0;        // solid border inside innermost rect

// Innermost rectangle center
inner_cx = (7.2 + 142.7) / 2;   // ~74.95
inner_cy = (7.5 + 67.6) / 2;    // ~37.55

// Grid area = innermost rect minus border on each side
grid_length = 135.5 - 2 * mesh_border;   // ~125.5
grid_width = 60.1 - 2 * mesh_border;     // ~50.1

// Cut height exceeds full part (23mm)
cut_height = 30;

// --- Modules ---

module rounded_rect(length, width, h, radius) {
    r = min(radius, length/2, width/2);
    hull() {
        translate([r, r, 0]) cylinder(r=r, h=h);
        translate([length - r, r, 0]) cylinder(r=r, h=h);
        translate([r, width - r, 0]) cylinder(r=r, h=h);
        translate([length - r, width - r, 0]) cylinder(r=r, h=h);
    }
}

module hex_grid(area_l, area_w, hex_r, wall_p, h) {
    cs = hex_r + wall_p;
    dx = sqrt(3) * cs;
    dy = 1.5 * cs;
    cols = ceil(area_l / dx) + 1;
    rows = ceil(area_w / dy) + 1;
    for (row = [-rows:rows])
        for (col = [-cols:cols]) {
            xoff = (row % 2 == 0) ? 0 : dx / 2;
            x = col * dx + xoff;
            y = row * dy;
            if (abs(x) < area_l / 2 - hex_r &&
                abs(y) < area_w / 2 - hex_r)
                translate([x, y, 0])
                    cylinder(r = hex_r, h = h, $fn = 6);
        }
}

// --- Construction ---
difference() {
    union() {
        // Original lid (has center opening)
        import("reference-lid.stl");

        // Fill the center opening with a solid cap
        translate([inner_x, inner_y, shelf_z])
            rounded_rect(inner_length, inner_width,
                         total_height - shelf_z, corner_radius);
    }

    // Cut fine hex mesh through everything, full depth
    translate([inner_cx, inner_cy, -3])
        hex_grid(grid_length, grid_width,
                 hex_radius, hex_wall, cut_height);
}
