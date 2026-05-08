// =====================================================================
// M5 × 0.8 BLEEDER TOOL
// Flat-head screw + hex grip + curved-top stem + dome with through-bore.
// Zero-torque clutch bleeder tool for the Harley-Davidson V-Rod secondary
// clutch actuator. Threaded into the bleed port (in place of the OEM
// bleeder screw, HD 36757-01K, which is removed for the bleed and
// reinstalled after) by hand only — no wrench, no torque. Hex grip is
// for finger purchase. Brief DOT brake fluid contact only. NOT a part
// of the bike, NOT a substitute for the screw — it does not seal the
// port. Sole function: route fluid into a vinyl hose during bleeding.
// =====================================================================
//
// PLA PRINT SETTINGS (tested, prints support-free)
// -----------------------------------------------------------------
// Nozzle:         0.2 mm STRONGLY RECOMMENDED. The M5×0.8 thread crests
//                 are only 0.43 mm radial — a 0.4 mm nozzle smears them
//                 into a coarse helix; a 0.2 mm nozzle resolves discrete
//                 ridges. Set extrusion width to 0.20–0.22 mm.
// Orientation:    threads down, dome up
// Supports:       OFF (geometry is designed support-free)
// Layer height:   0.08 mm with 0.2 mm nozzle (use this for the M5 threads)
//                 0.12 mm with 0.4 mm nozzle (acceptable, threads coarser)
// Perimeters:     4
// Infill:         100 %  (small part, sparse infill saves nothing meaningful)
// Brim:           15 mm wide, 8 outline loops  (small first-layer footprint)
// Seam:           RANDOM (required) — an aligned/sharpest-corner seam puts
//                 the layer-change scar on a single radial line down the
//                 shaft, gashing every thread along that line. Random seam
//                 spreads the artefact around the helix so no thread is
//                 consistently damaged.
//
// First layer:
//   Speed:        12 mm/s
//   Nozzle:       215 °C
//   Bed:          70 °C   (KEEP at 70 °C the whole print — small part)
//   Flow:         +5 to +10 %
//   Fan:          OFF for first 5 layers, then 100 %
//
// Bulk:
//   Outer wall:   15–20 mm/s  (slow at hex layers, the corners cause rocking)
//   Inner / inf:  50 mm/s
//   Nozzle:       205–210 °C  (215 for "PLA+" / premium, 220 for silk PLA)
//
// Travels (critical for silk PLA):
//   Z-hop:        0.4 mm — REQUIRED. Small first-layer footprint means the
//                 brim is the only thing holding the part to the bed; without
//                 Z-hop, the nozzle drags across the dome on travel moves and
//                 rips the print off the build plate. Enable on every retract.
//                 PrusaSlicer: Printer Settings → Extruder → Lift Z.
//   Retraction:   1.0–1.5 mm direct drive, 4–5 mm Bowden
//
// If the part rocks loose mid-print: print 3–4 copies on the bed at once,
// or reduce TEXT_HEIGHT, or fall back to a sacrificial print pad.
// =====================================================================

include <BOSL2/std.scad>
include <BOSL2/threading.scad>

$fn = 96;

// ---- DIMENSIONS ----
SHAFT_D     = 5.0;
SHAFT_PITCH = 0.8;
SHAFT_H     = 12.0;

HEX_AF      = 8.0;
HEX_H       = 3.0;
HEX_CORNERS = HEX_AF / cos(30);

// Underlying cylinder dia of the threaded rod (the "core" the threads are cut
// from) = minor diameter for ISO 60° threads.
//   minor_d = major_d - 2 * (5/8) * (pitch * √3 / 2)
SHAFT_MINOR_D = SHAFT_D - 2 * (5/8) * (SHAFT_PITCH * sqrt(3)/2);

HEX_UNDER_H = (HEX_CORNERS - SHAFT_MINOR_D) / 2;   // 45° flat-head countersink
HEX_OVER_H  = 2.5;                                  // curved over-hex height

STEM_D       = 5.0;
STEM_H       = 5.0;

DOME_D       = 7.0;
DOME_R       = DOME_D / 2;
DOME_UNDER_H = (DOME_D - STEM_D) / 2;

BORE_D = 2.0;

// ---- TEXT — embossed "DO NOT TORQ" on the six hex flats ----
// Enabled by default in r02. With the recommended 0.2 mm nozzle and
// 0.08 mm layer height the M5-scale letters resolve cleanly. Set to
// false if printing with a 0.4 mm nozzle and you'd prefer smooth hex
// flats over partially-legible text.
EMBOSS_TEXT = true;
// CCW order around the hex (when the part is held threads-down): when
// you rotate the printed part the natural way in your hand, the text
// reads DO NOT TORQ.
WORDS       = ["DO", "NOT", "TORQ", "DO", "NOT", "TORQ"];
TEXT_SIZE   = 1.4;
TEXT_HEIGHT = 0.3;
function word_size(w) = (w == "TORQ") ? 1.0 : TEXT_SIZE;

// ---- BUILD ----
difference() {
  union() {
    // Threaded shaft.  bevel2=false: threads end at the major diameter
    // (no inverted-cone shrinking down to ~3.4 mm), so the chamfer above
    // meets them as a single 5 mm circle.
    threaded_rod(d=SHAFT_D, l=SHAFT_H, pitch=SHAFT_PITCH,
                 internal=false,
                 bevel1=true,
                 bevel2=false,
                 anchor=BOTTOM);

    // Flat-head countersink + hex flats (single skinned solid).  The chamfer
    // base now matches the underlying cylinder of the threaded rod (minor
    // diameter ≈ 4.134 mm), so the cylinder flows continuously into the
    // chamfer.  Thread crests at the major dia (5 mm) project past the
    // chamfer base by ~0.43 mm radially — that's just the thread teeth on
    // top of the cylinder, exactly as on a real screw.
    translate([0, 0, SHAFT_H])
      skin([
        regular_ngon(n=$fn, d=SHAFT_MINOR_D),
        regular_ngon(n=6,   d=HEX_CORNERS),
        regular_ngon(n=6,   d=HEX_CORNERS)
      ],
      slices=0,
      z=[0, HEX_UNDER_H, HEX_UNDER_H + HEX_H]);

    // Curved (cosine) over-hex tapering inward to the stem dia.
    translate([0, 0, SHAFT_H + HEX_UNDER_H + HEX_H])
      rotate_extrude($fn=$fn)
        polygon(concat(
          [[0, 0], [HEX_AF/2, 0]],
          [for (i = [1 : 24])
              let(t = i / 24,
                  r = STEM_D/2 + (HEX_AF/2 - STEM_D/2) * (1 + cos(180*t)) / 2,
                  z = t * HEX_OVER_H)
              [r, z]
          ],
          [[0, HEX_OVER_H]]
        ));

    // Stem (5 mm cylinder).
    translate([0, 0, SHAFT_H + HEX_UNDER_H + HEX_H + HEX_OVER_H])
      cylinder(d=STEM_D, h=STEM_H);

    // Under-dome 45° cone.
    translate([0, 0, SHAFT_H + HEX_UNDER_H + HEX_H + HEX_OVER_H + STEM_H])
      cylinder(d1=STEM_D, d2=DOME_D, h=DOME_UNDER_H);

    // Dome — full hemisphere.
    translate([0, 0, SHAFT_H + HEX_UNDER_H + HEX_H + HEX_OVER_H + STEM_H + DOME_UNDER_H])
      difference() {
        sphere(r=DOME_R);
        translate([0, 0, -DOME_R - 0.1])
          cube([2*DOME_R + 1, 2*DOME_R + 1, DOME_R + 0.1], center=true);
      }
  }

  // ---- THROUGH-BORE ----
  total_h = SHAFT_H + HEX_UNDER_H + HEX_H + HEX_OVER_H + STEM_H + DOME_UNDER_H + DOME_R;
  translate([0, 0, -1])
    cylinder(d=BORE_D, h=total_h + 2);
}

// ---- EMBOSSED TEXT on the six hex flats (only if EMBOSS_TEXT == true) ----
if (EMBOSS_TEXT) {
  apothem       = HEX_AF / 2;
  hex_z_bot     = SHAFT_H + HEX_UNDER_H;
  text_z_center = hex_z_bot + HEX_H / 2;
  for (i = [0:5]) {
    theta = 30 + i * 60;
    translate([(apothem - 0.05) * cos(theta),
               (apothem - 0.05) * sin(theta),
               text_z_center])
      rotate([0, 0, theta + 90])
        rotate([90, 0, 0])
          linear_extrude(TEXT_HEIGHT + 0.05)
            text(WORDS[i], size=word_size(WORDS[i]),
                 halign="center", valign="center",
                 font="Liberation Sans");
  }
}
