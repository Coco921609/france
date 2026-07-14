import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class LacOrceyrettePage extends StatefulWidget {
  const LacOrceyrettePage({super.key});

  @override
  State<LacOrceyrettePage> createState() => _LacOrceyrettePageState();
}

class _LacOrceyrettePageState extends State<LacOrceyrettePage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color orangeAutomne = Color(0xFFE2725B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. FIXED BACKGROUND IMAGE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/lac_or10.jpg',
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
                        'Orceyrette Lake 🇨🇦',
                        style: GoogleFonts.cinzel(
                          color: orangeAutomne,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇨🇦 A taste of Canada in the Hautes-Alpes",
                      style: GoogleFonts.montserrat(
                        color: orangeAutomne.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "Located in the Hautes-Alpes, Lake Orceyrette is simply magnificent in autumn. The trees are dressed in flamboyant orange colors that reflect with purity in the crystalline water. At sunset, the light sets the distant snowy mountains ablaze, offering a spectacle worthy of the greatest Canadian parks.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // PERIODS TABLE
                    _buildSectionTitle('📅 Visit Calendar', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Status', 'Seasons & Atmosphere'],
                            orangeAutomne,
                            isHeader: true),
                        _buildTableRow([
                          '✅ Top',
                          'Autumn (Magical tree colors)'
                        ], orangeAutomne),
                        _buildTableRow([
                          '🌤️ Summer',
                          'Perfect for freshness and pure water'
                        ], orangeAutomne),
                        _buildTableRow([
                          '❄️ Rare',
                          'Winter (Frozen lake, far north atmosphere)'
                        ], orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // SCHEDULE TABLE
                    _buildSectionTitle('⏰ Recommended Times', orangeAutomne),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Moment', 'Advice'], orangeAutomne,
                            isHeader: true),
                        _buildTableRow(
                            ['✨ Morning', 'Mirror water for perfect reflections'],
                            orangeAutomne),
                        _buildTableRow(
                            ['☀️ Noon', 'Zenithal light on the larch trees'],
                            orangeAutomne),
                        _buildTableRow(
                            ['🌅 Evening', 'Sunset on the mountain peaks'],
                            orangeAutomne),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Preview of the Place', orangeAutomne),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/img_8810.jpg'),
                          _buildGalleryImage('assets/images/lac_or10.jpg'),
                          _buildGalleryImage(
                              'assets/images/DES_0502-1-1920x1080.jpg'),
                          _buildGalleryImage(
                              'assets/images/lac-de-lorceyrette-5-scaled.jpg'),
                          _buildGalleryImage(
                              'assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Essentials & Info', orangeAutomne),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny_outlined,
                              "Visit at sunset for the best colors", orangeAutomne),
                          _buildTechRow(Icons.directions_car,
                              "Directly accessible by car", orangeAutomne),
                          _buildTechRow(Icons.terrain,
                              "Hiking possible for the more motivated", orangeAutomne),
                          _buildTechRow(Icons.camera_alt_outlined,
                              "Perfect water mirror for photography", orangeAutomne),
                          _buildTechRow(Icons.ac_unit,
                              "Road closed after the first heavy snowfalls", orangeAutomne),
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

  // --- STYLE METHODS ---

  // ignore: unused_element
  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

  TableRow _buildTableRow(List<String> cells, Color color,
      {bool isHeader = false}) {
    final style = GoogleFonts.montserrat(
      color: isHeader ? color : Colors.white70,
      fontSize: 12,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    );
    return TableRow(
      children: cells.map((cell) {
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Text(cell,
                style: style, textAlign: TextAlign.left, softWrap: true),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title,
      style: GoogleFonts.cinzel(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
              child: Text(label,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}