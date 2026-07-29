import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PuyDeDomePage extends StatefulWidget {
  const PuyDeDomePage({super.key});

  @override
  State<PuyDeDomePage> createState() => _PuyDeDomePageState();
}

class _PuyDeDomePageState extends State<PuyDeDomePage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Vert Volcan / Auvergne
    const Color vertVolcan = Color(0xFF277A4E);

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
                'assets/images/8.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[900]),
              ),
            ),

            // 2. CONTENU (Remonté pour le design)
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
                      'Puy de Dôme 🌋',
                      style: GoogleFonts.cinzel(
                        color: vertVolcan,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine(
                        "Auvergne", "A taste of Mount Fuji (Japan)", vertVolcan),

                    const SizedBox(height: 25),

                    Text(
                      "🇯🇵 The emblem of the Auvergne volcanoes",
                      style: GoogleFonts.montserrat(
                        color: vertVolcan.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Yes, France actually has volcanoes! This emblematic site of the Chaîne des Puys, a UNESCO World Heritage site, offers a grandiose 360-degree panorama.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SAISONS
                    _buildSectionTitle('Best seasons', vertVolcan),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Atmosphere & Advice'],
                      ['🍂 Autumn', 'Flamboyant colors and sea of clouds'],
                      ['☀️ Summer', 'Pleasant climate for hiking'],
                      ['🌱 Spring', 'Lush vegetation and nature\'s awakening'],
                      ['❄️ Winter', 'To be avoided (strong wind and heavy snow)'],
                    ], vertVolcan),

                    const SizedBox(height: 35),

                    // HORAIRES & LUMIÈRE
                    _buildSectionTitle('Photography & schedule', vertVolcan),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Recommendation'],
                      ['🌅 Sunrise', 'Exceptional golden light over the volcanoes'],
                      ['🌇 Sunset', 'Unique colors and clear view'],
                      ['📸 Camera', 'Tripod recommended for long exposures'],
                    ], vertVolcan),

                    const SizedBox(height: 35),

                    // SECRETS & ANECDOTES
                    _buildSectionTitle('💡 Anecdotes & facts', vertVolcan),
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
                            Icons.landscape_outlined,
                            "Highest point of the Chaîne des Puys at 1,465 meters above sea level.",
                            vertVolcan,
                          ),
                          _buildTechRow(
                            Icons.bolt,
                            "Former site of the Temple of Mercury built in the 2nd century.",
                            vertVolcan,
                          ),
                          _buildTechRow(
                            Icons.directions_walk,
                            "Free access on foot via the Sentier des Muletiers trail.",
                            vertVolcan,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // GALERIE
                    _buildSectionTitle('Overview of the location', vertVolcan),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/9.jpg'),
                          _buildGalleryImage('assets/images/10.jpg'),
                          _buildGalleryImage('assets/images/train.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('Essentials & info', vertVolcan),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(
                              Icons.camera_enhance_outlined,
                              "Camera is a must-have", vertVolcan),
                          _buildTechRow(
                              Icons.map_outlined,
                              "Located near Clermont-Ferrand", vertVolcan),
                          _buildTechRow(
                              Icons.train_outlined,
                              "Accessible via the rack railway (Paid)", vertVolcan),
                          _buildTechRow(
                              Icons.euro_symbol,
                              "Prices: Hiking (Free) / Train (~15€, to be checked)", vertVolcan),
                          _buildTechRow(
                              Icons.auto_awesome,
                              "Grand Site de France", vertVolcan),
                          _buildTechRow(
                              Icons.park,
                              "Volcans d'Auvergne Regional Natural Park", vertVolcan),
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