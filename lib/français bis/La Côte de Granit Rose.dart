import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoteGranitRosePage extends StatefulWidget {
  const CoteGranitRosePage({super.key});

  @override
  State<CoteGranitRosePage> createState() => _CoteGranitRosePageState();
}

class _CoteGranitRosePageState extends State<CoteGranitRosePage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Rose Granite / Bleu Mer
    const Color granitRoseColor = Color(0xFFE5989B);

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
                'assets/ima/34.jpg',
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
                      'Côte de Granit Rose ⚓',
                      style: GoogleFonts.cinzel(
                        color: granitRoseColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Côtes-d'Armor (Bretagne)", granitRoseColor),
                    _buildFactLine("Structure", "Rochers de granit aux teintes rosées", granitRoseColor),
                    _buildFactLine("Air de", "Seychelles (Afrique 🇸🇨)", granitRoseColor),

                    const SizedBox(height: 25),
                    Text(
                      "🪨 Un chaos minéral façonné par les vents",
                      style: GoogleFonts.montserrat(
                        color: granitRoseColor.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "La Côte de Granit Rose est l'un des paysages les plus emblématiques de Bretagne. Entre Ploumanac'h et Trébeurden, d'énormes rochers aux formes étranges et aux nuances de rose uniques plongent dans une eau turquoise. C’est un spectacle permanent où la force de l’océan rencontre la rudesse de la terre bretonne.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', granitRoseColor),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: granitRoseColor),
                        _buildTableRow(['🥾 Marche', 'Sentier des Douaniers (GR34) pour la meilleure vue']),
                        _buildTableRow(['🚗 Voiture', 'Parkings à Ploumanac\'h (très prisés en saison)']),
                        _buildTableRow(['⛵ Mer', 'Tour en bateau pour voir les rochers sous un autre angle']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Galerie', granitRoseColor),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/ima/35.webp'),
                          _buildGalleryImage('assets/ima/36.webp'),
                          _buildGalleryImage('assets/ima/37.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', granitRoseColor),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.brightness_medium, "Lumière : les rochers sont magnifiques au coucher du soleil, quand le rose s'intensifie.", granitRoseColor),
                          _buildTechRow(Icons.hiking, "GR34 : le tronçon entre Ploumanac'h et le phare est incontournable.", granitRoseColor),
                          _buildTechRow(Icons.waves, "Marées : les rochers offrent des visages différents selon le niveau de la mer.", granitRoseColor),
                          _buildTechRow(Icons.wind_power, "Vent : le bord de mer est exposé, prévoyez toujours une veste même par beau temps.", granitRoseColor),
                          _buildTechRow(Icons.directions_walk, "Respect : restez sur les chemins balisés, la végétation côtière est très fragile.", granitRoseColor),
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