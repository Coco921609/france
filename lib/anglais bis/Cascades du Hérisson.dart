import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CascadesDuHerissonPage extends StatefulWidget {
  const CascadesDuHerissonPage({super.key});

  @override
  State<CascadesDuHerissonPage> createState() => _CascadesDuHerissonPageState();
}

class _CascadesDuHerissonPageState extends State<CascadesDuHerissonPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Vert Émeraude (Forêt jurassienne et nature luxuriante)
    const Color vertHerisson = Color(0xFF27AE60);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/imag/24.webp',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU
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
                      'Hérisson Waterfalls 💦',
                      style: GoogleFonts.cinzel(
                        color: vertHerisson,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Location", "Bourgogne-Franche-Comté (Jura)", vertHerisson),
                    _buildFactLine("Type", "Series of 31 drops and waterfalls", vertHerisson),
                    _buildFactLine("Looks like", "Plitvice Lakes (Croatia 🇭🇷)", vertHerisson),

                    const SizedBox(height: 25),
                    Text(
                      "🌿 The magic of water in the heart of the Jura",
                      style: GoogleFonts.montserrat(
                        color: vertHerisson.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Hérisson valley offers a dazzling natural spectacle with its trail punctuated by 31 drops and waterfalls. The most famous, the Éventail (65 meters) and the Grand Saut (60 meters), display all their power within a preserved forest setting. It is one of the must-do hikes in eastern France, particularly majestic after the rains.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Visiting options', vertHerisson),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: vertHerisson),
                        _buildTableRow(['🚗 By Car', 'Three access points: Doucier (House of the Waterfalls), Bonlieu, or Ilay. Paid parking during the peak season.']),
                        _buildTableRow(['🥾 Hiking', 'A 7.4 km round-trip trail (approx. 3 hours of walking) to see all of the falls.']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Gallery', vertHerisson),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/26.jpg'),
                          _buildGalleryImage('assets/imag/28.jpg'),
                          _buildGalleryImage('assets/imag/27.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Survival tips', vertHerisson),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.water_drop, "Water flow varies greatly: sublime in spring or after rain, sometimes completely dry in summer.", vertHerisson),
                          _buildTechRow(Icons.not_interested, "Swimming is strictly prohibited across the entire natural site (prefectural decree).", vertHerisson),
                          _buildTechRow(Icons.hiking, "Good footwear is essential, as the rocks and paths are extremely slippery.", vertHerisson),
                          _buildTechRow(Icons.wb_sunny, "Highly popular site in summer: favor early mornings or the beautiful colors of autumn.", vertHerisson),
                          _buildTechRow(Icons.pets, "Dogs are allowed but must be kept on a leash at all times.", vertHerisson),
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