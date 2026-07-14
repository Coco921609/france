import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class PontDuGardPage extends StatefulWidget {
  const PontDuGardPage({super.key});

  @override
  State<PontDuGardPage> createState() => _PontDuGardPageState();
}

class _PontDuGardPageState extends State<PontDuGardPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Ocre / Pierre Romaine
    const Color pierreRomaine = Color(0xFFD4A373);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND (HAUT)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/6.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.grey[900]),
            ),
          ),

          // 2. CONTENU DÉFILABLE
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
                      'Pont du Gard 🏛️️',
                      style: GoogleFonts.cinzel(
                        color: pierreRomaine,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine(
                        "Occitanie", "A taste of the Colosseum (Italy)", pierreRomaine),

                    const SizedBox(height: 25),

                    Text(
                      "🇮🇹 The masterpiece of the Roman era",
                      style: GoogleFonts.montserrat(
                        color: pierreRomaine.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Exceptional three-level Roman aqueduct crossing the Gardon River. A grandiose testament to ancient architectural genius.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SAISONS
                    _buildSectionTitle('Best seasons', pierreRomaine),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Atmosphere & Advice'],
                      ['🍂 Autumn', 'Warm colors and low grazing light'],
                      ['☀️ Summer', 'Swimming and walks by the water'],
                      ['🌱 Spring', 'Ideal for quietness and nature'],
                      ['❄️ Winter', 'To be avoided (wind and cold)'],
                    ], pierreRomaine),

                    const SizedBox(height: 35),

                    // HORAIRES & LUMIÈRE
                    _buildSectionTitle('Photography & schedule', pierreRomaine),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Recommendation'],
                      ['🌅 Sunrise', 'Exceptional golden light'],
                      ['🌇 Sunset', 'Magnificent reflections on the Gardon'],
                      ['📸 Camera', 'Tripod recommended for long exposures'],
                    ], pierreRomaine),

                    const SizedBox(height: 35),

                    // NOUVELLE SECTION : SECRETS & ANECDOTES
                    _buildSectionTitle('💡 Anecdotes & facts', pierreRomaine),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(
                            Icons.architecture,
                            "Built in the 1st century AD to supply Nîmes with water.",
                            pierreRomaine,
                          ),
                          _buildTechRow(
                            Icons.straighten,
                            "It stands 48 meters high, making it the highest Roman aqueduct bridge in the world.",
                            pierreRomaine,
                          ),
                          _buildTechRow(
                            Icons.nature_people,
                            "Surrounded by protected natural areas ideal for relaxing.",
                            pierreRomaine,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // GALERIE
                    _buildSectionTitle('Overview of the location', pierreRomaine),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/4.jpg'),
                          _buildGalleryImage('assets/images/30.jpg'),
                          _buildGalleryImage('assets/images/35.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('Essentials & info', pierreRomaine),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_enhance_outlined,
                              "Camera is a must-have", pierreRomaine),
                          _buildTechRow(Icons.map_outlined,
                              "Located near Vers-Pont-du-Gard", pierreRomaine),
                          _buildTechRow(Icons.directions_car,
                              "Parking fee per vehicle (check on-site)", pierreRomaine),
                          _buildTechRow(Icons.euro_symbol,
                              "Site entry fee: varies by season", pierreRomaine),
                          _buildTechRow(Icons.auto_awesome,
                              "UNESCO World Heritage site", pierreRomaine),
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

  // --- HELPERS DESIGN ---

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie,
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