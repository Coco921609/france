import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentierDesOcresPage extends StatefulWidget {
  const SentierDesOcresPage({super.key});

  @override
  State<SentierDesOcresPage> createState() => _SentierDesOcresPageState();
}

class _SentierDesOcresPageState extends State<SentierDesOcresPage> {
  @override
  Widget build(BuildContext context) {
    // Theme Color: Burnt Ochre / Arizona Sand
    const Color ocreArizona = Color(0xFFC5A059);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. FIXED BACKGROUND IMAGE (TOP)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/des-ocres-des-couleurs.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. SCROLLABLE CONTENT PANEL
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
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Ochre Trail 🏜️',
                        style: GoogleFonts.cinzel(
                          color: ocreArizona,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇺🇸 A taste of Arizona in the USA",
                      style: GoogleFonts.montserrat(
                        color: ocreArizona.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "Imagine yourself transported to the heart of the Wild West without even leaving France. "
                          "In Roussillon, the earth ignites to reveal sculpted cliffs in shades of fire. 🎨",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // VISIT CALENDAR SECTION
                    _buildSectionTitle('📅 Visit Calendar', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Status', 'Seasons & Atmosphere'],
                      ['✅ Top', 'Autumn (Golden trees) & Spring'],
                      ['☀️ Ok', 'Summer (Stunning but very hot)'],
                      ['❌ Avoid', 'Winter (Gray and cold)'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // TIMING SECTION
                    _buildSectionTitle('⏰ Visiting Hours', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Advice by season'],
                      ['✨ Ideal', 'Early morning or after 5 PM (Summer/Sp)'],
                      ['🌅 Top', '11 AM - 3 PM (Autumn/Winter)'],
                      ['🚫 Avoid', '12 PM - 4 PM in mid-summer'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // GALLERY SECTION
                    _buildSectionTitle('📸 Preview of the site', ocreArizona),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/des-ocres-des-couleurs (1).jpg'),
                          _buildGalleryImage('assets/images/photo0jpg.jpg'),
                          _buildGalleryImage('assets/images/de-belles-couleurs.jpg'),
                          _buildGalleryImage('assets/images/photo4jpg.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO SECTION
                    _buildSectionTitle('📋 Essentials & Info', ocreArizona),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "🧭 2 routes (30 or 60 min)"),
                          _buildTechRow(Icons.directions_run, "👟 Say goodbye to white sneakers!"),
                          _buildTechRow(Icons.water_drop_outlined, "Water bottle is a must-have"),
                          _buildTechRow(Icons.euro_symbol, "🎟️ Price: ~€3.50 (subject to change)"),
                          _buildTechRow(Icons.cleaning_services_rounded, "Dark shoes (ochre stains)"),
                          _buildTechRow(Icons.no_food_outlined, "Picnics forbidden on site"),
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

  // --- HELPER METHODS ---

  // ignore: unused_element
  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              cell,
              style: GoogleFonts.montserrat(
                color: idx == 0 ? hColor : Colors.white70,
                fontSize: 12,
                fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.cinzel(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
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

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}