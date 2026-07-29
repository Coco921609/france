import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CirqueNavacellesPage extends StatefulWidget {
  const CirqueNavacellesPage({super.key});

  @override
  State<CirqueNavacellesPage> createState() => _CirqueNavacellesPageState();
}

class _CirqueNavacellesPageState extends State<CirqueNavacellesPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Gris calcaire / Vert canyon
    const Color navacellesColor = Color(0xFF7F8C8D);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/ima/26.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU
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
                      'Cirque de Navacelles 🍃',
                      style: GoogleFonts.cinzel(
                        color: navacellesColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Location", "Gard / Hérault (Cévennes)", navacellesColor),
                    _buildFactLine("Structure", "Fossil meander of the Vis canyon", navacellesColor),
                    _buildFactLine("Resembles", "Verdon Canyon (France 🇫🇷)", navacellesColor),

                    const SizedBox(height: 25),
                    Text(
                      "🌊 The masterpiece carved by the river",
                      style: GoogleFonts.montserrat(
                        color: navacellesColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A former meander of the Vis river, the Cirque de Navacelles is a unique geological site. By cutting into the limestone, the river abandoned its old bed to create this spectacular natural amphitheater. The village of Navacelles, nestled in the heart of this cirque, seems protected from time by its high, steep walls.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Visit Options', navacellesColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Method', 'Details'], isHeader: true, hColor: navacellesColor),
                        _buildTableRow(['🚗 Car', 'Blandas belvederes for a panoramic view']),
                        _buildTableRow(['🥾 Hiking', 'Steep trails descending towards the river (Vis)']),
                        _buildTableRow(['🚲 Bike', 'Routes on the Larzac plateau']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Gallery', navacellesColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/26.jpg'),
                          _buildGalleryImage('assets/ima/25.jpg'),
                          _buildGalleryImage('assets/ima/28.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Survival Tips', navacellesColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_alt, "Belvederes: don't miss the Blandas viewpoints, essential to understand the scale of the cirque.", navacellesColor),
                          _buildTechRow(Icons.terrain, "Descent: the climb back up from the village is strenuous, bring good shoes.", navacellesColor),
                          _buildTechRow(Icons.waves, "The Vis: the waters are refreshing, a moment of pure calm at the bottom of the cirque.", navacellesColor),
                          _buildTechRow(Icons.sunny, "Shade: the walls create shaded areas, but the plateau is exposed to intense sun.", navacellesColor),
                          _buildTechRow(Icons.directions_car, "Parking: very busy in summer, prefer an early arrival.", navacellesColor),
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