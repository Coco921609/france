import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDAnnecyPage extends StatefulWidget {
  const LacDAnnecyPage({super.key});

  @override
  State<LacDAnnecyPage> createState() => _LacDAnnecyPageState();
}

class _LacDAnnecyPageState extends State<LacDAnnecyPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu Cyan (Les eaux cristallines du lac)
    const Color bleuAnnecy = Color(0xFF00ACC1);

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
                'assets/imag/20.webp',
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
                      "Lake Annecy 🌊",
                      style: GoogleFonts.cinzel(
                        color: bleuAnnecy,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Location", "Auvergne-Rhône-Alpes (Haute-Savoie)", bleuAnnecy),
                    _buildFactLine("Type", "Glacial origin lake", bleuAnnecy),
                    _buildFactLine("Resembles", "Lake Bled (Slovenia 🇸🇮)", bleuAnnecy),

                    const SizedBox(height: 25),
                    Text(
                      "💎 The purest lake in Europe",
                      style: GoogleFonts.montserrat(
                        color: bleuAnnecy.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Nicknamed the 'blue lake', Lake Annecy is a gem nestled in the heart of the Alps. Thanks to major preservation efforts, its crystal-clear waters are now considered the purest in Europe. Between summer swimming, paragliding over the water, and cycling trips, it's a destination that combines mountain majesty with the sweetness of life.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Visit Options', bleuAnnecy),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Method', 'Details'], isHeader: true, hColor: bleuAnnecy),
                        _buildTableRow(['🚆 Train', 'Annecy TGV station, 10 min walk from the shores']),
                        _buildTableRow(['🚗 Car', 'A41 (Parking gets full quickly in high season)']),
                        _buildTableRow(['🚲 Bike', 'Greenway over 40 km around the lake (a must)']),
                        _buildTableRow(['🛥️ Boat', 'Lake shuttles and boat rentals without a license']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Gallery', bleuAnnecy),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/19.webp'),
                          _buildGalleryImage('assets/imag/16.jpg'),
                          _buildGalleryImage('assets/imag/18.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Survival Tips', bleuAnnecy),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.pedal_bike, "Rent a bike early in the morning to avoid the crowd on the track", bleuAnnecy),
                          _buildTechRow(Icons.paragliding, "Col de la Forclaz: the best spot for a first flight", bleuAnnecy),
                          _buildTechRow(Icons.pool, "Water reaches 24°C in summer, perfect for swimming (equipped beaches)", bleuAnnecy),
                          _buildTechRow(Icons.sunny, "Strong reflection on the water: sunglasses and sunscreen are mandatory", bleuAnnecy),
                          _buildTechRow(Icons.directions_boat, "Prefer electric boats or pedal boats to preserve the calm", bleuAnnecy),
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