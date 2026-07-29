import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDooPage extends StatefulWidget {
  const LacDooPage({super.key});

  @override
  State<LacDooPage> createState() => _LacDooPageState();
}

class _LacDooPageState extends State<LacDooPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Alpine Blue (Meltwater and mountain lakes)
    const Color bleuAlpin = Color(0xFF2874A6);

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
                'assets/imag/4.webp',
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
                      "Lake d'Ôo 💧",
                      style: GoogleFonts.cinzel(
                        color: bleuAlpin,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Occitania (Haute-Garonne, Pyrenees)", bleuAlpin),
                    _buildFactLine("Type", "Glacial origin lake and dam", bleuAlpin),
                    _buildFactLine("Looks like", "Braies Lake (Dolomites 🇮🇹)", bleuAlpin),

                    const SizedBox(height: 25),
                    Text(
                      "🏔️ A Pyrenean jewel enhanced by autumn",
                      style: GoogleFonts.montserrat(
                        color: bleuAlpin.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Famous for its dizzying 275-meter-high waterfall, Lake d'Ôo is a must-do hike in the Pyrenees. This exceptional site is particularly recommended in autumn: the surrounding forests dress up in magnificent warm colors, offering a striking and magical contrast with the deep blue of the water.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', bleuAlpin),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: bleuAlpin),
                        _buildTableRow(['🚗 By Car', 'Free parking at Granges d\'Astau (starting point)']),
                        _buildTableRow(['🥾 Hiking', 'Via the GR10 (about 1h to 1h30 of accessible ascent)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY (Before advice)
                    _buildSectionTitle('📸 Gallery', bleuAlpin),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/3.jpg'),
                          _buildGalleryImage('assets/imag/5.webp'),
                          _buildGalleryImage('assets/imag/2.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', bleuAlpin),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.park, "Autumn is magical: the tree colors are sublime", bleuAlpin),
                          _buildTechRow(Icons.hiking, "Hiking shoes recommended (rocky path)", bleuAlpin),
                          _buildTechRow(Icons.ac_unit, "Mountain weather: bring a warm garment", bleuAlpin),
                          _buildTechRow(Icons.not_interested, "Swimming prohibited (dam lake and very cold water)", bleuAlpin),
                          _buildTechRow(Icons.restaurant, "Mountain refuge by the lake for a well-deserved break", bleuAlpin),
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