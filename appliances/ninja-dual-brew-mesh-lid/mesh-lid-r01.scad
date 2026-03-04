// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r01 (initial mesh variant)
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
//
// Modification: Solid top replaced with honeycomb mesh for water evaporation
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307

$fn = 64;

// --- Lid dimensions (mm) ---
lid_length = 152;           // mm - overall length
lid_width = 96;             // mm - overall width
lid_height = 17;            // mm - overall height
corner_radius = 10;         // mm - corner rounding
wall_thickness = 3;         // mm - perimeter rim wall thickness
mesh_thickness = 2;         // mm - top mesh surface thickness

// --- Mesh parameters ---
hex_radius = 1.5;           // mm - hex hole circumradius (~3mm vertex-to-vertex)
hex_wall = 1.0;             // mm - spacing parameter for hex grid
mesh_border = 5;            // mm - solid border around mesh area

// --- Revision stamp ---
revision = "r01";
text_size = 3.5;
text_depth = 0.4;

// --- Calculated values ---
rim_height = lid_height - mesh_thickness;
mesh_area_length = lid_length - 2 * (wall_thickness + mesh_border);
mesh_area_width = lid_width - 2 * (wall_thickness + mesh_border);

cell_size = hex_radius + hex_wall;
col_spacing = sqrt(3) * cell_size;
row_spacing = 1.5 * cell_size;

hex_flat_to_flat = hex_radius * sqrt(3);
min_wall_vertex = sqrt(3) * cell_size - 2 * hex_radius;
min_wall_flat = sqrt(3) * hex_wall;

// --- Verification output ---
echo("===========================================");
echo("       VERIFICATION REPORT - r01");
echo("   Ninja Dual Brew Mesh Lid");
echo("===========================================");
echo("");
echo("--- LID DIMENSIONS ---");
echo("Overall:", lid_length, "x", lid_width, "x", lid_height, "mm");
echo("Wall Thickness:", wall_thickness, "mm");
echo("Mesh Thickness:", mesh_thickness, "mm");
echo("Rim Height:", rim_height, "mm");
echo("Corner Radius:", corner_radius, "mm");
echo("");
echo("--- MESH PARAMETERS ---");
echo("Hex Hole Radius:", hex_radius, "mm");
echo("Hex Hole Diameter (vertex-vertex):", hex_radius * 2, "mm");
echo("Hex Hole Width (flat-flat):", hex_flat_to_flat, "mm");
echo("Hex Wall Parameter:", hex_wall, "mm");
echo("Min Wall (vertex-vertex):", min_wall_vertex, "mm");
echo("Min Wall (flat-flat):", min_wall_flat, "mm");
echo("Mesh Area:", mesh_area_length, "x", mesh_area_width, "mm");
echo("Mesh Border:", mesh_border, "mm");
echo("Col Spacing:", col_spacing, "mm");
echo("Row Spacing:", row_spacing, "mm");
echo("===========================================");

// --- Modules ---

// Rounded rectangle using hull of four corner cylinders
module rounded_rect(length, width, h, radius) {
    r = min(radius, length/2, width/2);
    hull() {
        translate([r, r, 0])
            cylinder(h=h, r=r);
        translate([length - r, r, 0])
            cylinder(h=h, r=r);
        translate([r, width - r, 0])
            cylinder(h=h, r=r);
        translate([length - r, width - r, 0])
            cylinder(h=h, r=r);
    }
}

// Honeycomb hex grid - holes centered on origin
module hex_grid(area_length, area_width, hex_r, wall_param, thickness) {
    cs = hex_r + wall_param;
    dx = sqrt(3) * cs;
    dy = 1.5 * cs;

    cols = ceil(area_length / dx) + 1;
    rows = ceil(area_width / dy) + 1;

    for (row = [-rows:rows]) {
        for (col = [-cols:cols]) {
            x_offset = (row % 2 == 0) ? 0 : dx / 2;
            x = col * dx + x_offset;
            y = row * dy;

            // Only place hexes within the mesh area
            if (abs(x) < area_length/2 - hex_r * 0.5 &&
                abs(y) < area_width/2 - hex_r * 0.5) {
                translate([x, y, -0.1])
                    cylinder(r=hex_r, h=thickness + 0.2, $fn=6);
            }
        }
    }
}

// --- Main construction ---
difference() {
    // 1. Outer shell - solid rounded rectangle box
    rounded_rect(lid_length, lid_width, lid_height, corner_radius);

    // 2. Hollow out interior (open bottom, keeping top plate)
    translate([wall_thickness, wall_thickness, -0.1])
        rounded_rect(
            lid_length - 2 * wall_thickness,
            lid_width - 2 * wall_thickness,
            lid_height - mesh_thickness + 0.1,
            max(1, corner_radius - wall_thickness)
        );

    // 3. Hex mesh holes through top plate
    translate([lid_length/2, lid_width/2, lid_height - mesh_thickness])
        hex_grid(
            mesh_area_length,
            mesh_area_width,
            hex_radius,
            hex_wall,
            mesh_thickness
        );

    // 4. Engrave revision number in solid border zone
    translate([lid_length - wall_thickness - mesh_border/2,
               lid_width/2,
               lid_height - text_depth + 0.01])
        linear_extrude(height = text_depth + 0.1)
            text(revision,
                 size = text_size,
                 font = "Liberation Sans:style=Bold",
                 halign = "center",
                 valign = "center",
                 $fn = 32);
}
