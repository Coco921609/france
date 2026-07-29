import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CascadesDesTufsPage extends StatefulWidget {
  const CascadesDesTufsPage({super.key});

  @override
  State<CascadesDesTufsPage> createState() => _CascadesDesTufsPageState();
}

class _CascadesDesTufsPageState extends State<CascadesDesTufsPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Emerald Green / Water
    const Color vertCascade = Color(0xFF27AE60);

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
                'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
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
                      'Tufs Waterfalls 💧',
                      style: GoogleFonts.cinzel(
                        color: vertCascade,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Jura", "A taste of Bali (Indonesia)", vertCascade),

                    const SizedBox(height: 25),

                    Text(
                      "🇮🇩 The tropical gem of the Jura",
                      style: GoogleFonts.montserrat(
                        color: vertCascade.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A spectacular waterfall where water flows through tufa walls covered in moss. This lush landscape offers a spectacle worthy of the tropical forests of Southeast Asia.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 Season & Crowds', vertCascade),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Time', 'Tips'],
                      ['🌱 Spring', 'Maximum water flow (Ideal)'],
                      ['🍂 Autumn', 'Magnificent colors in the forest'],
                      ['👥 Crowds', 'Avoid Sunday afternoons'],
                    ], vertCascade),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Preview of the site', vertCascade),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/a4a00cbdb51fc9dce164469ace03ec7f-cascades-des-tufs-dans-le-jura-pres-darbois-890x0-f0fe8c58f7f431744cfb47fb412cf244.jpg'),
                          _buildGalleryImage('assets/images/juratourisme-tufs.jpg'),
                          _buildGalleryImage(
                              'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Practical Info', vertCascade),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.euro_symbol, "Access: Free",
                              vertCascade),
                          _buildTechRow(Icons.directions_walk,
                              "Easy access from Les Planches", vertCascade),
                          _buildTechRow(Icons.camera_alt,
                              "Highly photogenic spot", vertCascade),
                          _buildTechRow(Icons.warning_amber_rounded,
                              "Warning: Slippery rocks", vertCascade),
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

  // --- DESIGN HELPERS ---

  Widget _buildTranslationLine(String location, String analogy, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(location,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogy,
            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                style: GoogleFonts.montserrat(
                  color: idx == 0 ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight:
                  idx == 0 ? FontWeight.bold : FontWeight.normal,
                ),
                softWrap: true),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cinzel(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
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
          Expanded(
              child: Text(label,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}