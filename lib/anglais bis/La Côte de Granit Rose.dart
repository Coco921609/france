import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoteGranitRosePage extends StatefulWidget {
  const CoteGranitRosePage({super.key});

  @override
  State<CoteGranitRosePage> createState() => _CoteGranitRosePageState();
}

class _CoteGranitRosePageState extends State<CoteGranitRosePage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Granite Pink / Sea Blue
    const Color granitRoseColor = Color(0xFFE5989B);

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
                'assets/ima/34.jpg',
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
                      'Pink Granite Coast ⚓',
                      style: GoogleFonts.cinzel(
                        color: granitRoseColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Côtes-d'Armor (Brittany)", granitRoseColor),
                    _buildFactLine("Structure", "Pink-hued granite rocks", granitRoseColor),
                    _buildFactLine("Looks like", "Seychelles (Africa 🇸🇨)", granitRoseColor),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 A mineral chaos shaped by the winds",
                      style: GoogleFonts.montserrat(
                        color: granitRoseColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Pink Granite Coast is one of the most iconic landscapes in Brittany. Between Ploumanac'h and Trébeurden, enormous rocks with strange shapes and unique shades of pink plunge into turquoise waters. It is a permanent spectacle where the strength of the ocean meets the ruggedness of the Breton land.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', granitRoseColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: granitRoseColor),
                        _buildTableRow(['🥾 Hiking', 'Customs Trail (GR34) for the best view']),
                        _buildTableRow(['🚗 By Car', 'Parking lots in Ploumanac\'h (very popular in high season)']),
                        _buildTableRow(['⛵ By Sea', 'Boat tour to see the rocks from another angle']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', granitRoseColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/35.webp'),
                          _buildGalleryImage('assets/ima/36.webp'),
                          _buildGalleryImage('assets/ima/37.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', granitRoseColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.brightness_medium, "Light: the rocks are magnificent at sunset, when the pink color intensifies.", granitRoseColor),
                          _buildTechRow(Icons.hiking, "GR34: the section between Ploumanac'h and the lighthouse is a must-see.", granitRoseColor),
                          _buildTechRow(Icons.waves, "Tides: the rocks show different faces depending on the sea level.", granitRoseColor),
                          _buildTechRow(Icons.wind_power, "Wind: the seaside is exposed, always bring a jacket even in good weather.", granitRoseColor),
                          _buildTechRow(Icons.directions_walk, "Respect: stay on marked trails, coastal vegetation is very fragile.", granitRoseColor),
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