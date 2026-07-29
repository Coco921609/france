import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PalaisIdealPage extends StatefulWidget {
  const PalaisIdealPage({super.key});

  @override
  State<PalaisIdealPage> createState() => _PalaisIdealPageState();
}

class _PalaisIdealPageState extends State<PalaisIdealPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Warm Stone / Drôme Sand
    const Color pierreChaude = Color(0xFFC2A383);

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
                'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
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
                      'Ideal Palace 🏯',
                      style: GoogleFonts.cinzel(
                        color: pierreChaude,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Hauterives", "Angkor Wat Temples (Cambodia)", pierreChaude),

                    const SizedBox(height: 25),

                    Text(
                      "🇰🇭 A taste of Cambodia in the heart of Drôme",
                      style: GoogleFonts.montserrat(
                        color: pierreChaude.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Built by a single man, postman Ferdinand Cheval, this palace is a monument unique in the world. Its sculpted facades are reminiscent of Hindu temples and the organic architecture of Southeast Asia.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASONS
                    _buildSectionTitle('📅 Best Seasons', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Advice'],
                      ['🌸 Spring', 'Ideal: Mild temperatures'],
                      ['🍂 Autumn', 'Stunning with amber foliage'],
                      ['☀️ Summer', 'Crowded; early morning is best'],
                      ['❄️ Hiver', 'Quiet but very cold (Drôme region)'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // TIMINGS
                    _buildSectionTitle('⏰ Visiting Hours', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Time of Day', 'Status'],
                      ['✨ Morning', 'Recommended: Soft lighting'],
                      ['🕛 12 PM - 2 PM', 'Fewer crowds'],
                      ['🕓 Afternoon', 'Avoid: Peak attendance'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // --- RATES SECTION ---
                    _buildSectionTitle('🎟️ General Admission', pierreChaude),
                    const SizedBox(height: 10),
                    Text(
                      "⚠️ Note: Prices are subject to change based on the season.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white54, fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Category', 'Rate'],
                      ['Adult', '€9'],
                      ['Reduced*', '€7'],
                      ['Children (3-16 years)', '€5'],
                      ['Under 3 years', 'Free'],
                      ['Audioguide', '+ €2'],
                    ], pierreChaude),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "*Reduced: Students, job seekers, people with disabilities.",
                        style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11),
                      ),
                    ),

                    const SizedBox(height: 25),

                    _buildSectionTitle('👥 Group Rates', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Group Type', 'Rate'],
                      ['Children (15+ pers.)', '€4 / child'],
                      ['Bus Drivers', 'Free'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // GALLERY
                    _buildSectionTitle('📸 Preview of the site', pierreChaude),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg'),
                          _buildGalleryImage('assets/images/Palais-ideal-une.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-1.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-2.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-11.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Essentials', pierreChaude),
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
                              "Camera is a must-have", pierreChaude),
                          _buildTechRow(Icons.map_outlined,
                              "Located in Hauterives (Drôme)", pierreChaude),
                          _buildTechRow(Icons.language,
                              "Online booking recommended", pierreChaude),
                          _buildTechRow(Icons.auto_awesome,
                              "Classified as a Historic Monument", pierreChaude),
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