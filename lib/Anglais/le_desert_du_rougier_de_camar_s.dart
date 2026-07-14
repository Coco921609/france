import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class RougierCamaresPage extends StatefulWidget {
  const RougierCamaresPage({super.key});

  @override
  State<RougierCamaresPage> createState() => _RougierCamaresPageState();
}

class _RougierCamaresPageState extends State<RougierCamaresPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Brick Red / Deep Ochre
    const Color rougeRougier = Color(0xFFB03A2E);

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
              'assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg',
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
                      'Rougier de Camarès 🤠',
                      style: GoogleFonts.cinzel(
                        color: rougeRougier,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGY & LOCATION
                    _buildTranslationLine(
                        "Aveyron", "A taste of the American Wild West", rougeRougier),

                    const SizedBox(height: 25),

                    Text(
                      "🇺🇸 The Aveyron Colorado",
                      style: GoogleFonts.montserrat(
                        color: rougeRougier.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "An unusual landscape of blood-red lands sculpted by erosion. This desert of 'ruffes' offers breathtaking panoramas reminiscent of the canyons of Arizona or Colorado.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 Best Time to Visit', rougeRougier),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Time', 'Visiting Tips'],
                      ['🌅 End of day', 'Low light enhances the red hues'],
                      [
                        '🍂 Autumn / Spring',
                        'Ideal temperatures for hiking'
                      ],
                      ['☀️ Summer', 'Warning: extreme ground heat'],
                    ], rougeRougier),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Photo Gallery', rougeRougier),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/dji_0699--_steloweb---copie_w2000.jpg'),
                          _buildGalleryImage(
                              'assets/images/rougier-960x640.jpg'),
                          _buildGalleryImage(
                              'assets/images/large_d-sert-du-rougier-de-camar-s.1619435_91a67ef00c.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Practical Info', rougeRougier),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined,
                              "Located near Camarès", rougeRougier),
                          _buildTechRow(Icons.directions_walk,
                              "Numerous hiking trails", rougeRougier),
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "Bring water and a hat", rougeRougier),
                          _buildTechRow(Icons.camera_alt,
                              "Unique landscape for photography", rougeRougier),
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

  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

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