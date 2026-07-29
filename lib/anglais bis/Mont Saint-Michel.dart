import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontSaintMichelPage extends StatefulWidget {
  const MontSaintMichelPage({super.key});

  @override
  State<MontSaintMichelPage> createState() => _MontSaintMichelPageState();
}

class _MontSaintMichelPageState extends State<MontSaintMichelPage> {
  @override
  Widget build(BuildContext context) {
    const Color orSable = Color(0xFFD4AF37);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. TOP IMAGE (Integrated into the global scroll)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/29.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENT (Shifted slightly upward for the design)
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
                      'Mont Saint-Michel 🏰',
                      style: GoogleFonts.cinzel(
                        color: orSable,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Access", "Free and open 24/7", orSable),
                    _buildFactLine("Specialty", "Becomes an island during high tides", orSable),
                    _buildFactLine("Looks like", "St Michael's Mount (Cornwall 🇬🇧)", orSable),

                    const SizedBox(height: 25),
                    Text(
                      "🌊 The Wonder of the Western World",
                      style: GoogleFonts.montserrat(
                        color: orSable.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A true architectural wonder, Mont Saint-Michel is above all a village where access to the rock is completely free, day and night. Since it becomes an island again during high tides, approaching via the footbridge bridge allows you to admire the arrival at this masterpiece. A magical place to reach on foot, by bike, or thanks to the free shuttle \"Le Passeur\".",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASONS TABLE
                    _buildSectionTitle('📅 Best seasons', orSable),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Advice'], isHeader: true, hColor: orSable),
                        _buildTableRow(['🌱 Spring \n🍂 Autumn', 'RECOMMENDED: Pleasant weather, beautiful lighting, and ideal periods to observe the high tides.']),
                        _buildTableRow(['❄️ Winter', 'QUIET: Windy and cool, but offers a mystical atmosphere and almost empty streets.']),
                        _buildTableRow(['☀️ Summer', 'TO AVOID: Extremely high tourist crowds, narrow streets quickly become impassable.']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // HOURS TABLE
                    _buildSectionTitle('⏰ Recommended hours', orSable),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Advice'], isHeader: true, hColor: orSable),
                        _buildTableRow(['✨ Morning (early)', 'RECOMMENDED: Ideal for walking the ramparts in complete serenity before the crowds arrive.']),
                        _buildTableRow(['🌙 Night', 'MAGICAL: Free access to the rock 24/7. The illuminated Mount offers an unforgettable sight.']),
                        _buildTableRow(['☀️ 11 AM - 4 PM', 'TO AVOID: Daily peak attendance. Better use this time to visit the Abbey (paid).']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Location overview', orSable),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/25.jpg'),
                          _buildGalleryImage('assets/image/26.webp'),
                          _buildGalleryImage('assets/image/27.jpg'),
                          _buildGalleryImage('assets/image/30.jpg'),
                          _buildGalleryImage('assets/image/31.webp'),
                          _buildGalleryImage('assets/image/32.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Essentials & Info', orSable),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Located in Normandy", orSable),
                          _buildTechRow(Icons.directions_bus, "Free \"Le Passeur\" shuttle from the parking lots", orSable),
                          _buildTechRow(Icons.account_balance, "Access to the village is free. Only the Abbey requires a paid ticket.", orSable),
                          _buildTechRow(Icons.waves, "Warning: check the tide schedules before any walk in the bay", orSable),
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