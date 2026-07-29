import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuTarnPage extends StatefulWidget {
  const GorgesDuTarnPage({super.key});

  @override
  State<GorgesDuTarnPage> createState() => _GorgesDuTarnPageState();
}

class _GorgesDuTarnPageState extends State<GorgesDuTarnPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Ocre/Rivière (Calcaire des falaises et eaux vives)
    const Color ocreTarn = Color(0xFFD35400);

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
                'assets/imag/35.webp',
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
                      'Gorges du Tarn 🛶',
                      style: GoogleFonts.cinzel(
                        color: ocreTarn,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Occitanie (Lozère)", ocreTarn),
                    _buildFactLine("Type", "Canyon creusé par la rivière Tarn", ocreTarn),
                    _buildFactLine("Air de", "Grand Canyon (USA 🇺🇸)", ocreTarn),

                    const SizedBox(height: 25),
                    Text(
                      "🏔️ Le canyon majestueux entre Causses et Cévennes",
                      style: GoogleFonts.montserrat(
                        color: ocreTarn.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Longues de 53 kilomètres, les Gorges du Tarn offrent un spectacle naturel époustouflant. Entre les falaises calcaires vertigineuses du Causse Méjean et celles du Causse de Sauveterre, la rivière Tarn serpente dans une vallée préservée, classée au patrimoine mondial de l'UNESCO. Un lieu unique pour les amateurs d'aventure et de paysages grandioses.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', ocreTarn),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: ocreTarn),
                        _buildTableRow(['🚗 Voiture', 'Route panoramique longeant le Tarn (étroite par endroits)']),
                        _buildTableRow(['🛶 Canoë', 'Location à La Malène ou les Vignes : indispensable']),
                        _buildTableRow(['🥾 Marche', 'Sentiers spectaculaires au départ des villages troglodytes']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', ocreTarn),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/36.jpg'),
                          _buildGalleryImage('assets/imag/37.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', ocreTarn),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.kayaking, "Descente en canoë : réservez la journée entière pour profiter du calme", ocreTarn),
                          _buildTechRow(Icons.castle, "Visitez les villages classés comme Castelbouc ou Sainte-Enimie", ocreTarn),
                          _buildTechRow(Icons.wb_sunny, "Fortes chaleurs : les roches chauffent énormément en été, protégez-vous", ocreTarn),
                          _buildTechRow(Icons.camera_alt, "Le point de vue du Point Sublime est incontournable au coucher du soleil", ocreTarn),
                          _buildTechRow(Icons.hiking, "Randonnée : les sentiers d'éboulement peuvent être fermés, vérifiez l'office de tourisme", ocreTarn),
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