import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanqueDeSugitonPage extends StatefulWidget {
  const CalanqueDeSugitonPage({super.key});

  @override
  State<CalanqueDeSugitonPage> createState() => _CalanqueDeSugitonPageState();
}

class _CalanqueDeSugitonPageState extends State<CalanqueDeSugitonPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuMer = Color(0xFF2980B9);

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
                'assets/images/111.jpg',
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
                      'Sugiton Cove 🌊',
                      style: GoogleFonts.cinzel(
                        color: bleuMer,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Located in the south of France, between Marseille and Cassis, the Sugiton Cove is a gem of the Calanques massif. An effort is required to reach this heavenly place.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Recommended Seasons', bleuMer),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Tips'], isHeader: true, hColor: bleuMer),
                        _buildTableRow(['🌱 Spring', 'Ideal, mild temperatures and blooming nature.']),
                        _buildTableRow(['🍂 Autumn', 'Perfect, less crowded and bearable heat.']),
                        _buildTableRow(['☀️ Summer', 'To be avoided if possible (heat, dust, crowds).']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Recommended Times', bleuMer),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Moment', 'Tips'], isHeader: true, hColor: bleuMer),
                        _buildTableRow(['🌅 Early morning', 'Before 8am: essential for parking and tranquility.']),
                        _buildTableRow(['☀️ Midday', 'To be avoided: intense heat on the unshaded concrete path.']),
                        _buildTableRow(['🌇 Evening', 'Ideal for sunset, but be prepared for a hot walk back.']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Location Preview', bleuMer),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/999.jpg'),
                          _buildGalleryImage('assets/images/777.jpg'),
                          _buildGalleryImage('assets/images/6666.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PARCOURS ÉTAPE PAR ÉTAPE
                    _buildSectionTitle('🗺️ Trail from Luminy to Sugiton', bleuMer),
                    const SizedBox(height: 20),
                    _buildStep("Departure: Luminy architecture school."),
                    _buildStep("Path: Large gravel trail (blue markings)."),
                    _buildStep("Direction: Reach the Col de Sugiton."),
                    _buildStep("Bifurcation: Right, follow red dotted trail."),
                    _buildStep("Transition: Junction with concrete road."),
                    _buildStep("Viewpoint: Last concrete bend."),
                    _buildStep("Final descent: Natural trail (red dots)."),
                    _buildStep("Arrival: Sugiton coves."),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Essentials & Info', bleuMer),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.directions_walk, "Start: Luminy", bleuMer),
                          _buildTechRow(Icons.timer, "3.2km (55min out / 1h15 back)", bleuMer),
                          _buildTechRow(Icons.water_drop, "Drinking water fountain before the gate", bleuMer),
                          _buildTechRow(Icons.landscape, "Difficulty: Easy hike", bleuMer),
                          _buildTechRow(Icons.warning, "Steep descent and rocky terrain", bleuMer),
                          _buildTechRow(Icons.sunny, "Watch out for the steep climb back in the sun", bleuMer),
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

  // --- MÉTHODES HELPERS ---

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, color: const Color(0xFF2980B9), size: 20),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5))),
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

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
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