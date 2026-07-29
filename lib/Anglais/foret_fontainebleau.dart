import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetFontainebleauPage extends StatefulWidget {
  const ForetFontainebleauPage({super.key});

  @override
  State<ForetFontainebleauPage> createState() => _ForetFontainebleauPageState();
}

class _ForetFontainebleauPageState extends State<ForetFontainebleauPage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color vertForet = Color(0xFF27AE60);

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
                'assets/images/1136015-les-25-bosses-photos-image00079.jpg',
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
                      'Fontainebleau Forest 🌲',
                      style: GoogleFonts.cinzel(
                        color: vertForet,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTranslationLine("Paris", "Scandinavian Forests / Sweden", vertForet),

                    const SizedBox(height: 25),

                    Text(
                      "🇫🇷 The legendary '25 Bosses' circuit",
                      style: GoogleFonts.montserrat(
                        color: vertForet.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "This is one of the most legendary hikes in the Île-de-France region! Free, demanding, and spectacular. Created in the 70s by Parisian mountaineers to train for expeditions, it is a true natural playground.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TRACKING TIME TABLE
                    _buildSectionTitle('🏃 Pace & Duration (17 km)'),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Level', 'Estimated Time'],
                      ['🏃 Fast', '4 – 5h'],
                      ['🚶 Moderate', '5 – 6h'],
                      ['🧘 Relaxed', '6 – 7h'],
                      ['📸 Photo/Picnic', '7 – 10h'],
                    ], vertForet),

                    const SizedBox(height: 35),

                    // SEASONS & TIMES
                    _buildSectionTitle('📅 When to go?'),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Advice'],
                      ['🍂 Autumn', 'Ideal (Flamboyant foliage)'],
                      ['🌸 Spring', 'Ideal (Blooming)'],
                      ['🚫 Summer/Winter', 'Avoid (Too hot or slippery)'],
                      ['⏰ Weekend', 'Leave early to avoid the crowds'],
                    ], vertForet),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Preview of the site'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/1136007-les-25-bosses-photos-image00086.jpg'),
                          _buildGalleryImage('assets/images/1136009-les-25-bosses-photos-image00081.jpg'),
                          _buildGalleryImage('assets/images/1136011-les-25-bosses-photos-image00082.jpg'),
                          _buildGalleryImage('assets/images/1136015-les-25-bosses-photos-image00079.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFOS
                    _buildSectionTitle('🎒 Survival Tips'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.directions_run, "Get ready: it's steep and slippery!", vertForet),
                          _buildTechRow(Icons.water_drop, "Minimum 1.5L water + snacks", vertForet),
                          _buildTechRow(Icons.map, "GPS or map is essential", vertForet),
                          _buildTechRow(Icons.sync, "Advised direction: reverse (anti-crowd)", vertForet),
                          _buildTechRow(Icons.delete_outline, "Zero waste: respect the forest 🙏", vertForet),
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

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell, style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: GoogleFonts.cinzel(color: const Color(0xFF27AE60), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 180,
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
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}