import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanquesDePianaPage extends StatefulWidget {
  const CalanquesDePianaPage({super.key});

  @override
  State<CalanquesDePianaPage> createState() => _CalanquesDePianaPageState();
}

class _CalanquesDePianaPageState extends State<CalanquesDePianaPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Rouge/Orangé (Roches de Piana)
    const Color rougePiana = Color(0xFFE67E22);

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
                'assets/image/42.jpg', // À ajuster selon votre asset
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
                      'Calanques de Piana ⛰️',
                      style: GoogleFonts.cinzel(
                        color: rougePiana,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Corse (Golfe de Porto)", rougePiana),
                    _buildFactLine("Formation", "Roche granitique rouge", rougePiana),
                    _buildFactLine("Air de", "Canyon de Bryce (USA 🇺🇸)", rougePiana),

                    const SizedBox(height: 25),
                    Text(
                      "🔥 Le sanctuaire de granit rouge",
                      style: GoogleFonts.montserrat(
                        color: rougePiana.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Classées au patrimoine mondial de l'UNESCO, les Calanques de Piana forment un paysage grandiose de roches granitiques sculptées par l'érosion. Entre le bleu profond du Golfe de Porto et les flammes rouges de la roche, ce site offre un spectacle naturel inoubliable.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', rougePiana),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: rougePiana),
                        _buildTableRow(['🚗 Voiture', 'Route D81, points de vue panoramiques']),
                        _buildTableRow(['🥾 Randonnée', 'Sentier du Château Fort (incontournable)']),
                        _buildTableRow(['🚢 Bateau', 'Excursions depuis Porto ou Cargèse']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', rougePiana),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/43.webp'),
                          _buildGalleryImage('assets/image/44.webp'),
                          _buildGalleryImage('assets/image/47.webp'),
                          _buildGalleryImage('assets/image/45.jpg'),
                          _buildGalleryImage('assets/image/48.jpg'),
                          _buildGalleryImage('assets/image/49.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', rougePiana),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny, "Fort ensoleillement, protégez-vous !", rougePiana),
                          _buildTechRow(Icons.directions_car, "Route étroite, prudence en croisant", rougePiana),
                          _buildTechRow(Icons.camera_alt, "Privilégiez le coucher de soleil", rougePiana),
                          _buildTechRow(Icons.hiking, "Chaussures de marche obligatoires", rougePiana),
                          _buildTechRow(Icons.delete_outline, "Zéro déchet : site protégé 🙏", rougePiana),
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