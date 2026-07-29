import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MassifEsterelPage extends StatefulWidget {
  const MassifEsterelPage({super.key});

  @override
  State<MassifEsterelPage> createState() => _MassifEsterelPageState();
}

class _MassifEsterelPageState extends State<MassifEsterelPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Esterel Red (Volcanic rocks)
    const Color rougeEsterel = Color(0xFFC0392B);

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
                'assets/ima/14.jpg',
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
                      'Esterel Massif 🌋',
                      style: GoogleFonts.cinzel(
                        color: rougeEsterel,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Var / Alpes-Maritimes", rougeEsterel),
                    _buildFactLine("Structure", "Red porphyry volcanic massif", rougeEsterel),
                    _buildFactLine("Looks like", "Calanques de Piana (Corsica 🇨🇵)", rougeEsterel),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 A flamboyant contrast on the Mediterranean",
                      style: GoogleFonts.montserrat(
                        color: rougeEsterel.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Esterel Massif is a geological jewel where red volcanic rock sculpts jagged cliffs dropping steeply into a deep blue sea. This massif offers a striking panorama, combining wooded hiking trails, secret coves, and breathtaking views of the French Riviera coastline.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', rougeEsterel),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: rougeEsterel),
                        _buildTableRow(['🚗 By Car', 'Corniche d\'Or (D6098) - panoramic view']),
                        _buildTableRow(['🥾 Hiking', 'Marked trails to Cap Roux or Pic de l\'Ours']),
                        _buildTableRow(['🛶 Kayak', 'Exploration of coves inaccessible by land']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', rougeEsterel),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/12.jpg'),
                          _buildGalleryImage('assets/ima/15.jpg'),
                          _buildGalleryImage('assets/ima/16.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', rougeEsterel),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_twilight, "Light: the red rocks become glowing at golden hour.", rougeEsterel),
                          _buildTechRow(Icons.fire_truck, "Prevention: access forbidden during strong winds (fire risk) - check the weather.", rougeEsterel),
                          _buildTechRow(Icons.water_drop, "Hydration: the massif is very dry, bring a substantial water supply.", rougeEsterel),
                          _buildTechRow(Icons.terrain, "Footwear: rocky and slippery terrain, bring good walking shoes.", rougeEsterel),
                          _buildTechRow(Icons.photo_camera, "Viewpoint: do not miss the panorama from the summit of Pic de l'Ours.", rougeEsterel),
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