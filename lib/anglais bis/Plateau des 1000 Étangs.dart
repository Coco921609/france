import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlateauMilleEtangsPage extends StatefulWidget {
  const PlateauMilleEtangsPage({super.key});

  @override
  State<PlateauMilleEtangsPage> createState() => _PlateauMilleEtangsPageState();
}

class _PlateauMilleEtangsPageState extends State<PlateauMilleEtangsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuNordique = Color(0xFF3498DB);

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
                'assets/image/3.jpg',
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
                      'Plateau of 1000 Ponds 🌲',
                      style: GoogleFonts.cinzel(
                        color: bleuNordique,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Area", "Over 220 km²", bleuNordique),
                    _buildFactLine("Formation", "Glacial (12,000 years ago)", bleuNordique),

                    const SizedBox(height: 25),
                    Text(
                      "🇫🇮 The \"Little Finland\" of Haute-Saône",
                      style: GoogleFonts.montserrat(
                        color: bleuNordique.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A true natural gem, this wild territory reveals raw landscapes reminiscent of Scandinavia. Shaped by ice and the work of monks, this mysterious place with its many hiking trails invites you to explore a mosaic of forests and bodies of water.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASON TABLE
                    _buildSectionTitle('📅 Best seasons', bleuNordique),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Tips'], isHeader: true, hColor: bleuNordique),
                        _buildTableRow(['🍂 Autumn', 'RECOMMENDED: Magnificent, flamboyant tree colors reflected in the water']),
                        _buildTableRow(['🌱 Spring', 'Pleasant, nature awakening and active wildlife']),
                        _buildTableRow(['❄️ Winter', 'TO AVOID: Very harsh cold, trails potentially slippery or impassable']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TIME TABLE
                    _buildSectionTitle('⏰ Recommended times', bleuNordique),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Tips'], isHeader: true, hColor: bleuNordique),
                        _buildTableRow(['✨ Morning', 'RECOMMENDED: Mystical mist above the ponds']),
                        _buildTableRow(['🌅 Evening', 'RECOMMENDED: Soft light and sunsets over the water']),
                        _buildTableRow(['☀️ Midday / Night', 'TO AVOID: Too harsh light during the day, risk of getting lost at night']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Preview of the site', bleuNordique),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/1.jpg'),
                          _buildGalleryImage('assets/image/5.jpg'),
                          _buildGalleryImage('assets/image/6.jpg'),
                          _buildGalleryImage('assets/image/2.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Essentials & Info', bleuNordique),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Located in Haute-Saône (Bourgogne-Franche-Comté)", bleuNordique),
                          _buildTechRow(Icons.directions_walk, "Numerous hiking trails", bleuNordique),
                          _buildTechRow(Icons.nature, "Wild spaces: forests and peat bogs", bleuNordique),
                          _buildTechRow(Icons.camera_alt, "Prioritize autumn for photography", bleuNordique),
                          _buildTechRow(Icons.warning_amber_rounded, "Avoid the night and deep winter", bleuNordique),
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

  // --- STYLE METHODS ---

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