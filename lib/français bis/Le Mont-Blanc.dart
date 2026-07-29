import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontBlancPage extends StatefulWidget {
  const MontBlancPage({super.key});

  @override
  State<MontBlancPage> createState() => _MontBlancPageState();
}

class _MontBlancPageState extends State<MontBlancPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Blanc givré / Gris Acier
    const Color blancMont = Color(0xFFE0E0E0);

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
                'assets/imag/43.webp',
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
                      'Le Mont-Blanc 🏔️',
                      style: GoogleFonts.cinzel(
                        color: blancMont,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Haute-Savoie (Massif du Mont-Blanc)", blancMont),
                    _buildFactLine("Altitude", "4 805 mètres", blancMont),
                    _buildFactLine("Air de", "Le Cervin (Suisse/Italie 🇨🇭)", blancMont),

                    const SizedBox(height: 25),
                    Text(
                      "❄️ Le toit éternel de l'Europe",
                      style: GoogleFonts.montserrat(
                        color: blancMont.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Point culminant de la chaîne des Alpes, le Mont-Blanc est un mythe vivant pour les alpinistes du monde entier. Symbole de la puissance de la haute montagne, ses glaciers, dont la célèbre Mer de Glace, et ses dômes de neige offrent un panorama à couper le souffle, visible depuis Chamonix, la capitale mondiale de l'alpinisme.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS
                    _buildSectionTitle('🚗 Options de visite', blancMont),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moyen', 'Détails'], isHeader: true, hColor: blancMont),
                        _buildTableRow(['🚠 Téléphérique', 'L\'Aiguille du Midi : le plus proche du sommet sans effort']),
                        _buildTableRow(['🚂 Train', 'Le Tramway du Mont-Blanc : train à crémaillère mythique']),
                        _buildTableRow(['🥾 Alpinisme', 'Expédition de haute montagne (guide impératif)']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', blancMont),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/imag/42.jpg'),
                          _buildGalleryImage('assets/imag/44.webp'),
                          _buildGalleryImage('assets/imag/45.jpeg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Conseils de survie', blancMont),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_twilight, "Lever/Coucher : le moment où le Mont-Blanc prend sa teinte rose/orangée (l'alpenglow).", blancMont),
                          _buildTechRow(Icons.ac_unit, "Très haute altitude : protégez-vous du froid extrême même en plein été.", blancMont),
                          _buildTechRow(Icons.filter_hdr, "L'Aiguille du Midi : vertige garanti à 3842 mètres.", blancMont),
                          _buildTechRow(Icons.sunny, "Réverbération solaire intense sur la neige : lunettes de soleil catégorie 4 obligatoires.", blancMont),
                          _buildTechRow(Icons.health_and_safety, "Ne sous-estimez jamais la météo en haute montagne, elle change en quelques minutes.", blancMont),
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