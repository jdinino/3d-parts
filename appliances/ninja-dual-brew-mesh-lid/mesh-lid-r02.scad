// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r02
// Reference: Coffee Maker Auto-Filler lid (Printables 410550) by Joshua Foster
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307
//
// Modification: Auto-filler hole patched, Z=0 face replaced with fine honeycomb mesh

$fn = 64;

// --- Lid.stl dimensions ---
total_height = 23.0;
corner_radius = 9.0;

// Z=0 face is the main solid face of the lid (top when installed).
// Z=23 is the open rim end (goes into reservoir).
// Inner step at Z=2.5: walls narrow from outer to inner profile.
base_length = 149.9;
base_width = 75.1;

// Inner area (at Z=2.5 step)
inner_x = 7.2;
inner_y = 7.5;
inner_length = 135.4;   // 142.6 - 7.2
inner_width = 60.1;     // 67.6 - 7.5
inner_corner = max(1, corner_radius - inner_x);

// --- Mesh parameters ---
mesh_thickness = 2.0;      // mesh plate thickness
depression_depth = 2.5;    // auto-filler depression depth (Z=0 to Z=2.5)
hex_radius = 1.0;          // ~2mm holes
hex_wall = 0.8;
mesh_border = 5.0;

// --- Grid center (inner area center) ---
grid_cx = inner_x + inner_length / 2;
grid_cy = inner_y + inner_width / 2;
grid_length = inner_length - 2 * mesh_border;
grid_width = inner_width - 2 * mesh_border;

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
        // Original lid
        import("reference-lid.stl");

        // Patch: solid plate at Z=0 covering inner area
        // Height = depression_depth (2.5mm) to fully fill the auto-filler cutout
        translate([inner_x, inner_y, 0])
            rounded_rect(inner_length, inner_width,
                         depression_depth, inner_corner);
    }

    // Hex mesh cut through Z=0 face and full patch depth
    translate([grid_cx, grid_cy, -0.5])
        hex_grid(grid_length, grid_width,
                 hex_radius, hex_wall, depression_depth + 1);
}
