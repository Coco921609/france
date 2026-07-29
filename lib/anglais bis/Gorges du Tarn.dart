import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuTarnPage extends StatefulWidget {
  const GorgesDuTarnPage({super.key});

  @override
  State<GorgesDuTarnPage> createState() => _GorgesDuTarnPageState();
}

class _GorgesDuTarnPageState extends State<GorgesDuTarnPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Ochre/River (Cliff limestone and whitewater)
    const Color ocreTarn = Color(0xFFD35400);

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
                'assets/imag/35.webp',
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
                      'Tarn Gorge 🛶',
                      style: GoogleFonts.cinzel(
                        color: ocreTarn,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Occitania (Lozère)", ocreTarn),
                    _buildFactLine("Type", "Canyon carved by the Tarn River", ocreTarn),
                    _buildFactLine("Looks like", "Grand Canyon (USA 🇺🇸)", ocreTarn),

                    const SizedBox(height: 25),
                    Text(
                      "🏔️ The majestic canyon between Causses and Cévennes",
                      style: GoogleFonts.montserrat(
                        color: ocreTarn.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Measuring 53 kilometers long, the Tarn Gorge offers a breathtaking natural spectacle. Between the towering limestone cliffs of Causse Méjean and Causse de Sauveterre, the Tarn River winds through a preserved valley, listed as a UNESCO World Heritage site. A unique place for lovers of adventure and grandiose landscapes.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', ocreTarn),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: ocreTarn),
                        _buildTableRow(['🚗 By Car', 'Scenic road along the Tarn (narrow in places)']),
                        _buildTableRow(['🛶 Canoe', 'Rental in La Malène or Les Vignes: highly recommended']),
                        _buildTableRow(['🥾 Hiking', 'Spectacular trails starting from troglodyte villages']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY (Before advice)
                    _buildSectionTitle('📸 Gallery', ocreTarn),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/36.jpg'),
                          _buildGalleryImage('assets/imag/37.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', ocreTarn),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.kayaking, "Canoe trip: reserve the entire day to enjoy the peace", ocreTarn),
                          _buildTechRow(Icons.castle, "Visit the listed heritage villages like Castelbouc or Sainte-Enimie", ocreTarn),
                          _buildTechRow(Icons.wb_sunny, "High heat: the rocks get extremely hot in summer, protect yourself", ocreTarn),
                          _buildTechRow(Icons.camera_alt, "The view from Point Sublime is a must-see at sunset", ocreTarn),
                          _buildTechRow(Icons.hiking, "Hiking: rockfall trails may be closed, check with the tourist office", ocreTarn),
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