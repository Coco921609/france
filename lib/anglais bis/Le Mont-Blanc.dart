import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontBlancPage extends StatefulWidget {
  const MontBlancPage({super.key});

  @override
  State<MontBlancPage> createState() => _MontBlancPageState();
}

class _MontBlancPageState extends State<MontBlancPage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Frosty white / Steel gray
    const Color blancMont = Color(0xFFE0E0E0);

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
                'assets/imag/43.webp',
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
                      'Mont Blanc 🏔️',
                      style: GoogleFonts.cinzel(
                        color: blancMont,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Haute-Savoie (Mont Blanc Massif)", blancMont),
                    _buildFactLine("Altitude", "4,805 meters", blancMont),
                    _buildFactLine("Looks like", "The Matterhorn (Switzerland/Italy 🇨🇭)", blancMont),

                    const SizedBox(height: 25),
                    Text(
                      "❄️ The eternal roof of Europe",
                      style: GoogleFonts.montserrat(
                        color: blancMont.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The highest point in the Alps, Mont Blanc is a living myth for mountaineers from all over the world. A symbol of the power of high mountains, its glaciers, including the famous Mer de Glace, and its snow-capped domes offer a breathtaking panorama, visible from Chamonix, the world capital of mountaineering.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', blancMont),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: blancMont),
                        _buildTableRow(['🚠 Cable Car', 'Aiguille du Midi: the closest to the summit without effort']),
                        _buildTableRow(['🚂 Train', 'Mont Blanc Tramway: legendary rack railway']),
                        _buildTableRow(['🥾 Mountaineering', 'High mountain expedition (guide mandatory)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', blancMont),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/42.jpg'),
                          _buildGalleryImage('assets/imag/44.webp'),
                          _buildGalleryImage('assets/imag/45.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', blancMont),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_twilight, "Sunrise/Sunset: the moment Mont Blanc takes on its pink/orange hue (alpenglow).", blancMont),
                          _buildTechRow(Icons.ac_unit, "Very high altitude: protect yourself from extreme cold even in mid-summer.", blancMont),
                          _buildTechRow(Icons.filter_hdr, "Aiguille du Midi: guaranteed vertigo at 3,842 meters.", blancMont),
                          _buildTechRow(Icons.sunny, "Intense solar reflection on the snow: category 4 sunglasses are mandatory.", blancMont),
                          _buildTechRow(Icons.health_and_safety, "Never underestimate high mountain weather, it changes in minutes.", blancMont),
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