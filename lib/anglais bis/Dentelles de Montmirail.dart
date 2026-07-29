import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DentellesMontmirailPage extends StatefulWidget {
  const DentellesMontmirailPage({super.key});

  @override
  State<DentellesMontmirailPage> createState() => _DentellesMontmirailPageState();
}

class _DentellesMontmirailPageState extends State<DentellesMontmirailPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Olive Green / Light Limestone
    const Color dentellesColor = Color(0xFF829356);

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
                'assets/ima/33.jpg',
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
                      'Dentelles de Montmirail 🧗',
                      style: GoogleFonts.cinzel(
                        color: dentellesColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Vaucluse (Dentelles Massif)", dentellesColor),
                    _buildFactLine("Structure", "Jagged limestone ridges", dentellesColor),
                    _buildFactLine("Looks like", "Calanques National Park (France 🇫🇷)", dentellesColor),

                    const SizedBox(height: 25),
                    Text(
                      "🌿 The rocky lace in the middle of the vineyards",
                      style: GoogleFonts.montserrat(
                        color: dentellesColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Rising from the vineyards of Gigondas and Vacqueyras, the Dentelles de Montmirail are true natural limestone sculptures. These jagged ridges offer a unique landscape in Provence, where rock climbing, hiking, and prestigious wine tasting blend in an exceptional setting.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', dentellesColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: dentellesColor),
                        _buildTableRow(['🚗 By Car', 'Villages of Lafare or Suzette for central access']),
                        _buildTableRow(['🥾 Hiking', 'Ridges and trails in the state forest']),
                        _buildTableRow(['🧗 Climbing', 'A major spot in southern France']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', dentellesColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/30.jpg'),
                          _buildGalleryImage('assets/ima/31.jpg'),
                          _buildGalleryImage('assets/ima/32.jpg'),
                          _buildGalleryImage('assets/ima/33.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', dentellesColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.landscape, "Panoramas: the ridge tour offers a breathtaking view of Mont Ventoux.", dentellesColor),
                          _buildTechRow(Icons.wine_bar, "Lifestyle: combine your outing with the discovery of the Gigondas wine cellars.", dentellesColor),
                          _buildTechRow(Icons.terrain, "Terrain: limestone can sometimes be slippery, opt for shoes with good grip.", dentellesColor),
                          _buildTechRow(Icons.wb_sunny, "Summer: high sun exposure, favor morning hikes to avoid the heat.", dentellesColor),
                          _buildTechRow(Icons.map, "Trail markers: although present, the trail network is dense, a map remains useful.", dentellesColor),
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