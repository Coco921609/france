import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SillansLaCascadePage extends StatefulWidget {
  const SillansLaCascadePage({super.key});

  @override
  State<SillansLaCascadePage> createState() => _SillansLaCascadePageState();
}

class _SillansLaCascadePageState extends State<SillansLaCascadePage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Turquoise (The color of the waterfall water)
    const Color turquoiseSillans = Color(0xFF1ABC9C);

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
                'assets/imag/21.jpg',
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
                      'Sillans-la-Cascade 💦',
                      style: GoogleFonts.cinzel(
                        color: turquoiseSillans,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Provence-Alpes-Côte d'Azur (Var)", turquoiseSillans),
                    _buildFactLine("Type", "44-meter high waterfall", turquoiseSillans),
                    _buildFactLine("Looks like", "Krka Waterfalls (Croatia 🇭🇷)", turquoiseSillans),

                    const SizedBox(height: 25),
                    Text(
                      "🌴 A tropical lagoon in the heart of the Var",
                      style: GoogleFonts.montserrat(
                        color: turquoiseSillans.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Sillans-la-Cascade offers one of the most impressive natural sights in the south of France. Its tumultuous waters fall 44 meters high into a magnificent basin with emerald and turquoise reflections, nestled within a lush green forest. A refreshing gem that is very popular when the sunny days arrive.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', turquoiseSillans),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: turquoiseSillans),
                        _buildTableRow(['🚗 Car', 'Paid parking at the village entrance (fills up quickly in summer)']),
                        _buildTableRow(['🥾 Walk', '800m marked trail (approx. 15 min) to the viewpoint']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', turquoiseSillans),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/21.webp'),
                          _buildGalleryImage('assets/imag/22.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', turquoiseSillans),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.not_interested, "Swimming strictly prohibited in the main basin (falling rocks)", turquoiseSillans),
                          _buildTechRow(Icons.security, "Stay on the marked path and do not cross the barriers", turquoiseSillans),
                          _buildTechRow(Icons.pool, "Swimming authorized only downstream (further down the river)", turquoiseSillans),
                          _buildTechRow(Icons.sunny_snowing, "Very crowded in summer: arrive early in the morning for the best light", turquoiseSillans),
                          _buildTechRow(Icons.hiking, "Closed-toe shoes recommended, the path can be slippery", turquoiseSillans),
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