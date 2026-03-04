// Ninja Dual Brew Coffee Reservoir Mesh Lid
// Revision: r02 (import-based from louspinuso reference geometry)
// Derivative of: Ninja Dual Brew Coffee Reservoir Lid by louspinuso
// Original: https://www.printables.com/model/1501663
// Original License: CC BY-NC-SA 4.0
// OEM Reservoir Part: 129KKW300
// Compatible: CFP201, CFP250A, CFP300, CFP301, CFP305, CFP307
//
// Modification: Center opening filled with fine honeycomb mesh for water evaporation
// Approach: Imports reference STL frame, adds mesh plate into the center opening

$fn = 64;

// --- Reference geometry (ninjacoffeewaterlid.stl by louspinuso) ---
// Open-topped frame/shell lid (center opening ~130mm wide)
// Overall: 152 x 96 x 17mm, centered at approx (2.0, 3.5) in XY
// Z=0 to Z=0.998: Base rim/shelf
// Z=5 to Z=17: Top cap frame (tapered walls, center is OPEN)
// Opening at Z=17: ~118-142mm x ~89mm (wider in middle)

total_height = 17.0;
mesh_thickness = 2.0;     // mesh plate thickness

// --- Fine mesh parameters ---
hex_radius = 1.0;         // hex hole circumradius (~2mm holes)
hex_wall = 0.8;           // spacing between hex holes
mesh_border = 3.0;        // solid border around mesh area edge

// --- Revision stamp ---
revision = "r02";
text_size = 3.5;
text_depth = 0.4;

// --- Center of reference geometry ---
center_x = 2.0;
center_y = 3.5;

// --- Calculated ---
cell_size = hex_radius + hex_wall;
hex_flat_to_flat = hex_radius * sqrt(3);
min_wall_vertex = sqrt(3) * cell_size - 2 * hex_radius;

echo("===========================================");
echo("       VERIFICATION REPORT - r02");
echo("===========================================");
echo("Hex Hole Diameter:", hex_radius * 2, "mm");
echo("Hex Flat-to-Flat:", hex_flat_to_flat, "mm");
echo("Min Wall (vertex):", min_wall_vertex, "mm");
echo("Mesh Thickness:", mesh_thickness, "mm");
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
                translate([x, y, 0])
                    cylinder(r=hex_r, h=thickness, $fn=6);
            }
        }
    }
}

// --- Main construction ---
// Reference STL is an open-topped frame. Add a mesh plate into the opening.

union() {
    // 1. Original lid frame (open-topped shell)
    import("reference-lid.stl");

    // 2. Mesh plate filling the center opening
    //    Clipped to the outer boundary at Z=17 (slightly inset)
    intersection() {
        // Large mesh plate with fine hex holes
        translate([0, 0, total_height - mesh_thickness])
        difference() {
            // Solid plate covering full area
            translate([-100, -60, 0])
                cube([200, 120, mesh_thickness]);

            // Cut hex holes
            translate([center_x, center_y, -0.1])
                hex_grid(160, 100, hex_radius, hex_wall,
                         mesh_thickness + 0.2);
        }

        // Clip to the lid's outer boundary at Z=17
        // hull() fills the ring cross-section to get the outer contour
        // offset(-mesh_border) ensures solid border around mesh edge
        translate([0, 0, total_height - mesh_thickness - 0.1])
            linear_extrude(height = mesh_thickness + 0.2)
                offset(r = -mesh_border)
                    hull()
                        projection(cut = true)
                            translate([0, 0, -total_height + 0.1])
                                import("reference-lid.stl");
    }

    // 3. Solid border ring (fills gap between mesh edge and rim inner edge)
    //    This connects the mesh plate to the frame
    intersection() {
        translate([0, 0, total_height - mesh_thickness])
            linear_extrude(height = mesh_thickness)
                difference() {
                    hull()
                        projection(cut = true)
                            translate([0, 0, -total_height + 0.1])
                                import("reference-lid.stl");
                    offset(r = -mesh_border)
                        hull()
                            projection(cut = true)
                                translate([0, 0, -total_height + 0.1])
                                    import("reference-lid.stl");
                }

        // Only fill where there's actually an opening (not where rim already exists)
        translate([-100, -60, total_height - mesh_thickness - 0.1])
            cube([200, 120, mesh_thickness + 0.2]);
    }
}
