import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuatreLacsPage extends StatefulWidget {
  const QuatreLacsPage({super.key});

  @override
  State<QuatreLacsPage> createState() => _QuatreLacsPageState();
}

class _QuatreLacsPageState extends State<QuatreLacsPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuLoch = Color(0xFF2874A6);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/11.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU (Remonté légèrement pour le design)
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
                      'The 4 Lakes 🏴󠁧󠁢󠁳󠁣󠁴󠁿',
                      style: GoogleFonts.cinzel(
                        color: bleuLoch,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Names", "Ilay, Narlay, Petit & Grand Maclu", bleuLoch),
                    _buildFactLine("Viewpoint", "Pic de l'Aigle Viewpoint", bleuLoch),
                    _buildFactLine("Looks like", "Highlands (Scotland 🏴󠁧󠁢󠁳󠁣󠁴󠁿)", bleuLoch),

                    const SizedBox(height: 25),
                    Text(
                      "🏴󠁧󠁢󠁳󠁣󠁴󠁿 Little Scotland in the heart of the Jura",
                      style: GoogleFonts.montserrat(
                        color: bleuLoch.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Nicknamed \"Little Scotland\", the 4 lakes region offers a breathtaking panorama. Surrounded by dense fir forests, these glacial jewels with emerald and turquoise waters reveal themselves spectacularly from the summit of the Pic de l'Aigle, in a mystical atmosphere worthy of the Highlands.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Best seasons', bleuLoch),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Advice'], isHeader: true, hColor: bleuLoch),
                        _buildTableRow(['🍂 Autumn', 'RECOMMENDED: Morning mist, russet colors, and a 100% Scottish atmosphere']),
                        _buildTableRow(['☀️ Summer', 'Pleasant for long hikes, but viewpoints are often very crowded']),
                        _buildTableRow(['❄️ Winter', 'AVOID (or use caution): Trails to the Pic de l\'Aigle are snowy and sometimes icy']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Recommended times', bleuLoch),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Advice'], isHeader: true, hColor: bleuLoch),
                        _buildTableRow(['✨ Morning', 'RECOMMENDED: Magical with the mist hovering over the lakes']),
                        _buildTableRow(['🌅 Evening', 'RECOMMENDED: Warm sunset colors from the viewpoint']),
                        _buildTableRow(['🌙 Night', 'AVOID: Unlit areas, danger of falling on the ridges']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Preview of the location', bleuLoch),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/10.jpg'),
                          _buildGalleryImage('assets/image/12.jpg'),
                          _buildGalleryImage('assets/image/15.jpeg'),
                          _buildGalleryImage('assets/image/17.jpg'),
                          _buildGalleryImage('assets/image/14.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Essentials & Info', bleuLoch),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Located in the Jura department", bleuLoch),
                          _buildTechRow(Icons.directions_walk, "Hiking is essential to reach the 4 Lakes Viewpoint", bleuLoch),
                          _buildTechRow(Icons.do_not_disturb_alt, "Swimming is often regulated or prohibited to preserve the area", bleuLoch),
                          _buildTechRow(Icons.camera_alt, "Exceptional location for landscape photography", bleuLoch),
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