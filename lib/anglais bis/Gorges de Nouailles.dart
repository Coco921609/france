import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesNouaillesPage extends StatefulWidget {
  const GorgesNouaillesPage({super.key});

  @override
  State<GorgesNouaillesPage> createState() => _GorgesNouaillesPageState();
}

class _GorgesNouaillesPageState extends State<GorgesNouaillesPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertRiviere = Color(0xFF1ABC9C);

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
                'assets/image/9.jpg',
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
                      'Nouailles Gorges 🛶',
                      style: GoogleFonts.cinzel(
                        color: vertRiviere,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("River", "La Loue", vertRiviere),
                    _buildFactLine("Depth", "Up to 350 meters", vertRiviere),
                    _buildFactLine("Looks like", "Tara River Canyon (Montenegro 🇲🇪)", vertRiviere),

                    const SizedBox(height: 25),
                    Text(
                      "🦅 The spectacular Doubs canyon",
                      style: GoogleFonts.montserrat(
                        color: vertRiviere.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Carved out by the tumultuous force of the Loue River, the Nouailles Gorges offer a spectacular landscape of sheer cliffs and lush green nature. This breathtaking canyon, with its Balkan-like feel, is a true paradise for hikers. It reveals steep trails and impressive viewpoints right in the heart of the Jura mountains.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Best seasons', vertRiviere),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Advice'], isHeader: true, hColor: vertRiviere),
                        _buildTableRow(['🌱 Spring', 'RECOMMENDED: Impressive waterfall flow and lush nature']),
                        _buildTableRow(['🍂 Autumn', 'RECOMMENDED: Beautiful golden and copper hues on the cliffs']),
                        _buildTableRow(['❄️ Winter', 'AVOID: Very slippery, icy trails, highly dangerous near the edge']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Recommended times', vertRiviere),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Advice'], isHeader: true, hColor: vertRiviere),
                        _buildTableRow(['✨ Morning', 'RECOMMENDED: Cool temperatures and beautiful light through the canyon mist']),
                        _buildTableRow(['☀️ Afternoon', 'Pleasant: Perfect for completing the long hike']),
                        _buildTableRow(['🌙 Night', 'AVOID: Very steep terrain, extremely dangerous in the dark']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Preview of the location', vertRiviere),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/7.jpg'),
                          _buildGalleryImage('assets/image/8.webp'),
                          _buildGalleryImage('assets/image/9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Essentials & Info', vertRiviere),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Located near Mouthier-Haute-Pierre (Doubs)", vertRiviere),
                          _buildTechRow(Icons.directions_walk, "Technical hiking (good hiking shoes mandatory)", vertRiviere),
                          _buildTechRow(Icons.water_drop, "Spectacular viewpoints overlooking the river", vertRiviere),
                          _buildTechRow(Icons.warning_amber_rounded, "Watch out for narrow and vertiginous paths", vertRiviere),
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

  // --- MÉTHODES DE STYLE ---

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