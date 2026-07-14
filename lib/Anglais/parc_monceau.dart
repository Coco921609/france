import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class ParcMonceauPage extends StatefulWidget {
  const ParcMonceauPage({super.key});

  @override
  State<ParcMonceauPage> createState() => _ParcMonceauPageState();
}

class _ParcMonceauPageState extends State<ParcMonceauPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Royal Gold / Monceau
    const Color orMonceau = Color(0xFFD4AF37);

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
              'assets/images/748523-visuel-paris-parc-monceau.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.grey[900]),
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
                      'Monceau Park ⛲',
                      style: GoogleFonts.cinzel(
                        color: orMonceau,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Paris", "Roman Ruins & Tuscany", orMonceau),

                    const SizedBox(height: 25),

                    Text(
                      "🇮🇹 Italian elegance in the heart of Paris",
                      style: GoogleFonts.montserrat(
                        color: orMonceau.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Located just steps away from the Arc de Triomphe, this park is famous for its Naumachia (colonnade), its pyramid, and its statues. It captures the refined, antique atmosphere of 19th-century Italian gardens.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASONS
                    _buildSectionTitle('📅 Best Seasons', orMonceau),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Season', 'Advice'],
                      ['🍂 Autumn', 'Magnificent tree colors'],
                      ['☀️ Summer', 'Perfect for staying cool'],
                      ['🌱 Spring', 'Splendid blooms'],
                      ['❄️ Winter', 'Avoid (too gray and cold)'],
                    ], orMonceau),

                    const SizedBox(height: 35),

                    // TIMINGS
                    _buildSectionTitle('⏰ Recommended Times', orMonceau),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Status'],
                      ['✨ Early Morning', 'Recommended: Quiet and soft light'],
                      ['🕛 12 PM - 2 PM', 'Avoid: Peak crowds'],
                      ['🌅 Evening', 'Ideal for a chic stroll'],
                    ], orMonceau),

                    const SizedBox(height: 35),

                    // GALLERY
                    _buildSectionTitle('📸 Preview of the site', orMonceau),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/748523-visuel-paris-parc-monceau.jpg'),
                          _buildGalleryImage('assets/images/a8510b36f4672d921734299f69550e4b.jpg'),
                          _buildGalleryImage('assets/images/monceau-parc-paris.jpg'),
                          _buildGalleryImage('assets/images/597232-visuel-paris-parc-monceau.jpg'),
                          _buildGalleryImage('assets/images/597244-visuel-paris-parc-monceau.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Essentials & Info', orMonceau),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.location_on_outlined,
                              "Near the Arc de Triomphe", orMonceau),
                          _buildTechRow(Icons.photo_camera,
                              "Camera: Ideal for portraits", orMonceau),
                          _buildTechRow(Icons.directions_run,
                              "Very popular running route", orMonceau),
                          _buildTechRow(Icons.pets,
                              "Dogs on a leash allowed", orMonceau),
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

  Widget _buildTranslationLine(String city, String analogy, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(city,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
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
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
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