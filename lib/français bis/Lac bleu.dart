import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacBleuPage extends StatefulWidget {
  const LacBleuPage({super.key});

  @override
  State<LacBleuPage> createState() => _LacBleuPageState();
}

class _LacBleuPageState extends State<LacBleuPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu Saphir (La couleur intense et profonde du lac)
    const Color bleuSaphir = Color(0xFF1976D2);

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
                'assets/imag/33.jpeg',
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
                      'Lac Bleu 💙',
                      style: GoogleFonts.cinzel(
                        color: bleuSaphir,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Occitanie (Hautes-Pyrénées)", bleuSaphir),
                    _buildFactLine("Type", "Lac d'origine glaciaire (1947m)", bleuSaphir),
                    _buildFactLine("Air de", "Lac Moraine (Canada 🇨🇦)", bleuSaphir),

                    const SizedBox(height: 25),
                    Text(
                      "💎 Le joyau saphir de la vallée de Lesponne",
                      style: GoogleFonts.montserrat(
                        color: bleuSaphir.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Avec ses 120 mètres de fond, le Lac Bleu est le lac le plus profond des Pyrénées françaises. Niché à près de 2000 mètres d'altitude, il doit son nom à la couleur bleu saphir incroyablement intense de ses eaux. Entouré de crêtes vertigineuses, c'est une destination mythique qui se mérite après une ascension exigeante.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', bleuSaphir),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: bleuSaphir),
                        _buildTableRow(['🚗 Voiture', 'Jusqu\'au parking du Chiroulet, point de départ de l\'ascension.']),
                        _buildTableRow(['🥾 Randonnée', 'Environ 2h30 à 3h de montée raide (+900m de dénivelé).']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', bleuSaphir),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/31.webp'),
                          _buildGalleryImage('assets/imag/30.webp'),
                          _buildGalleryImage('assets/imag/34.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', bleuSaphir),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking, "Exigeant : la montée est longue et rocailleuse, partez équipés.", bleuSaphir),
                          _buildTechRow(Icons.not_interested, "Baignade interdite (l'eau sert de réservoir pour la vallée et reste glaciale).", bleuSaphir),
                          _buildTechRow(Icons.wb_cloudy, "Partez à la fraîche le matin, l'ascension est très exposée au soleil.", bleuSaphir),
                          _buildTechRow(Icons.ac_unit, "Attention aux névés en début de saison (jusqu'en juin/juillet).", bleuSaphir),
                          _buildTechRow(Icons.landscape, "Possibilité de prolonger vers le Lac Vert en faisant une boucle.", bleuSaphir),
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