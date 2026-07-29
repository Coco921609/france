import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeandreQueuillePage extends StatefulWidget {
  const MeandreQueuillePage({super.key});

  @override
  State<MeandreQueuillePage> createState() => _MeandreQueuillePageState();
}

class _MeandreQueuillePageState extends State<MeandreQueuillePage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Amazon Green / Forest
    const Color vertQueuille = Color(0xFF003E1A);

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
                'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg',
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
                      'Queuille Meander 🌿',
                      style: GoogleFonts.cinzel(
                        color: vertQueuille,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Puy-de-Dôme", "A taste of the Amazon (Brazil)", vertQueuille),

                    const SizedBox(height: 25),

                    Text(
                      "🇧🇷 The lookout at the end of the world",
                      style: GoogleFonts.montserrat(
                        color: vertQueuille.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A perfect loop formed by the Sioule river in the middle of a dense and wild forest. This exceptional panorama gives the illusion of standing before a branch of the Amazon River lost in the heart of the jungle.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 Best Time to Visit', vertQueuille),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Visit Tips'],
                      [
                        '🌅 Morning',
                        'Morning mist for a mystical atmosphere'
                      ],
                      ['🍂 Autumn', 'Forest with flamboyant colors'],
                      ['☀️ Summer', 'Intense green (jungle effect guaranteed)'],
                    ], vertQueuille),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Preview of the site', vertQueuille),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/4f26bf43d724d27dd2d2277f502c8505.jpg'),
                          _buildGalleryImage('assets/images/maxresdefault.jpg'),
                          _buildGalleryImage(
                              'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Practical Info', vertQueuille),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.visibility,
                              "Lookout accessible for free", vertQueuille),
                          _buildTechRow(Icons.place,
                              "Located in the village of Queuille", vertQueuille),
                          _buildTechRow(Icons.info_outline,
                              "Easy access (close to parking)", vertQueuille),
                          _buildTechRow(Icons.camera_alt,
                              "Iconic photo spot from the church square", vertQueuille),
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