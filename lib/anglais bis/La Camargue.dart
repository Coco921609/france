import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaCamarguePage extends StatefulWidget {
  const LaCamarguePage({super.key});

  @override
  State<LaCamarguePage> createState() => _LaCamarguePageState();
}

class _LaCamarguePageState extends State<LaCamarguePage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Flamingo Pink (The visual identity of the Camargue)
    const Color roseCamargue = Color(0xFFEC407A);

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
                'assets/ima/9.webp',
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
                      'The Camargue 🦩',
                      style: GoogleFonts.cinzel(
                        color: roseCamargue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Bouches-du-Rhône / Gard (Camargue)", roseCamargue),
                    _buildFactLine("Type", "Regional nature park / Wetland", roseCamargue),
                    _buildFactLine("Looks like", "Doñana National Park (Spain 🇪🇸)", roseCamargue),

                    const SizedBox(height: 25),
                    Text(
                      "🌾 Wild land between sky and salt",
                      style: GoogleFonts.montserrat(
                        color: roseCamargue.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Camargue is a unique delta, shaped by the waters of the Rhône and the spray of the Mediterranean. Between its lagoons, herds of bulls, white horses, and colonies of flamingos, it is a sanctuary of biodiversity. The spectacle of light reflecting on its immense ponds, particularly at sunrise and sunset, is unforgettable.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', roseCamargue),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: roseCamargue),
                        _buildTableRow(['🚗 By Car', 'Access via Arles or Saintes-Maries-de-la-Mer']),
                        _buildTableRow(['🐎 Horseback', 'The essential exploration to the rhythm of Camargue horses']),
                        _buildTableRow(['🚲 Bicycle', 'Flat trails through marshes and rice fields']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', roseCamargue),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/7.webp'),
                          _buildGalleryImage('assets/ima/8.webp'),
                          _buildGalleryImage('assets/ima/10.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', roseCamargue),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.brightness_5, "Sunrise/Sunset: Camargue skies are legendary for their purple hues.", roseCamargue),
                          _buildTechRow(Icons.bug_report, "Strong repellent: mosquitoes are omnipresent in wetland areas.", roseCamargue),
                          _buildTechRow(Icons.camera_alt, "Bring a telephoto lens: wildlife (flamingos, horses) is kept at a distance to preserve the peace.", roseCamargue),
                          _buildTechRow(Icons.directions_bike, "Do not leave the marked trails to protect fragile ecosystems.", roseCamargue),
                          _buildTechRow(Icons.wb_sunny, "The sun reflects on the water: sunglasses and sunscreen are mandatory.", roseCamargue),
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