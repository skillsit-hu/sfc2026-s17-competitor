# ORION-X Website — Content for Layout

Ready-to-use English copy for all four required pages, plus global elements and suggested SEO metadata. Paste directly into the markup; adjust line breaks as needed for your design.

---

## Global Elements

**Site name:** ORION-X

**Navigation labels:**
- Mission Control
- Interplanetary Route
- Join Mission
- Space Data Center

**Footer:**
- Tagline: "ORION-X Interplanetary Mission — an international deep-space exploration initiative: Earth to Titan."
- Quick links: Mission Control · Interplanetary Route · Join Mission · Space Data Center
- Contact: mission.control@orion-x.space
- Legal note: "This is a simulated project created for educational and competition purposes only."
- Copyright: "© 2026 ORION-X. All rights reserved."

**Suggested partner / sponsor names** (for the logo strip and digital plaque):
- Helios Aerospace Institute
- Pallas Robotics Group
- Trans-Lunar Research Consortium
- Kepler Foundation for Space Education
- Vantage Systems Engineering

---

## 1. Mission Control — index.html

**SEO:**
- `<title>`: ORION-X — Interplanetary Mission: Pathway to New Worlds
- Meta description: "ORION-X is an international deep-space mission travelling from Earth to the Moon, Mars, Europa and Titan. Follow the route, the science, and how to take part."

**Hero headline:** ORION-X: Pathway Beyond Earth

**Hero subtitle:** An interplanetary mission charting a course through deep space — from the Moon to the icy moons of the outer solar system.

**Video alt text / caption:** Visualization of the ORION-X spacecraft and its planned trajectory through the solar system.

**Mission overview (body copy):**
ORION-X is a long-duration spacecraft mission designed to test gravitational-assist trajectories, deep-space life-support systems, and interplanetary communication relays on a multi-year journey from Earth to Titan. Along the way, the spacecraft will conduct flybys and scientific surveys of the Moon, Mars, and the icy moon Europa before reaching its final destination. The mission is a collaboration between research institutions, engineering partners, and education programs working to push the boundaries of deep-space exploration.

**Key Mission Facts strip:**
- Launch window — Q1 2027
- Mission duration — approx. 8 years
- Distance travelled — over 1.2 billion km
- Destinations — Moon · Mars · Europa · Titan

**Route map caption:** The planned trajectory of the ORION-X spacecraft across five major waypoints.

**Partner section heading:** Our partners

**Partner call-to-action copy:** ORION-X is made possible by our research, engineering, and education partners. Interested in joining them?

**Partner CTA button:** Become a partner

---

## 2. Interplanetary Route — route.html

**SEO:**
- `<title>`: Interplanetary Route — ORION-X Mission
- Meta description: "Explore the ORION-X spacecraft's route from Earth to Titan, including distance, travel time, and research objectives at each waypoint."

**Page heading:** Interplanetary Route

**Intro paragraph:**
ORION-X follows a carefully staged trajectory, using the gravity of each waypoint to gain speed and conserve fuel on its way to the outer solar system. Explore each leg of the journey below.

**Timeline waypoints:**

1. **Earth** — Mission start
   Launch site and starting point of the ORION-X trajectory.

2. **Moon**
   - Distance: ~384,000 km from Earth
   - Travel time: ~3 days
   - Objective: lunar gravity-assist maneuver and system checkout
   - Description: "The first leg of the journey tests onboard systems and uses a close lunar flyby to begin building speed for the long transit ahead."

3. **Mars**
   - Distance: ~225 million km from Earth (average)
   - Travel time: ~7 months
   - Objective: atmospheric entry studies and sample-return relay testing
   - Description: "At Mars, ORION-X studies atmospheric entry conditions and tests communication relays that will support future sample-return missions."

4. **Europa**
   - Distance: ~628 million km from Earth (Jupiter system)
   - Travel time: ~3 years cumulative
   - Objective: subsurface ocean and ice-shell investigation
   - Description: "Europa's icy shell may hide a liquid ocean beneath. ORION-X gathers data on its surface composition and subsurface structure."

5. **Titan**
   - Distance: ~1.2 billion km from Earth (Saturn system)
   - Travel time: ~7 years cumulative
   - Objective: atmospheric chemistry and prebiotic molecule research
   - Description: "The mission's final destination, Titan offers a thick atmosphere rich in organic chemistry — a natural laboratory for studying the building blocks of life."

**Implementation note (not page copy):** Card selection/expansion should be implemented with CSS only (`:checked` + sibling selector, or `:target`) — no JavaScript.

---

## 3. Join Mission — join.html

**SEO:**
- `<title>`: Join Mission — ORION-X
- Meta description: "Become a partner in the ORION-X interplanetary mission. Register as an Explorer, Scientist, Engineer, or Ambassador and support deep-space exploration."

**Page heading:** Join the Mission

**Intro paragraph:**
ORION-X invites research institutions, companies, and individuals to take part in humanity's next great voyage. Choose how you would like to be part of the mission below.

**Role descriptions:**
- **Explorer** (individual supporter): "Register your name for inclusion in the mission's digital time capsule and follow ORION-X's journey."
- **Scientist** (research partner): "Sponsor a research instrument or onboard experiment — your name or logo will be featured on the digital mission plaque."
- **Engineer** (technical partner): "Contribute engineering expertise or hardware to the mission and be credited as a technical partner."
- **Ambassador** (presenting partner): "Become the mission's presenting partner, with your logo featured across the website and all official ORION-X communications."

**Areas of collaboration (checkboxes):**
- Engineering — onboard systems, propulsion, and hardware
- Science — research instruments and data analysis
- Education — public outreach and educational programs

**Form section heading:** Partner registration

**Form fields and labels:**
- Full name *(required)*
- Email address *(required, `type="email"`)*
- Organization *(optional)*
- Phone number *(optional, `type="tel"`)*
- Role *(required — select: Explorer / Scientist / Engineer / Ambassador)*
- Conditional field for Scientist/Engineer: "Instrument or system name (max 25 characters)"
- Conditional field for Ambassador: "Upload your logo"
- Conditional field for Explorer: "Support amount (optional)"

**Validation helper text:** "Fields marked with * are required. Email must be a valid address."

**Submit button label:** Join the mission

**Post-submit note (for development reference only — not required to be functional):** "Thank you for your interest — our team will be in touch shortly." (Form handling does not need to be implemented yet.)

---

## 4. Space Data Center — space-data.html

**SEO:**
- `<title>`: Space Data Center — ORION-X Mission Telemetry
- Meta description: "Follow the current simulated status of the ORION-X spacecraft, including mission status, distance, energy level, and communication delay."

**Page heading:** Space Data Center

**Intro paragraph:**
This dashboard reflects ORION-X's current simulated status, shown here for demonstration purposes.

**Dashboard tiles:**
- **Mission status:** En route — Mars transfer orbit
- **Current objective:** Mid-course trajectory correction
- **Distance to next waypoint:** 42.6 million km to Mars
- **Energy level:** 87% — nominal
- **Communication status:** 6 min 12 sec delay (one-way)

**Position map caption:** Current simulated position of the ORION-X spacecraft along its interplanetary route.

**Disclaimer note:** "Values shown are static placeholders for this demonstration — no live data or scripting required."

---

## Notes for the competitor

- All copy above is illustrative and may be adjusted for length, tone, or design fit — as long as it stays internally consistent across pages (e.g. the route distances/timings should match between the Mission Control map, the Interplanetary Route page, and the Space Data Center).
- Suggested alt text has been included for the video and maps; remember to also add alt text for partner/sponsor logos (e.g. `alt="Helios Aerospace Institute logo"`).
- Keep heading hierarchy consistent (one `<h1>` per page, sequential `<h2>`/`<h3>` for sections) to support both accessibility and SEO.
