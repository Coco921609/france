import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PontDArcPage extends StatefulWidget {
  const PontDArcPage({super.key});

  @override
  State<PontDArcPage> createState() => _PontDArcPageState();
}

class _PontDArcPageState extends State<PontDArcPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertArdeche = Color(0xFF16A085);

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
                'assets/image/22.jpg',
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
                      'Pont d\'Arc 🇧🇦',
                      style: GoogleFonts.cinzel(
                        color: vertArdeche,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Dimensions", "54m high, 60m wide", vertArdeche),
                    _buildFactLine("Formation", "Carved by the Ardèche River", vertArdeche),
                    _buildFactLine("Looks like", "Karstic rivers (Bosnia 🇧🇦)", vertArdeche),

                    const SizedBox(height: 25),
                    Text(
                      "🇧🇦 A geological gem with a Balkan vibe",
                      style: GoogleFonts.montserrat(
                        color: vertArdeche.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A majestic natural arch carved over millennia, the Pont d'Arc is the monumental gateway to the Ardèche Gorges. With its spectacular limestone cliffs plunging into emerald waters, this natural masterpiece is reminiscent of the sublime karstic landscapes and crystal-clear rivers of Bosnia and Herzegovina.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASON TABLE
                    _buildSectionTitle('📅 Best seasons', vertArdeche),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Tips'], isHeader: true, hColor: vertArdeche),
                        _buildTableRow(['🌱 Spring', 'RECOMMENDED: Green nature, whitewater for canoeing, and fewer crowds']),
                        _buildTableRow(['🍂 Autumn', 'RECOMMENDED: Beautiful colors, mild climate, and great calm']),
                        _buildTableRow(['☀️ Summer', 'TO AVOID: Unless you like crowds. Canoe traffic jams and saturated beaches']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TIME TABLE
                    _buildSectionTitle('⏰ Recommended times', vertArdeche),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Tips'], isHeader: true, hColor: vertArdeche),
                        _buildTableRow(['✨ Morning (early)', 'RECOMMENDED: Mirror water, soft light, and absolute tranquility on the beach']),
                        _buildTableRow(['🌅 End of day', 'RECOMMENDED: The rock lights up in orange and tourists desert the area']),
                        _buildTableRow(['☀️ Afternoon', 'TO AVOID: Stifling heat (especially in summer) and constant noise']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Preview of the site', vertArdeche),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/18.webp'),
                          _buildGalleryImage('assets/image/17.webp'),
                          _buildGalleryImage('assets/image/20.jpg'),
                          _buildGalleryImage('assets/image/21.jpg'),
                          _buildGalleryImage('assets/image/23.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Essentials & Info', vertArdeche),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Located in Vallon-Pont-d'Arc (Ardèche)", vertArdeche),
                          _buildTechRow(Icons.kayaking, "Canoe-kayak passage under the arch is a must", vertArdeche),
                          _buildTechRow(Icons.pool, "Two equipped beaches for swimming at the foot of the arch", vertArdeche),
                          _buildTechRow(Icons.wb_sunny, "Bring sunscreen and plenty of water in the summer", vertArdeche),
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