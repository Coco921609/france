import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontagneSainteVictoirePage extends StatefulWidget {
  const MontagneSainteVictoirePage({super.key});

  @override
  State<MontagneSainteVictoirePage> createState() => _MontagneSainteVictoirePageState();
}

class _MontagneSainteVictoirePageState extends State<MontagneSainteVictoirePage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Ochre/Terracotta (The limestone rock under the Provence sun)
    const Color ocreSainteVictoire = Color(0xFFD35400);

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
                'assets/ima/1.png',
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
                      'Sainte-Victoire Mountain 🎨',
                      style: GoogleFonts.cinzel(
                        color: ocreSainteVictoire,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Bouches-du-Rhône (Aix-en-Provence)", ocreSainteVictoire),
                    _buildFactLine("Type", "18km limestone rocky ridge", ocreSainteVictoire),
                    _buildFactLine("Looks like", "Atlas Mountains (Morocco 🇲🇦)", ocreSainteVictoire),

                    const SizedBox(height: 25),
                    Text(
                      "☀️ The rock that inspired Paul Cézanne",
                      style: GoogleFonts.montserrat(
                        color: ocreSainteVictoire.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Dominating the Aix landscape with its massive silhouette, Sainte-Victoire is a natural monument of Provence. Its immaculate limestone walls, which turn pink and ochre depending on the light, fascinated Paul Cézanne, who painted it dozens of times. An ideal playground for hiking, steeped in garrigue and history.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', ocreSainteVictoire),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: ocreSainteVictoire),
                        _buildTableRow(['🚗 By Car', 'Parking lots at Le Tholonet or Vauvenargues (very popular)']),
                        _buildTableRow(['🥾 Hiking', 'Numerous trails (GR9) leading to the Croix de Provence']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', ocreSainteVictoire),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/1.png'),
                          _buildGalleryImage('assets/ima/2.webp'),
                          _buildGalleryImage('assets/ima/3.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', ocreSainteVictoire),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_twilight, "Sunrise/Sunset: a magical moment when the rock becomes glowing orange.", ocreSainteVictoire),
                          _buildTechRow(Icons.fire_truck, "Regulated access in summer: always check the fire risk before leaving.", ocreSainteVictoire),
                          _buildTechRow(Icons.local_drink, "No water source: bring a substantial supply even for a short walk.", ocreSainteVictoire),
                          _buildTechRow(Icons.air, "The Mistral wind can blow violently on the ridges: be cautious.", ocreSainteVictoire),
                          _buildTechRow(Icons.sunny, "No shade on the trails: a cap and sun protection are essential.", ocreSainteVictoire),
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