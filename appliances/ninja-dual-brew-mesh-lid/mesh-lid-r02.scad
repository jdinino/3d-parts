// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r02 (import-based from louspinuso reference geometry)
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307
//
// Modification: Top surface replaced with honeycomb mesh for water evaporation
// Approach: Imports reference STL directly to preserve complex non-rectangular contour

$fn = 64;

// --- Reference geometry (from ninjacoffeewaterlid.stl analysis) ---
// Overall: 152 x 96 x 17mm
// Z=0: Full outer contour (152x96)
// Z=1: Inner step/rim (139x86, inset ~6.5mm)
// Z=5: Back to full outer (152x96, shelf/flange)
// Z=17: Top surface (142x89, slightly narrower)
// Center offset: approximately (2.0, 3.5) in XY
// Complex non-rectangular contour (wider in middle, narrower at ends)

total_height = 17.0;
base_z = 1.0;           // bottom of interior cavity
wall_thick = 3.0;        // wall thickness for hollow interior
mesh_thickness = 2.0;    // mesh plate thickness at top

// --- Mesh parameters ---
hex_radius = 1.5;        // hex hole circumradius (~3mm holes)
hex_wall = 1.0;          // spacing between hex holes
mesh_border = 5.0;       // solid border inside mesh edge

// --- Revision stamp ---
revision = "r02";
text_size = 3.5;
text_depth = 0.4;

// --- Approximate center of reference geometry ---
center_x = 2.0;
center_y = 3.5;

// --- Mesh area (conservative, fits within top surface) ---
mesh_area_length = 130;  // hex grid coverage length
mesh_area_width = 76;    // hex grid coverage width

// --- Calculated ---
cell_size = hex_radius + hex_wall;
col_spacing = sqrt(3) * cell_size;
row_spacing = 1.5 * cell_size;
hex_flat_to_flat = hex_radius * sqrt(3);
min_wall_vertex = sqrt(3) * cell_size - 2 * hex_radius;

// --- Verification output ---
echo("===========================================");
echo("       VERIFICATION REPORT - r02");
echo("   Ninja Dual Brew Mesh Lid");
echo("   (import-based from louspinuso geometry)");
echo("===========================================");
echo("");
echo("--- REFERENCE GEOMETRY ---");
echo("Source: reference-lid.stl (ninjacoffeewaterlid.stl by louspinuso)");
echo("Overall: 152 x 96 x 17 mm");
echo("Contour: Complex non-rectangular (wider in middle)");
echo("");
echo("--- MESH PARAMETERS ---");
echo("Hex Hole Diameter:", hex_radius * 2, "mm");
echo("Hex Flat-to-Flat:", hex_flat_to_flat, "mm");
echo("Min Wall:", min_wall_vertex, "mm");
echo("Mesh Area:", mesh_area_length, "x", mesh_area_width, "mm");
echo("Mesh Thickness:", mesh_thickness, "mm");
echo("Mesh Border:", mesh_border, "mm");
echo("Wall Thickness:", wall_thick, "mm");
echo("===========================================");

// --- Modules ---

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

            if (abs(x) < area_length/2 - hex_r * 0.5 &&
                abs(y) < area_width/2 - hex_r * 0.5) {
                translate([x, y, -0.1])
                    cylinder(r=hex_r, h=thickness + 0.2, $fn=6);
            }
        }
    }
}

// --- Main construction ---
// Import reference STL, hollow interior, cut hex mesh through top

difference() {
    // Start with the full reference lid
    import("reference-lid.stl");

    // Hollow interior: project cross-section at Z=1 (inner step),
    // offset inward by wall thickness, extrude from base_z to
    // total_height minus mesh plate thickness
    translate([0, 0, base_z])
        linear_extrude(height = total_height - base_z - mesh_thickness)
            offset(r = -wall_thick)
                projection(cut = true)
                    translate([0, 0, -base_z])
                        import("reference-lid.stl");

    // Hex mesh holes through top mesh plate
    // Clip to the top surface shape using intersection
    intersection() {
        // Hex grid covering the mesh area
        translate([center_x, center_y, total_height - mesh_thickness - 0.1])
            hex_grid(
                mesh_area_length - 2 * mesh_border,
                mesh_area_width - 2 * mesh_border,
                hex_radius,
                hex_wall,
                mesh_thickness + 0.2
            );

        // Clip to top surface minus border
        translate([0, 0, total_height - mesh_thickness - 0.2])
            linear_extrude(height = mesh_thickness + 0.4)
                offset(r = -(wall_thick + mesh_border))
                    projection(cut = true)
                        translate([0, 0, -total_height + 0.5])
                            import("reference-lid.stl");
    }

    // Engrave revision stamp in solid border zone
    translate([center_x + 55, center_y,
               total_height - text_depth + 0.01])
        linear_extrude(height = text_depth + 0.1)
            text(revision,
                 size = text_size,
                 font = "Liberation Sans:style=Bold",
                 halign = "center",
                 valign = "center",
                 $fn = 32);
}
