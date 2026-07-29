import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReserveScandolaPage extends StatefulWidget {
  const ReserveScandolaPage({super.key});

  @override
  State<ReserveScandolaPage> createState() => _ReserveScandolaPageState();
}

class _ReserveScandolaPageState extends State<ReserveScandolaPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Sea blue / Volcanic rock red
    const Color scandolaColor = Color(0xFF4A90E2);

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
                'assets/ima/39.jpg',
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
                      'Scandola Reserve 🐠',
                      style: GoogleFonts.cinzel(
                        color: scandolaColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Corsica (Regional Natural Park)", scandolaColor),
                    _buildFactLine("Structure", "Marine and terrestrial reserve", scandolaColor),
                    _buildFactLine("Looks like", "Earthly paradise (UNESCO 🌍)", scandolaColor),

                    const SizedBox(height: 25),
                    Text(
                      "🌋 The fascinating union of fire and water",
                      style: GoogleFonts.montserrat(
                        color: scandolaColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Scandola Nature Reserve is a geological and biological masterpiece. Its red porphyry cliffs plunge into protected crystal-clear waters, offering a sanctuary for ospreys and exceptional marine biodiversity. A wild site where access is strictly regulated to preserve the integrity of the ecosystem.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', scandolaColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: scandolaColor),
                        _buildTableRow(['🛥️ Boat', 'Excursions departing from Calvi, Galéria, or Porto']),
                        _buildTableRow(['🤿 Diving', 'Authorized zones on the periphery of the reserve']),
                        _buildTableRow(['🚫 Access', 'Pedestrian access prohibited in the integral reserve']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', scandolaColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/41.webp'),
                          _buildGalleryImage('assets/ima/50.jpg'),
                          _buildGalleryImage('assets/ima/44.webp'),
                          _buildGalleryImage('assets/ima/45.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', scandolaColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.eco, "Protection: the zone is protected, no removal (plants, stones, shells) is authorized.", scandolaColor),
                          _buildTechRow(Icons.camera_alt, "Photo: the contrasts between the red of the rock and the blue of the sea are perfect for shots.", scandolaColor),
                          _buildTechRow(Icons.directions_boat, "Booking: book your boat trips in advance, especially in July and August.", scandolaColor),
                          _buildTechRow(Icons.waves, "Observation: keep your distance from marine wildlife, respect the silence.", scandolaColor),
                          _buildTechRow(Icons.wb_sunny, "Weather: in case of rough seas, trips are canceled, stay flexible.", scandolaColor),
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