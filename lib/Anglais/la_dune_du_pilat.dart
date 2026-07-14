import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class DuneDuPilatPage extends StatefulWidget {
  const DuneDuPilatPage({super.key});

  @override
  State<DuneDuPilatPage> createState() => _DuneDuPilatPageState();
}

class _DuneDuPilatPageState extends State<DuneDuPilatPage> {
  @override
  Widget build(BuildContext context) {
    // Color Theme: Golden Sand / Gold
    const Color goudDune = Color(0xFFD4AC0D);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. BACKGROUND IMAGE (TOP)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/sudouest-photo-1-32378160-1600.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. SCROLLABLE CONTENT
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dune of Pilat 🐪',
                      style: GoogleFonts.cinzel(
                        color: goudDune,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Arcachon Bay", "A taste of the Sahara (Africa)", goudDune),

                    const SizedBox(height: 25),

                    Text(
                      "🏜️ The highest dune in Europe",
                      style: GoogleFonts.montserrat(
                        color: goudDune.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A monumental natural phenomenon wedged between the Atlantic Ocean and the Landes forest. Standing over 100 meters high, it offers a striking desert spectacle and a unique view of the Banc d'Arguin.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASONS TABLE
                    _buildSectionTitle('📅 Best Seasons', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Atmosphere', 'Advice'],
                      ['🌸 Spring', 'Mildness', 'Perfect for avoiding crowds'],
                      [
                        '☀️ Summer',
                        'Heat',
                        'Opt for sunrise or sunset visits'
                      ],
                      [
                        '🍂 Autumn',
                        'Golden Light',
                        'The most photogenic period'
                      ],
                      ['❄️ Winter', 'Wild', 'Ideal for total solitude'],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // VISIT TIPS
                    _buildSectionTitle('💡 Visit Tips', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Recommendation'],
                      [
                        '🌅 Sunset',
                        'The most magical moment of the day'
                      ],
                      [
                        '🏃 Ascent',
                        'Stairs available from April to October'
                      ],
                      [
                        '🌬️ Wind',
                        'Sand can be irritating on high-wind days'
                      ],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // GALLERY
                    _buildSectionTitle('📸 Place Preview', goudDune),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/photo-aerienne-dune-du-pilat-277.jpg'),
                          _buildGalleryImage(
                              'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/sudouest-photo-1-32378160-1600.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Practical Info', goudDune),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking,
                              "Free and open access to the dune", goudDune),
                          _buildTechRow(Icons.wb_sunny,
                              "No-shade zone: bring plenty of water", goudDune),
                          _buildTechRow(Icons.camera_alt,
                              "360° Panorama: Forest & Ocean", goudDune),
                          _buildTechRow(Icons.pets,
                              "Dogs allowed if kept on a leash", goudDune),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- DESIGN HELPERS ---

  // ignore: unused_element
  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

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