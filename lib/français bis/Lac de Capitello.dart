import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDeCapitelloPage extends StatefulWidget {
  const LacDeCapitelloPage({super.key});

  @override
  State<LacDeCapitelloPage> createState() => _LacDeCapitelloPageState();
}

class _LacDeCapitelloPageState extends State<LacDeCapitelloPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu Profond (Eaux glaciaires et granit corse)
    const Color bleuCapitello = Color(0xFF1B4F72);

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
                'assets/imag/9.jpg',
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
                      'Lac de Capitello ⛰️',
                      style: GoogleFonts.cinzel(
                        color: bleuCapitello,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Corse (Vallée de la Restonica)", bleuCapitello),
                    _buildFactLine("Type", "Lac d'origine glaciaire (1930m d'altitude)", bleuCapitello),
                    _buildFactLine("Air de", "Lac de Sorapis (Dolomites 🇮🇹)", bleuCapitello),

                    const SizedBox(height: 25),
                    Text(
                      "❄️ L'écrin de glace des montagnes corses",
                      style: GoogleFonts.montserrat(
                        color: bleuCapitello.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Perché à plus de 1900 mètres d'altitude, le Lac de Capitello est le plus profond de Corse. Entouré par des vertigineuses falaises de granit qui plongent à pic dans ses eaux bleu encre, ce lac glaciaire reste souvent gelé jusqu'au début de l'été. Une récompense spectaculaire pour les randonneurs avertis.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', bleuCapitello),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: bleuCapitello),
                        _buildTableRow(['🚗 Voiture', 'Jusqu\'aux Bergeries de Grotelle (Parking payant, route étroite)']),
                        _buildTableRow(['🥾 Randonnée', 'Depuis le Lac de Melo : montée abrupte (environ 45 min supplémentaires)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', bleuCapitello),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/7.jpg'),
                          _buildGalleryImage('assets/imag/8.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', bleuCapitello),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking, "Niveau difficile : passages équipés de chaînes et d'échelles", bleuCapitello),
                          _buildTechRow(Icons.snowing, "Névés possibles jusqu'en juillet, soyez prudents", bleuCapitello),
                          _buildTechRow(Icons.not_interested, "Baignade strictement déconseillée (eau glaciale)", bleuCapitello),
                          _buildTechRow(Icons.water_drop, "Prévoyez beaucoup d'eau, aucune source après Melo", bleuCapitello),
                          _buildTechRow(Icons.wb_cloudy, "Partez tôt le matin : les orages sont fréquents l'après-midi", bleuCapitello),
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