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
                      "Lac d'Annecy 🌊",
                      style: GoogleFonts.cinzel(
                        color: bleuAnnecy,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Auvergne-Rhône-Alpes (Haute-Savoie)", bleuAnnecy),
                    _buildFactLine("Type", "Lac d'origine glaciaire", bleuAnnecy),
                    _buildFactLine("Air de", "Lac de Bled (Slovénie 🇸🇮)", bleuAnnecy),

                    const SizedBox(height: 25),
                    Text(
                      "💎 Le lac le plus pur d'Europe",
                      style: GoogleFonts.montserrat(
                        color: bleuAnnecy.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Surnommé le « lac bleu », le Lac d'Annecy est un joyau située au cœur des Alpes. Grâce à des efforts de préservation majeurs, ses eaux cristallines sont aujourd'hui considérées comme les plus pures d'Europe. Entre baignade estivale, parapente au-dessus de l'eau et balades à vélo, c'est une destination qui allie majesté montagnarde et douceur de vivre.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', bleuAnnecy),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: bleuAnnecy),
                        _buildTableRow(['🚆 Train', 'Gare TGV d\'Annecy, à 10 min à pied des rives']),
                        _buildTableRow(['🚗 Voiture', 'A41 (Parkings vite saturés en haute saison)']),
                        _buildTableRow(['🚲 Vélo', 'Voie verte de plus de 40 km autour du lac (incontournable)']),
                        _buildTableRow(['🛥️ Bateau', 'Navettes lacustres et locations de bateaux sans permis']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', bleuAnnecy),
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
                    _buildSectionTitle('📋 Conseils de survie', bleuAnnecy),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.pedal_bike, "Louez un vélo tôt le matin pour éviter la foule sur la piste", bleuAnnecy),
                          _buildTechRow(Icons.paragliding, "Col de la Forclaz : le meilleur spot pour un baptême de l'air", bleuAnnecy),
                          _buildTechRow(Icons.pool, "L'eau atteint 24°C en été, parfait pour la baignade (plages aménagées)", bleuAnnecy),
                          _buildTechRow(Icons.sunny, "Réverbération très forte sur l'eau : lunettes et crème solaire obligatoires", bleuAnnecy),
                          _buildTechRow(Icons.directions_boat, "Privilégiez les bateaux électriques ou pédalos pour préserver le calme", bleuAnnecy),
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