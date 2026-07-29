import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrguesIlleSurTetPage extends StatefulWidget {
  const OrguesIlleSurTetPage({super.key});

  @override
  State<OrguesIlleSurTetPage> createState() => _OrguesIlleSurTetPageState();
}

class _OrguesIlleSurTetPageState extends State<OrguesIlleSurTetPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Ochre / Terracotta
    const Color ocreDesert = Color(0xFFD35400);

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
                'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[900]),
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
                      "Ille-sur-Têt Organs ⛰️",
                      style: GoogleFonts.cinzel(
                        color: ocreDesert,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTranslationLine(
                        "Ille-sur-Têt", "A taste of Cappadocia (Turkey)", ocreDesert),

                    const SizedBox(height: 25),

                    Text(
                      "🇹🇷 The Wild West of the Pyrénées-Orientales",
                      style: GoogleFonts.montserrat(
                        color: ocreDesert.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A mineral landscape unique in France. These 'fairy chimneys' sculpted by erosion offer a lunar setting reminiscent of American canyons or Cappadocia.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 Seasons & Timing', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Recommendation'],
                      ['🌸 Spring', 'Ideal (mild climate and beautiful light)'],
                      ['🍂 Autumn', 'Recommended (vibrant ochre colors)'],
                      ['☀️ Summer', 'Avoid the afternoon (extreme heat)'],
                      ['❄️ Hiver', 'Possible (clear views of Mount Canigou)'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    _buildSectionTitle('🕓 Hours & Duration', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Information'],
                      ['Self-guided tour', 'Approximately 45 minutes to 1.5 hours'],
                      ['Last entry', '1 hour before site closure'],
                      ['Advice', 'Visit in the morning to avoid wait times'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    // --- RATES SECTION ---
                    _buildSectionTitle('🎟️ Admission Rates', ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "⚠️ Note: Rates are indicative and may vary by season or year.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white54,
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Category', 'Price'],
                      ['Adult (Full price)', '€5.00'],
                      ['Reduced rate*', '€4.00'],
                      ['Child (10-13 years)', '€3.50'],
                      ['Under 10 years', 'Free'],
                    ], ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "*Reduced rate: proof required (teens, students, job seekers).",
                      style: GoogleFonts.montserrat(
                          color: Colors.white70, fontSize: 12),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Photo Gallery', ocreDesert),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'),
                          _buildGalleryImage(
                              'assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif'),
                          _buildGalleryImage('assets/images/orgues-ille-sur-tet-55.jpg'),
                          _buildGalleryImage(
                              'assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Practical Info', ocreDesert),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.confirmation_number_outlined,
                              "Online booking recommended", ocreDesert),
                          _buildTechRow(Icons.timer_outlined,
                              "Allow about 1 hour of walking", ocreDesert),
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "Little shade; bring plenty of water", ocreDesert),
                          _buildTechRow(Icons.camera_enhance_outlined,
                              "Ideal lighting in the late afternoon", ocreDesert),
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

  Widget _buildTranslationLine(String city, String analogy, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(city,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.white10,
            child: const Icon(Icons.broken_image, color: Colors.white24),
          ),
        ),
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