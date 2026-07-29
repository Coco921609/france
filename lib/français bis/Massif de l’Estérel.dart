import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MassifEsterelPage extends StatefulWidget {
  const MassifEsterelPage({super.key});

  @override
  State<MassifEsterelPage> createState() => _MassifEsterelPageState();
}

class _MassifEsterelPageState extends State<MassifEsterelPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Rouge Estérel (Roches volcaniques)
    const Color rougeEsterel = Color(0xFFC0392B);

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
                'assets/ima/14.jpg',
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
                      'Massif de l’Estérel 🌋',
                      style: GoogleFonts.cinzel(
                        color: rougeEsterel,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Var / Alpes-Maritimes", rougeEsterel),
                    _buildFactLine("Structure", "Massif volcanique en porphyre rouge", rougeEsterel),
                    _buildFactLine("Air de", "Calanques de Piana (Corse 🇨🇵)", rougeEsterel),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 Un contraste flamboyant sur la Méditerranée",
                      style: GoogleFonts.montserrat(
                        color: rougeEsterel.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Le Massif de l'Estérel est un joyau géologique où la roche rouge volcanique sculpte des falaises découpées tombant à pic dans une mer d'un bleu profond. Ce massif offre un panorama saisissant, mêlant sentiers de randonnée boisés, criques secrètes et vues imprenables sur le littoral azuréen.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', rougeEsterel),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: rougeEsterel),
                        _buildTableRow(['🚗 Voiture', 'Corniche d\'Or (D6098) - vue panoramique']),
                        _buildTableRow(['🥾 Randonnée', 'Sentiers balisés vers le Cap Roux ou le Pic de l\'Ours']),
                        _buildTableRow(['🛶 Kayak', 'Exploration des criques inaccessibles par la terre']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', rougeEsterel),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/12.jpg'),
                          _buildGalleryImage('assets/ima/15.jpg'),
                          _buildGalleryImage('assets/ima/16.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', rougeEsterel),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_twilight, "Lumière : les roches rouges deviennent incandescentes à l'heure dorée.", rougeEsterel),
                          _buildTechRow(Icons.fire_truck, "Prévention : accès interdit par fort vent (risque incendie) - vérifiez la météo.", rougeEsterel),
                          _buildTechRow(Icons.water_drop, "Hydratation : le massif est très sec, prévoyez une réserve d'eau conséquente.", rougeEsterel),
                          _buildTechRow(Icons.terrain, "Chaussures : terrain rocheux et glissant, prévoyez de bonnes chaussures de marche.", rougeEsterel),
                          _buildTechRow(Icons.photo_camera, "Point de vue : ne manquez pas le panorama depuis le sommet du Pic de l'Ours.", rougeEsterel),
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