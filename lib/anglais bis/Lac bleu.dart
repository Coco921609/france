import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacPage extends StatefulWidget {
  const LacPage({super.key});

  @override
  State<LacPage> createState() => _LacBleuPageState();
}

class _LacBleuPageState extends State<LacPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Sapphire Blue (The intense and deep color of the lake)
    const Color bleuSaphir = Color(0xFF1976D2);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. TOP IMAGE
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/imag/33.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENT
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF141619),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blue Lake 💙',
                      style: GoogleFonts.cinzel(
                        color: bleuSaphir,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Occitania (High Pyrenees)", bleuSaphir),
                    _buildFactLine("Type", "Glacial lake (1947m)", bleuSaphir),
                    _buildFactLine("Looks like", "Moraine Lake (Canada 🇨🇦)", bleuSaphir),

                    const SizedBox(height: 25),
                    Text(
                      "💎 The sapphire jewel of the Lesponne valley",
                      style: GoogleFonts.montserrat(
                        color: bleuSaphir.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "With a depth of 120 meters, the Blue Lake is the deepest lake in the French Pyrenees. Nestled at an altitude of nearly 2000 meters, it owes its name to the incredibly intense sapphire blue color of its waters. Surrounded by towering ridges, it is a legendary destination earned after a demanding ascent.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', bleuSaphir),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: bleuSaphir),
                        _buildTableRow(['🚗 By Car', 'Up to the Chiroulet parking lot, the starting point of the ascent.']),
                        _buildTableRow(['🥾 Hiking', 'About 2h30 to 3h of steep climbing (+900m elevation gain).']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY (Before advice)
                    _buildSectionTitle('📸 Gallery', bleuSaphir),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/31.webp'),
                          _buildGalleryImage('assets/imag/30.webp'),
                          _buildGalleryImage('assets/imag/34.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', bleuSaphir),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking, "Demanding: the climb is long and rocky, come equipped.", bleuSaphir),
                          _buildTechRow(Icons.not_interested, "No swimming (the water serves as a reservoir for the valley and remains freezing).", bleuSaphir),
                          _buildTechRow(Icons.wb_cloudy, "Leave early in the morning when it's cool, the ascent is very exposed to the sun.", bleuSaphir),
                          _buildTechRow(Icons.ac_unit, "Watch out for snow patches early in the season (until June/July).", bleuSaphir),
                          _buildTechRow(Icons.landscape, "Possibility to extend the hike to the Green Lake by making a loop.", bleuSaphir),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16))),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(cell, style: GoogleFonts.montserrat(
          color: isHeader ? hColor : Colors.white70,
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}