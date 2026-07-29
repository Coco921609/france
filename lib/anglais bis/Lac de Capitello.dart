import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDeCapitelloPage extends StatefulWidget {
  const LacDeCapitelloPage({super.key});

  @override
  State<LacDeCapitelloPage> createState() => _LacDeCapitelloPageState();
}

class _LacDeCapitelloPageState extends State<LacDeCapitelloPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Deep Blue (Glacial waters and Corsican granite)
    const Color bleuCapitello = Color(0xFF1B4F72);

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
                'assets/imag/9.jpg',
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
                      'Lake Capitello ⛰️',
                      style: GoogleFonts.cinzel(
                        color: bleuCapitello,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Corsica (Restonica Valley)", bleuCapitello),
                    _buildFactLine("Type", "Glacial origin lake (1930m altitude)", bleuCapitello),
                    _buildFactLine("Looks like", "Sorapis Lake (Dolomites 🇮🇹)", bleuCapitello),

                    const SizedBox(height: 25),
                    Text(
                      "❄️ The frozen showcase of Corsican mountains",
                      style: GoogleFonts.montserrat(
                        color: bleuCapitello.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Perched at an altitude of over 1900 meters, Lake Capitello is the deepest lake in Corsica. Surrounded by dizzying granite cliffs that plunge straight down into its ink-blue waters, this glacial lake often remains frozen until the beginning of summer. A spectacular reward for seasoned hikers.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', bleuCapitello),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: bleuCapitello),
                        _buildTableRow(['🚗 By Car', 'Up to the Grotelle Sheepfolds (Paid parking, narrow road)']),
                        _buildTableRow(['🥾 Hiking', 'From Lake Melo: steep climb (about 45 minutes additional)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY (Before advice)
                    _buildSectionTitle('📸 Gallery', bleuCapitello),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/7.jpg'),
                          _buildGalleryImage('assets/imag/8.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', bleuCapitello),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking, "Difficult level: sections equipped with chains and ladders", bleuCapitello),
                          _buildTechRow(Icons.snowing, "Snow patches possible until July, be careful", bleuCapitello),
                          _buildTechRow(Icons.not_interested, "Swimming strictly discouraged (freezing water)", bleuCapitello),
                          _buildTechRow(Icons.water_drop, "Bring plenty of water, no water source after Melo", bleuCapitello),
                          _buildTechRow(Icons.wb_cloudy, "Leave early in the morning: thunderstorms are frequent in the afternoon", bleuCapitello),
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