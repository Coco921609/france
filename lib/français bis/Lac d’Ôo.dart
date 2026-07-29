import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDooPage extends StatefulWidget {
  const LacDooPage({super.key});

  @override
  State<LacDooPage> createState() => _LacDooPageState();
}

class _LacDooPageState extends State<LacDooPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu Alpin (Eaux de fonte et lacs de montagne)
    const Color bleuAlpin = Color(0xFF2874A6);

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
                'assets/imag/4.webp',
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
                      "Lac d'Ôo 💧",
                      style: GoogleFonts.cinzel(
                        color: bleuAlpin,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Occitanie (Haute-Garonne, Pyrénées)", bleuAlpin),
                    _buildFactLine("Type", "Lac d'origine glaciaire et barrage", bleuAlpin),
                    _buildFactLine("Air de", "Lac de Braies (Dolomites 🇮🇹)", bleuAlpin),

                    const SizedBox(height: 25),
                    Text(
                      "🏔️ Un joyau pyrénéen sublimé par l'automne",
                      style: GoogleFonts.montserrat(
                        color: bleuAlpin.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Célèbre pour sa vertigineuse cascade de 275 mètres de haut, le Lac d'Ôo est une randonnée incontournable des Pyrénées. Ce site exceptionnel est tout particulièrement recommandé en automne : les forêts environnantes se parent alors de magnifiques couleurs chaudes, offrant un contraste saisissant et féérique avec le bleu profond de l'eau.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', bleuAlpin),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: bleuAlpin),
                        _buildTableRow(['🚗 Voiture', 'Parking gratuit aux Granges d\'Astau (point de départ)']),
                        _buildTableRow(['🥾 Randonnée', 'Via le GR10 (environ 1h à 1h30 de montée accessible)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', bleuAlpin),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/3.jpg'),
                          _buildGalleryImage('assets/imag/5.webp'),
                          _buildGalleryImage('assets/imag/2.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', bleuAlpin),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.park, "L'automne est magique : couleurs des arbres sublimes", bleuAlpin),
                          _buildTechRow(Icons.hiking, "Chaussures de rando conseillées (chemin caillouteux)", bleuAlpin),
                          _buildTechRow(Icons.ac_unit, "Météo de montagne : prévoyez un vêtement chaud", bleuAlpin),
                          _buildTechRow(Icons.not_interested, "Baignade interdite (lac de barrage et eau très froide)", bleuAlpin),
                          _buildTechRow(Icons.restaurant, "Refuge au bord du lac pour une pause bien méritée", bleuAlpin),
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