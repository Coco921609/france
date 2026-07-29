import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeMaraisPoitevinPage extends StatefulWidget {
  const LeMaraisPoitevinPage({super.key});

  @override
  State<LeMaraisPoitevinPage> createState() => _LeMaraisPoitevinPageState();
}

class _LeMaraisPoitevinPageState extends State<LeMaraisPoitevinPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Marsh Green (The Green Venice)
    const Color vertMarais = Color(0xFF43A047);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. TOP IMAGE
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/imag/14.webp',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENT
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
                      'The Marais Poitevin 🛶',
                      style: GoogleFonts.cinzel(
                        color: vertMarais,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Nouvelle-Aquitaine / Pays de la Loire", vertMarais),
                    _buildFactLine("Nickname", "The Green Venice", vertMarais),
                    _buildFactLine("Looks like", "Giethoorn (Netherlands 🇳🇱) / Bayous (USA 🇺🇸)", vertMarais),

                    const SizedBox(height: 25),
                    Text(
                      "🌿 The silent aquatic labyrinth",
                      style: GoogleFonts.montserrat(
                        color: vertMarais.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Marais Poitevin is a timeless natural space, a true maze of green canals covered with duckweed. Nicknamed the Green Venice, it offers a peaceful and mysterious atmosphere, ideal for recharging in the shade of pollard ash trees and observing exceptional wildlife in absolute silence.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', vertMarais),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: vertMarais),
                        _buildTableRow(['🚗 By Car', 'Access via Coulon or Arçais (iconic villages)']),
                        _buildTableRow(['🛶 Boat', 'Rental with or without a boatman (the must-do activity)']),
                        _buildTableRow(['🚲 Bicycle', 'Over 800 km of flat, developed bike paths']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', vertMarais),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/11.jpg'),
                          _buildGalleryImage('assets/imag/11.webp'),
                          _buildGalleryImage('assets/imag/15.jpg'),
                          _buildGalleryImage('assets/imag/14.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', vertMarais),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.bug_report, "Mosquito repellent is essential in summer", vertMarais),
                          _buildTechRow(Icons.event_seat, "Book your boat in advance during high season", vertMarais),
                          _buildTechRow(Icons.local_fire_department, "Ask the boatman for the 'fire on the water' demonstration", vertMarais),
                          _buildTechRow(Icons.volume_off, "Preserve the silence of the canals to observe the wildlife", vertMarais),
                          _buildTechRow(Icons.sunny, "Bring a hat: the reflection on the water is strong", vertMarais),
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

  // --- HELPERS ---

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16))),
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

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
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