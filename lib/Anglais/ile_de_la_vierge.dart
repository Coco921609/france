import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class IleDeLaViergePage extends StatefulWidget {
  const IleDeLaViergePage({super.key});

  @override
  State<IleDeLaViergePage> createState() => _IleDeLaViergePageState();
}

class _IleDeLaViergePageState extends State<IleDeLaViergePage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
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
              'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
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
                        'Virgin Island 🌊',
                        style: GoogleFonts.cinzel(
                          color: const Color(0xFF40E0D0),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🏝️ A Caribbean vibe in Brittany",
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF40E0D0).withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "Located in Crozon, Brittany, Virgin Island (Île Vierge) is famous for its paradisiacal beach with crystalline waters and white sand. "
                          "This spot, which resembles the Caribbean, is often cited among the most beautiful beaches in Europe and offers a natural spectacle of almost ethereal beauty.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // PERIODS TABLE
                    _buildSectionTitle('📅 Best times to visit'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Status', 'Weather & Colors'],
                            isHeader: true),
                        _buildTableRow(
                            ['✅ Best', 'May to September (Turquoise water)']),
                        _buildTableRow(
                            ['🌤️ Good', 'April & October (Beautiful light)']),
                        _buildTableRow(
                            ['🌧️ Warning', 'Winter (Strong winds & rain)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // SCHEDULE TABLE
                    _buildSectionTitle('⏰ Recommended hours'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2)
                      },
                      children: [
                        _buildTableRow(['Time', 'Advice'], isHeader: true),
                        _buildTableRow(['✨ Morning', 'Ideal for peace (8am-10am)']),
                        _buildTableRow(
                            ['☀️ Noon', 'Max light on turquoise water']),
                        _buildTableRow(
                            ['🌅 Evening', 'Sunset over the cliffs']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Preview of the location'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/crique-ile-vierge-crozon.jpg'),
                          _buildGalleryImage(
                              'assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg'),
                          _buildGalleryImage(
                              'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Essentials & Info'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.cloudy_snowing,
                              "In Brittany, it rains a lot! Check the weather and temperatures before you go."),
                          _buildTechRow(Icons.block,
                              "Beach access forbidden (Ecosystem protection)"),
                          _buildTechRow(Icons.waves,
                              "Do not swim (Unstable cliffs)"),
                          _buildTechRow(Icons.directions_walk,
                              "Walking shoes recommended"),
                          _buildTechRow(Icons.camera_alt_outlined,
                              "Don't forget your camera!"),
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
  Widget _buildCircleBtn(IconData icon, VoidCallback tap,
      {Color color = Colors.white}) =>
      CircleAvatar(
        backgroundColor: Colors.black45,
        child:
        IconButton(icon: Icon(icon, color: color, size: 18), onPressed: tap),
      );

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    final style = GoogleFonts.montserrat(
      color: isHeader ? const Color(0xFF40E0D0) : Colors.white70,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.cinzel(
          color: const Color(0xFF40E0D0),
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

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF40E0D0).withOpacity(0.5), size: 20),
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