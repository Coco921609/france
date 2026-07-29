import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AltschlossfelsenPage extends StatefulWidget {
  const AltschlossfelsenPage({super.key});

  @override
  State<AltschlossfelsenPage> createState() => _AltschlossfelsenPageState();
}

class _AltschlossfelsenPageState extends State<AltschlossfelsenPage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color gresRouge = Color(0xFFC0392B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/images/altschlossfelsen-23-von-98.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU (Remonté légèrement pour le design)
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
                      'Altschlossfelsen 🧗',
                      style: GoogleFonts.cinzel(
                        color: gresRouge,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- ARROW TRANSLATION ---
                    _buildTranslationLine("Alt", "Old / Ancient", gresRouge),
                    _buildTranslationLine("Schloss", "Castle", gresRouge),
                    _buildTranslationLine("Felsen", "Rock", gresRouge),

                    const SizedBox(height: 25),
                    Text(
                      "🇺🇸 The hidden Arizona in the Pays de Bitche",
                      style: GoogleFonts.montserrat(
                        color: gresRouge.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Located in the Pays de Bitche, on the Franco-German border, Altschlossfelsen is a red sandstone rock ledge nearly 1.5 km long. With its cavities and flamboyant colors, it feels like being in the middle of an Arizona canyon.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SEASONS TABLE
                    _buildSectionTitle('📅 Best seasons'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Season', 'Atmosphere & Colors'], isHeader: true, hColor: gresRouge),
                        _buildTableRow(['🍂 Autumn', 'Fire colors and golden leaves']),
                        _buildTableRow(['🌱 Spring', 'Pure air and forest awakening']),
                        _buildTableRow(['☀️ Summer', 'Coolness beneath the sandstone walls']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // SCHEDULE TABLE
                    _buildSectionTitle('⏰ Recommended times'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Time', 'Advice'], isHeader: true, hColor: gresRouge),
                        _buildTableRow(['✨ Morning', 'Soft light on the cliffs']),
                        _buildTableRow(['☀️ Noon', 'Welcome shade at the base of the rock']),
                        _buildTableRow(['🌅 Evening', 'The sandstone turns blood red at sunset']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // PHOTO GALLERY
                    _buildSectionTitle('📸 Preview of the place'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/ev-1122-wanderarena-pfa-lzerwald-nordvogesen-03.jpg'),
                          _buildGalleryImage('assets/images/altschlossfelsen-pfaelzerwald-tipps-tolle-wanderung.jpg'),
                          _buildGalleryImage('assets/images/Wanderung-Altschlossfelsen-768x576.jpg'),
                          _buildGalleryImage('assets/images/altschlossfelsen-23-von-98.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // PRACTICAL INFO
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
                          _buildTechRow(Icons.map_outlined, "Located in Pays de Bitche (Moselle)", gresRouge),
                          _buildTechRow(Icons.directions_walk, "Hike of about 2 to 3 hours", gresRouge),
                          _buildTechRow(Icons.photo_camera, "Camera: Take photos of the canyon", gresRouge),
                          _buildTechRow(Icons.camera_alt, "Beautiful in autumn", gresRouge),
                          _buildTechRow(Icons.air, "Spring: fresh and pure air", gresRouge),
                          _buildTechRow(Icons.flag_outlined, "Franco-German border", gresRouge),
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

  // --- STYLE METHODS ---

  Widget _buildTranslationLine(String ger, String en, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Text(en, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
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

  Widget _buildSectionTitle(String title) {
    return Text(title, style: GoogleFonts.cinzel(color: const Color(0xFFC0392B), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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