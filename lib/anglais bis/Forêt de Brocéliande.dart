import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetDeBroceliandePage extends StatefulWidget {
  const ForetDeBroceliandePage({super.key});

  @override
  State<ForetDeBroceliandePage> createState() => _ForetDeBroceliandePageState();
}

class _ForetDeBroceliandePageState extends State<ForetDeBroceliandePage> {
  @override
  Widget build(BuildContext context) {
    // Theme color: Emerald Green (Legendary forest)
    const Color vertEmeraude = Color(0xFF27AE60);

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
                'assets/image/55.jpg',
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
                      'Brocéliande Forest 🌳',
                      style: GoogleFonts.cinzel(
                        color: vertEmeraude,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Brittany (Ille-et-Vilaine)", vertEmeraude),
                    _buildFactLine("Atmosphere", "Mythical and magical", vertEmeraude),
                    _buildFactLine("Legend", "Merlin the Wizard and the Fairy Viviane", vertEmeraude),

                    const SizedBox(height: 25),
                    Text(
                      "✨ The realm of Arthurian legends",
                      style: GoogleFonts.montserrat(
                        color: vertEmeraude.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Plunge into the heart of Breton mystery. Brocéliande Forest, famous for its connections to Arthurian legends, invites you to meditate among centuries-old oaks, secret ponds, and stones steeped in history. A place where reality and the marvelous meet.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // ACCESS TABLE
                    _buildSectionTitle('🚗 Visiting options', vertEmeraude),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Option', 'Details'], isHeader: true, hColor: vertEmeraude),
                        _buildTableRow(['🚗 By Car', 'Access via Paimpont (D773)']),
                        _buildTableRow(['🥾 Hiking', 'Marked trails of the Gateway to Secrets']),
                        _buildTableRow(['🚲 Bicycle', 'Greenways crossing the forest']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Gallery', vertEmeraude),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/52.jpeg'),
                          _buildGalleryImage('assets/image/53.jpg'),
                          _buildGalleryImage('assets/image/54.jpg'),
                          _buildGalleryImage('assets/image/56.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
                    _buildSectionTitle('📋 Survival tips', vertEmeraude),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_cloudy, "Breton climate: bring a jacket", vertEmeraude),
                          _buildTechRow(Icons.directions_walk, "Stay on marked trails", vertEmeraude),
                          _buildTechRow(Icons.mosque, "Respect the peace of sacred places", vertEmeraude),
                          _buildTechRow(Icons.camera_alt, "Magical light at dawn", vertEmeraude),
                          _buildTechRow(Icons.delete_outline, "Leave no trace: the fairy thanks you", vertEmeraude),
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