// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r02 (parametric from Lid.stl dimensions)
// Reference: Coffee Maker Auto-Filler lid (Printables 410550) by Joshua Foster
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307
//
// Modification: Top cap filled with fine honeycomb mesh

$fn = 64;

// --- Lid dimensions from Lid.stl (mm) ---
outer_length = 149.9;
outer_width = 75.1;
total_height = 23.0;
corner_radius = 9.0;
flange_height = 2.5;

// --- Drop-in wall dimensions ---
wall_inset_x = 7.25;
wall_inset_y = 7.5;
wall_length = outer_length - 2 * wall_inset_x;
wall_width = outer_width - 2 * wall_inset_y;
wall_thickness = 3.0;
shelf_z = 13.0;

// --- Top cap dimensions ---
cap_taper_x = 2.25;
cap_taper_y = 2.5;
cap_top_length = outer_length - 2 * cap_taper_x;
cap_top_width = outer_width - 2 * cap_taper_y;

// --- Inner opening ---
cap_inner_offset_x = 1.9;
cap_inner_offset_y = 2.0;
inner_length = wall_length + 2 * cap_inner_offset_x;
inner_width = wall_width + 2 * cap_inner_offset_y;
inner_origin_x = wall_inset_x - cap_inner_offset_x;
inner_origin_y = wall_inset_y - cap_inner_offset_y;
mesh_thickness = 2.0;

// --- Fine mesh parameters ---
hex_radius = 1.0;
hex_wall = 0.8;
mesh_border = 5.0;

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
// Single difference: solid lid minus interior cavity minus hex mesh

difference() {
    union() {
        // 1. Base flange
        rounded_rect(outer_length, outer_width, flange_height, corner_radius);

        // 2. Drop-in walls (hollow shell)
        translate([wall_inset_x, wall_inset_y, 0])
        difference() {
            rounded_rect(wall_length, wall_width, shelf_z, corner_radius);
            translate([wall_thickness, wall_thickness, flange_height])
                rounded_rect(
                    wall_length - 2 * wall_thickness,
                    wall_width - 2 * wall_thickness,
                    shelf_z + 1,
                    max(1, corner_radius - wall_thickness));
        }

        // 3. Top cap (tapered, solid — no auto-filler hole)
        hull() {
            translate([0, 0, shelf_z])
                rounded_rect(outer_length, outer_width, 0.01, corner_radius);
            translate([cap_taper_x, cap_taper_y, total_height - 0.01])
                rounded_rect(cap_top_length, cap_top_width, 0.01,
                             max(1, corner_radius - cap_taper_x));
        }
    }

    // 4. Cut interior cavity (below mesh plate)
    translate([inner_origin_x, inner_origin_y, shelf_z - 0.1])
        rounded_rect(inner_length, inner_width,
                     total_height - shelf_z - mesh_thickness + 0.2,
                     corner_radius);

    // 5. Cut fine hex mesh through top cap only (above shelf)
    translate([inner_origin_x + inner_length/2,
               inner_origin_y + inner_width/2, shelf_z])
        hex_grid(inner_length - 2 * mesh_border,
                 inner_width - 2 * mesh_border,
                 hex_radius, hex_wall, total_height - shelf_z + 1);
}
