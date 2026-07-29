import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiguillesBavellaPage extends StatefulWidget {
  const AiguillesBavellaPage({super.key});

  @override
  State<AiguillesBavellaPage> createState() => _AiguillesBavellaPageState();
}

class _AiguillesBavellaPageState extends State<AiguillesBavellaPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Rosy Granite / Pine Green
    const Color granitBavella = Color(0xFFD35400);

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
                'assets/ima/18.jpg',
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
                      'Bavella Needles 🏔️',
                      style: GoogleFonts.cinzel(
                        color: granitBavella,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Southern Corsica (Bavella Massif)", granitBavella),
                    _buildFactLine("Type", "Jagged granite peaks", granitBavella),
                    _buildFactLine("Resembles", "The Dolomites (Italy 🇮🇹)", granitBavella),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 The mineral sanctuary of Alta Rocca",
                      style: GoogleFonts.montserrat(
                        color: granitBavella.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "An iconic site in Corsica, the Bavella Needles form a wall of pink granite that pierces the clouds. Between the laricio pine forests and steep faces, it is a paradise for hikers, climbers, and lovers of wild nature seeking to feel the raw power of the Island of Beauty.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visitor Options', granitBavella),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Method', 'Details'], isHeader: true, hColor: granitBavella),
                        _buildTableRow(['🚗 Car', 'Bavella Pass, accessible from Zonza or Solenzara']),
                        _buildTableRow(['🥾 Hiking', 'Trou de la Bombe trail or GR20 variant']),
                        _buildTableRow(['🧗 Climbing', 'Prestigious routes on pure granite']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALLERY
                    _buildSectionTitle('📸 Gallery', granitBavella),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/18.jpg'),
                          _buildGalleryImage('assets/ima/19.jpg'),
                          _buildGalleryImage('assets/ima/22.jpg'),
                          _buildGalleryImage('assets/ima/21.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival Tips', granitBavella),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny, "Weather: the pass is known for rapid changes, always pack a jacket.", granitBavella),
                          _buildTechRow(Icons.terrain, "Terrain: technical trails with lots of loose stones, hiking boots highly recommended.", granitBavella),
                          _buildTechRow(Icons.landscape, "Panorama: the 'Trou de la Bombe' is the signature hike, accessible to all experienced walkers.", granitBavella),
                          _buildTechRow(Icons.directions_walk, "GR20: it is a strategic crossing point, very crowded in summer on certain sectors.", granitBavella),
                          _buildTechRow(Icons.photo_size_select_actual, "Light: the cliffs are magnificent at the end of the day when they take on a deep red hue.", granitBavella),
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